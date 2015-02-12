<?php

include_once 'GpraVO.php';
include_once 'ConnectionManager.php';

class GpraService
{
	var $tablename = "gpra_tbl";
	var $connection;

	/**
	 * The constructor initializes the connection to database. Everytime a request is 
	 * received by Zend AMF, an instance of the service class is created and then the
	 * requested method is invoked.
	 */
	public function __construct() {
		$cm = new ConnectionManager();

        $this->connection = mysqli_connect($cm->server, $cm->username,
        $cm->password, $cm->databasename, $cm->port);

		$this->throwExceptionOnError($this->connection);
	}


	/**
	 * Returns the item corresponding to the value specified for the primary key.
	 *
	 * @param int $autoid
	 * @return Object $gpra
	 */
	public function getGpraByID($autoid)
	{		
		$rs = mysqli_query($this->connection, "SELECT * FROM $this->tablename where autoid=$autoid");
		$this->throwExceptionOnError();
		
		$gpra = mysqli_fetch_assoc($rs);
	    mysqli_close($this->connection);
	
	    return $gpra;
	}
	
	/**
	 * Returns the item corresponding to the value specified for the primary key.
	 *
	 * @param int $autoid
	 * @return Object $gpra
	 */
	public function getGpraObjByID($autoid)
	{		
		$rs = mysqli_query($this->connection, "SELECT * FROM $this->tablename where autoid=$autoid");
		$this->throwExceptionOnError();
		
		$gpra = mysqli_fetch_object($rs);
	    mysqli_close($this->connection);
	
	    return $gpra;
	}
	
	public function getGprasNotUploaded()
	{		
		$rs = mysqli_query($this->connection, "SELECT * FROM $this->tablename where uploaded=0");
		$this->throwExceptionOnError();
		
		$gpras = array();
		while($gpra = mysqli_fetch_object($rs))
			array_push($gpras, $gpra);
	    mysqli_close($this->connection);
	
	    return $gpras;
	}
	
	public function getGprasNotUploadedArray()
	{		
		$rs = mysqli_query($this->connection, "SELECT * FROM $this->tablename where uploaded=0");
		$this->throwExceptionOnError();
		
		$gpras = array();
		while($gpra = mysqli_fetch_array($rs))
			array_push($gpras, $gpra);
	    mysqli_close($this->connection);
	
	    return $gpras;
	}
	
	public function getAllGprasArray()
	{		
		$rs = mysqli_query($this->connection, "SELECT * FROM $this->tablename");
		$this->throwExceptionOnError();
		
		$gpras = array();
		while($gpra = mysqli_fetch_array($rs))
			array_push($gpras, $gpra);
	    mysqli_close($this->connection);
	
	    return $gpras;
	}
	
	public function setGprasUploaded($autoids)
	{		
		$ids = join(',', $autoids);
		$rs = mysqli_query($this->connection, "UPDATE $this->tablename SET uploaded=1, upload_action=0 where autoid IN (".$ids.")");
		$this->throwExceptionOnError();

	    mysqli_close($this->connection);
	}
	
	/**
	 * Returns the item corresponding to the value specified for the primary key.
	 *
	 * Add authorization or any logical checks for secure access to your data 
	 *
	 * @param int $clientID
	 * @return GpraVO[]
	 */
	public function getGpraSummaryByClientID($clientID)
	{		
		$stmt = $this->connection->prepare("SELECT autoid,InterviewTypeCode,InterviewDate FROM $this->tablename where client_autoid=?");
		$this->throwExceptionOnError();
		
		$stmt->bind_param('i', $clientID);
        $this->throwExceptionOnError();

        $stmt->execute();
        $this->throwExceptionOnError();
	        
        $gpra = new GpraVO();
        $stmt->bind_result($gpra->autoid, $gpra->type, $gpra->date);
        
        $gpras = array();
        while($stmt->fetch())
        {
        	array_push($gpras, $gpra);
        	$gpra = new GpraVO();
        	$stmt->bind_result($gpra->autoid, $gpra->type, $gpra->date);
        }

        $stmt->free_result();
        $this->connection->close();     
        return $gpras;
	}
	
