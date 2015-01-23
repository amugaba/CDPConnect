<?php

include_once 'ClientVO.php';
include_once 'GpraVO.php';
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

        $stmt = mysqli_prepare($this->connection, "SELECT autoid, firstname, lastname,
        	dob, ssn, intakestaff, createddate FROM client_tbl where autoid=?");
        $this->throwExceptionOnError();

        $stmt->bind_param('i', $autoid);
        $this->throwExceptionOnError();

        $stmt->execute();
        $this->throwExceptionOnError();

        $client = new ClientVO();
        $stmt->bind_result($client->autoid, $client->firstname, $client->lastname, $client->dob,
        	$client->ssn, $client->intakestaff, $client->createddate);

        if ($stmt->fetch())
        {
            mysqli_stmt_free_result($stmt);
	        $stmt = mysqli_prepare($this->connection, "SELECT autoid,ClientID,InterviewTypeCode,InterviewDate FROM gpra_tbl where ClientID=?");
	        $this->throwExceptionOnError();
	
	        $stmt->bind_param('i', $client->autoid);
	        $this->throwExceptionOnError();
	
	        $stmt->execute();
	        $this->throwExceptionOnError();
	        
	        $gpra = new GpraVO();
	        $stmt->bind_result($gpra->autoid, $gpra->clientid, $gpra->type, $gpra->date);
	        
	        $gpras = array();
	        while($stmt->fetch())
	        {
	        	array_push($gpras, $gpra);
	        	$gpra = new GpraVO();
	        	$stmt->bind_result($gpra->autoid, $gpra->clientid, $gpra->type, $gpra->date);
	        }
	        $client->gpras = $gpras;
	
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
        (firstname, lastname, dob, ssn, intakestaff, createddate) VALUES (?,?,?,?,?,?)");
        $this->throwExceptionOnError();

        $stmt->bind_param('ssssss', $client->firstname, $client->lastname, $client->dob,
        	$client->ssn, $client->intakestaff, $client->createddate);
        $this->throwExceptionOnError();

        $rs = $stmt->execute();
        $this->throwExceptionOnError();

        $client->autoid = $stmt->insert_id;
        
        $stmt->free_result();
        $this->connection->close();
        
        return $client; 
    }
    
	/**
	 * 
	 * Update a client
	 * 
	 * @param ClientVO $item
	 * @return ClientVO
	 */
    public function updateClient ($client)
    {        
        $stmt = $this->connection->prepare("UPDATE client_tbl SET
        firstname=?, lastname=?, dob=?, ssn=?, intakestaff=?, createddate=?
        WHERE autoid=?");
        $this->throwExceptionOnError();

        $stmt->bind_param('ssssssi', $client->firstname, $client->lastname, $client->dob,
        	$client->ssn, $client->intakestaff, $client->createddate, $client->autoid);
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
	 * @param int $clientid
	 * @param string $firstname
	 * @param string $lastname
	 * @param string $dob
	 * @param string $ssn
	 * @param string $intakestaff
	 * @return ClientVO[]
	 */
    
    public function searchClients ($clientid, $firstname, $lastname, $dob, $ssn, $intakestaff)
    {    	
    	$stmt = $this->connection->prepare("SELECT autoid, firstname, lastname, dob, ssn, intakestaff, createddate FROM client_tbl WHERE
        	autoid LIKE ? and firstname LIKE ? and lastname LIKE ? and dob LIKE ? and ssn LIKE ? and intakestaff LIKE ?");
        $this->throwExceptionOnError();
        
        $clientid = str_replace("*", "%", $clientid);
        if($clientid == 0)
        	$clientid = "%";
        $firstname = str_replace("*", "%", $firstname);
        if(strlen($firstname) == 0)
        	$firstname = "%";
        $lastname = str_replace("*", "%", $lastname);
        if(strlen($lastname) == 0)
        	$lastname = "%";
        $dob = str_replace("*", "%", $dob);
        if(strlen($dob) == 0)
        	$dob = "%";
        $ssn = str_replace("*", "%", $ssn);
        if(strlen($ssn) == 0)
        	$ssn = "%";
        $intakestaff = str_replace("*", "%", $intakestaff);
        if(strlen($intakestaff) == 0)
        	$intakestaff = "%";

        $stmt->bind_param('ssssss', $clientid, $firstname, $lastname, $dob, $ssn, $intakestaff);
        $this->throwExceptionOnError();
		
        $stmt->execute();
        $this->throwExceptionOnError();
        
        $clients = array();
    	$client = new ClientVO();
        $stmt->bind_result($client->autoid, $client->firstname, $client->lastname, $client->dob,
        	$client->ssn, $client->intakestaff, $client->createddate);
		
        while($stmt->fetch())
        {
	        array_push($clients, $client);
	        $client = new ClientVO();
	        $stmt->bind_result($client->autoid, $client->firstname, $client->lastname, $client->dob,
        		$client->ssn, $client->intakestaff, $client->createddate);
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