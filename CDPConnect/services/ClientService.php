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
        $stmt = mysqli_prepare($this->connection, "SELECT autoid, clientid, notes FROM client_tbl where autoid=?");
        $this->throwExceptionOnError();

        $stmt->bind_param('i', $autoid);
        $this->throwExceptionOnError();

        $stmt->execute();
        $this->throwExceptionOnError();

        $client = new ClientVO();
        $stmt->bind_result($client->autoid, $client->clientid, $client->notes);

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
	 * @return ClientVO[]
	 */
    
    public function searchClients ($clientid)
    {    	
    	$stmt = $this->connection->prepare("SELECT autoid, clientid FROM client_tbl WHERE
        	clientid LIKE ?");
        $this->throwExceptionOnError();
        
        $clientid = str_replace("*", "%", $clientid);
        if(strlen($clientid) == 0)
        	$clientid = "%";

        $stmt->bind_param('s', $clientid);
        $this->throwExceptionOnError();
		
        $stmt->execute();
        $this->throwExceptionOnError();
        
        $clients = array();
    	$client = new ClientVO();
        $stmt->bind_result($client->autoid, $client->clientid);
		
        while($stmt->fetch())
        {
	        array_push($clients, $client);
	        $client = new ClientVO();
	        $stmt->bind_result($client->autoid, $client->clientid);
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