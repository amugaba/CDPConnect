<?php

include_once 'ClientVO.php';
include_once 'ConnectionManager.php';

/**

 * This sample service contains functions that illustrate typical

 * service operations. This code is for prototyping only.

 *

 * Authenticate users before allowing them to call these methods.

 */


class ClientService

{
	var $tablename = "client_tbl";
    public $connection;

    public function __construct ()
    {
		$cm = new ConnectionManager();

        $this->connection = mysqli_connect($cm->server, $cm->username,
        $cm->password, $cm->databasename, $cm->port);

        $this->throwExceptionOnError($this->connection);
    }

	/**
	 * 
	 * Get a single client by ID
	 * 
	 * @param int $autoid
	 * @return ClientVO
	 */
    public function getClientByID ($autoid)
    {
        $stmt = mysqli_prepare($this->connection, "SELECT autoid, clientid FROM client_tbl where autoid=?");
        $this->throwExceptionOnError();

        $stmt->bind_param('i', $autoid);
        $this->throwExceptionOnError();

        $stmt->execute();
        $this->throwExceptionOnError();

        $client = new ClientVO();
        $stmt->bind_result($client->autoid, $client->clientid);

        if ($stmt->fetch())
        {
	        $stmt->free_result();
	        $this->connection->close();     
        	return $client;
        }
        else 
        {
	        $this->connection->close();
	        return null;
        }
    }

	/**
	 * 
	 * Get client ID by WITS ID
	 * 
	 * @param string $witsid
	 * @return int
	 */
    public function getClientIDByWitsID ($witsid)
    {
        $stmt = mysqli_prepare($this->connection, "SELECT autoid FROM client_tbl where clientid=?");
        $this->throwExceptionOnError();

        $stmt->bind_param('s', $witsid);
        $this->throwExceptionOnError();

        $stmt->execute();
        $this->throwExceptionOnError();

        $autoid = -1;
        $stmt->bind_result($autoid);

        if ($stmt->fetch())
        {
	        $stmt->free_result();
        	return $autoid;
        }
        else 
        {
	        return null;
        }
    }

    
	public function getAllClientsArray()
	{		
		$rs = mysqli_query($this->connection, "SELECT * FROM $this->tablename");
		$this->throwExceptionOnError();
		
		$clients = array();
		while($client = mysqli_fetch_array($rs))
			array_push($clients, $client);
	    mysqli_close($this->connection);
	
	    return $clients;
	}