	/**
	 * Returns the item corresponding to the value specified for the primary key.
	 *
	 * Add authorization or any logical checks for secure access to your data 
	 *
	 * @param GpraVO $gpra
	 * @return int
	 */
	public function saveGpra($gpra)
	{
		$rs = mysqli_query($this->connection, "SELECT uploaded, upload_action FROM $this->tablename WHERE autoid = $gpra->autoid");
        $this->throwExceptionOnError();
        $res = mysqli_fetch_object($rs);
		$gpra->data["uploaded"] = 0;
		$gpra->data["upload_action"] = 1;
		
        //Gpra already exists, update it
        if(mysqli_num_rows($rs) > 0 )
        {
        	if($res->uploaded != 0 || $res->upload_action == 2)
        	   	$gpra->data["upload_action"] = 2;
        	$pairs = array();
        	foreach($gpra->data as $key => &$value)
        	{
        		if(is_string($value))
        			$value = "'".mysqli_real_escape_string($this->connection,$value)."'";
        		array_push($pairs, $key."=".$value);
        	}
        	$query = join(",", $pairs);
        	$autoid = mysqli_query($this->connection, "UPDATE $this->tablename SET $query WHERE autoid = $gpra->autoid");
        	$this->throwExceptionOnError();
        	$autoid = 0;
        }
        else //Insert new GPRA
        {
        	$gpra->data["upload_action"] = 1;
        	foreach($gpra->data as &$value)
        	{
        		if(is_string($value))
        			$value = "'".mysqli_real_escape_string($this->connection,$value)."'";
        	}
        	$keys = array_keys($gpra->data);
			$columns = join(",", $keys);
			$values = join(",", $gpra->data);
			$rs = mysqli_query($this->connection, "INSERT INTO $this->tablename ($columns) VALUES ($values)");
	        $this->throwExceptionOnError();
	        $autoid = mysqli_insert_id($this->connection);
        }
        	
		mysqli_close($this->connection);
		return $autoid;
	}
	
	/**
	 * Returns the item corresponding to the value specified for the primary key.
	 *
	 * Add authorization or any logical checks for secure access to your data 
	 *
	 * @param int $autoid
	 * @param Object $data
	 * @return int
	 */
	public function saveDCI($autoid, $data)
	{
		$rs = mysqli_query($this->connection, "SELECT uploaded, upload_action FROM $this->tablename WHERE autoid = $autoid");
        $this->throwExceptionOnError();
        $res = mysqli_fetch_object($rs);
		$gpra->data["uploaded"] = 0;
		$gpra->data["upload_action"] = 1;
		
        //Gpra already exists, update it
        if(mysqli_num_rows($rs) > 0 )
        {
        	if($res->uploaded != 0 || $res->upload_action == 2)
        	   	$data["upload_action"] = 2;
        	$pairs = array();
        	foreach($data as $key => &$value)
        	{
        		if(is_string($value))
        			$value = "'".mysqli_real_escape_string($this->connection,$value)."'";
        		array_push($pairs, $key."=".$value);
        	}
        	$query = join(",", $pairs);
        	$autoid = mysqli_query($this->connection, "UPDATE $this->tablename SET $query WHERE autoid = $autoid");
        	$this->throwExceptionOnError();
        	$autoid = 0;
        }
        else //Insert new GPRA
        {
        	$data["upload_action"] = 1;
        	foreach($data as &$value)
        	{
        		if(is_string($value))
        			$value = "'".mysqli_real_escape_string($this->connection,$value)."'";
        	}
        	$keys = array_keys($data);
			$columns = join(",", $keys);
			$values = join(",", $data);
			$rs = mysqli_query($this->connection, "INSERT INTO $this->tablename ($columns) VALUES ($values)");
	        $this->throwExceptionOnError();
	        $autoid = mysqli_insert_id($this->connection);
        }
        	
		mysqli_close($this->connection);
		return $autoid;
	}
	
	
	/**
	 * Utility function to throw an exception if an error occurs 
	 * while running a mysql command.
	 */
	private function throwExceptionOnError($link = null) {
		if($link == null) {
			$link = $this->connection;
		}
		if(mysqli_error($link)) {
			$msg = mysqli_errno($link) . ": " . mysqli_error($link);
			throw new Exception('MySQL Error - '. $msg);
		}		
	}
}

?>