	/**
	 * 
	 * Create a client
	 * 
	 * @param ClientVO $item
	 * @return ClientVO
	 */
    public function createClient ($client)
    {        
        $stmt = $this->connection->prepare("INSERT IGNORE INTO client_tbl 
        (clientid) VALUES (?)");
        $this->throwExceptionOnError();

        $stmt->bind_param('s', $client->clientid);
        $this->throwExceptionOnError();

        $rs = $stmt->execute();
        $this->throwExceptionOnError();

        $client->autoid = $stmt->insert_id;
        
        $stmt->free_result();
        $this->connection->close();
        
        return $client; 
    }
    
	/**
	 * Check if a client with this ID exists
	 * 
	 * @param string $clientid
	 * @return bool
	 */
    public function clientExists($clientid)
    {        
        $stmt = $this->connection->prepare("SELECT EXISTS(SELECT 1 FROM $this->tablename WHERE clientid=?)");
    	$this->throwExceptionOnError();

        $stmt->bind_param('s',$clientid);
        $this->throwExceptionOnError();

        $stmt->execute();
        $this->throwExceptionOnError();
    	
        $clientExists = false;
        $stmt->bind_result($clientExists);
        $stmt->fetch();
        
        $stmt->free_result();
        $this->connection->close();
        
        return $clientExists;
    }
    
	/**
	 * Update a client
	 * 
	 * @param ClientVO $item
	 * @return ClientVO
	 */
    public function updateClient ($client)
    {        
        $stmt = $this->connection->prepare("UPDATE client_tbl SET
        clientid=?
        WHERE autoid=?");
        $this->throwExceptionOnError();

        $stmt->bind_param('si', $client->clientid, $client->autoid);
        $this->throwExceptionOnError();

        $rs = $stmt->execute();
        $this->throwExceptionOnError();
        
        $stmt->free_result();
        $this->connection->close();
        
        return $client; 
    }
    
	/**
	 * 
	 * Get all clients matching the search criteria
	 * 
	 * @param string $clientid
	 * @param string $intakeDate
	 * @param bool $checkDischarge
	 * @return ClientVO[]
	 */
    
    public function searchClients ($clientid, $intakeDate, $checkDischarge)
    {    
    	$clientid = str_replace("*", "%", $clientid);	
    	if(strlen($clientid) == 0 && strlen($intakeDate) == 0 && !$checkDischarge) //no search terms
    	{
    		$stmt = $this->connection->prepare("SELECT c.autoid, c.clientid, a.date FROM client_tbl c LEFT JOIN assessment_tbl a ON c.autoid=a.client_autoid AND a.subtype < 4");
    		$this->throwExceptionOnError();
    	}
    	else if(strlen($intakeDate) == 0 && !$checkDischarge) //just search clientID
    	{
	    	$stmt = $this->connection->prepare("SELECT c.autoid, c.clientid, a.date FROM client_tbl c LEFT JOIN assessment_tbl a ON c.autoid=a.client_autoid AND a.subtype < 4 WHERE c.clientid LIKE ?");
	    	$this->throwExceptionOnError();
	    	
	    	$stmt->bind_param('s', $clientid);
        	$this->throwExceptionOnError();
    	}
        else if(strlen($clientid) == 0 && !$checkDischarge) //just intakeDate
        {
        	$stmt = $this->connection->prepare("SELECT c.autoid, c.clientid, a.date FROM client_tbl c, assessment_tbl a WHERE c.autoid=a.client_autoid AND a.subtype < 4 AND a.date=?");
	    	$this->throwExceptionOnError();
	    	
	    	$stmt->bind_param('s', $intakeDate);
        	$this->throwExceptionOnError();
        }
    	else if(strlen($clientid) == 0 && strlen($intakeDate) == 0) //just checkDischarge
        {
        	$stmt = $this->connection->prepare("SELECT c.autoid, c.clientid, a.date FROM client_tbl c LEFT JOIN assessment_tbl a ON c.autoid=a.client_autoid AND a.subtype < 4 WHERE NOT EXISTS (SELECT NULL FROM assessment_tbl b WHERE c.autoid=b.client_autoid AND b.subtype>3 AND b.subtype<7)");
	    	$this->throwExceptionOnError();
        }
    	else if(!$checkDischarge) //clientID and intakeDate
        {
        	$stmt = $this->connection->prepare("SELECT c.autoid, c.clientid, a.date FROM client_tbl c, assessment_tbl a WHERE c.autoid=a.client_autoid AND c.clientid LIKE ? AND a.subtype < 4 AND a.date=?");
	    	$this->throwExceptionOnError();
	    	
	    	$stmt->bind_param('ss', $clientid, $intakeDate);
        	$this->throwExceptionOnError();
        }
    	else if(strlen($intakeDate) == 0) //clientID and checkDischarge
        {
        	$stmt = $this->connection->prepare("SELECT c.autoid, c.clientid, a.date FROM client_tbl c LEFT JOIN assessment_tbl a ON c.autoid=a.client_autoid AND a.subtype < 4 WHERE c.clientid LIKE ? AND NOT EXISTS (SELECT NULL FROM assessment_tbl b WHERE c.autoid=b.client_autoid AND b.subtype>3 AND b.subtype<7)");
	    	$this->throwExceptionOnError();
	    	
	    	$stmt->bind_param('s', $clientid);
        	$this->throwExceptionOnError();
        }
    	else if(strlen($clientid) == 0) //intakeDate and checkDischarge
        {
        	$stmt = $this->connection->prepare("SELECT c.autoid, c.clientid, a.date FROM client_tbl c, assessment_tbl a WHERE c.autoid=a.client_autoid AND a.subtype < 4 AND a.date=? 
        		AND NOT EXISTS (SELECT NULL FROM assessment_tbl b WHERE c.autoid=b.client_autoid AND b.subtype>3 AND b.subtype<7)");
	    	$this->throwExceptionOnError();
	    	
	    	$stmt->bind_param('s', $intakeDate);
        	$this->throwExceptionOnError();
        }
    	else //all three
        {
        	$stmt = $this->connection->prepare("SELECT c.autoid, c.clientid, a.date FROM client_tbl c, assessment_tbl a WHERE c.clientid LIKE ? 
        		AND c.autoid=a.client_autoid AND a.subtype < 4 AND a.date=? 
        		AND NOT EXISTS (SELECT NULL FROM assessment_tbl b WHERE c.autoid=b.client_autoid AND b.subtype>3 AND b.subtype<7)");
	    	$this->throwExceptionOnError();
	    	
	    	$stmt->bind_param('ss', $clientid, $intakeDate);
        	$this->throwExceptionOnError();
        }
		
        $stmt->execute();
        $this->throwExceptionOnError();
        
        $clients = array();
    	$client = new ClientVO();
        $stmt->bind_result($client->autoid, $client->clientid, $client->intakeDate);
		
        while($stmt->fetch())
        {
	        array_push($clients, $client);
	        $client = new ClientVO();
	        $stmt->bind_result($client->autoid, $client->clientid, $client->intakeDate);
	    }
        
        $stmt->free_result();
        $this->connection->close();
        return $clients;
    }


    /**
     * Utitity function to throw an exception if an error occurs
     * while running a mysql command.
     */
    private function throwExceptionOnError ($link = null)
    {
        if ($link == null) {
            $link = $this->connection;
        }

        if (mysqli_error($link)) {
            $msg = mysqli_errno($link) . ": " . mysqli_error($link);
            throw new Exception('MySQL Error - ' . $msg);
        }
    }
}