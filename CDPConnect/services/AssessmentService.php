<?php
include_once 'ConnectionManager.php';
include_once 'AssessmentVO.php';

/**
 * This sample service contains functions that illustrate typical
 * service operations. This code is for prototyping only.
 *
 * Authenticate users before allowing them to call these methods.
 */


class AssessmentService
{
	var $tablename = "assessment_tbl";
	
	var $dci_type = 1;
	var $gpra_type = 2;
	
	var $tableByType = array("gpra_tbl", "dci_tbl");
	
    public $connection;

    public function __construct ()
    {
		$cm = new ConnectionManager();

        $this->connection = mysqli_connect($cm->server, $cm->username,
        $cm->password, $cm->databasename, $cm->port);

        $this->throwExceptionOnError($this->connection);
    }

	/**
	 * Get all assessments belonging to a client, without the data
	 * 
	 * @param int $autoid
	 * @return AssessmentVO[]
	 */
    public function getAssessmentsByClientID ($autoid)
    {
        $stmt = mysqli_prepare($this->connection, "SELECT autoid, client_autoid, type, subtype, date, complete FROM $this->tablename WHERE client_autoid=?");
        $this->throwExceptionOnError();

        $stmt->bind_param('i', $autoid);
        $this->throwExceptionOnError();

        $stmt->execute();
        $this->throwExceptionOnError();

        $item = new AssessmentVO();
        $stmt->bind_result($item->autoid, $item->client_autoid, $item->type, $item->subtype, $item->date, $item->complete);
        
        $items = array();
        while ($stmt->fetch()) 
        {
            array_push($items, $item);
        	$item = new AssessmentVO();
        	$stmt->bind_result($item->autoid, $item->client_autoid, $item->type, $item->subtype, $item->date, $item->complete);
        }

        $stmt->free_result();
        
        //Now get data from subtable for each assessment
        foreach($items as $item)
        {
        	//Get data from subtable
        	$table = $this->tableByType[$item->type];
	        $stmt2 = mysqli_prepare($this->connection, "SELECT * FROM $table WHERE assessment_autoid=?");
			$this->throwExceptionOnError();
			
			$stmt2->bind_param('i', $item->autoid);
	        $this->throwExceptionOnError();
	
	        $stmt2->execute();
	        $this->throwExceptionOnError();
			
	        $result = $stmt2->get_result();
			$res = $result->fetch_assoc();
		    
		    $res["autoid"] = intval($res["autoid"]);
		    $res["assessment_autoid"] = intval($res["assessment_autoid"]);
		    $item->data = $res;
		    
		    $stmt2->free_result();
        }
	    
	    $this->connection->close();     
        return $items;
    }
    
	/**
	 * Get an assessment's data
	 * 
	 * @param AssessmentVO $item
	 * @return Object
	 */
    /*public function getAssessmentData ($item)
    {
    	$table = $this->tableByType[$item->type];
        $rs = mysqli_query($this->connection, "SELECT * FROM $table where assessment_autoid=$item->autoid");
		$this->throwExceptionOnError();
		
		$res = mysqli_fetch_assoc($rs);
	    mysqli_close($this->connection);
	    
	    $res["autoid"] = intval($res["autoid"]);
	    $res["assessment_autoid"] = intval($res["assessment_autoid"]);
	
	    return $res;
    }*/
    
	/**
	 * Create assessment
	 * 
	 * @param AssessmentVO $item
	 * @return AssessmentVO
	 */
    public function createAssessment ($item)
    {
        $stmt = mysqli_prepare($this->connection, "INSERT IGNORE INTO $this->tablename (client_autoid, type, subtype, date, complete) VALUES (?,?,?,?,?)");
        $this->throwExceptionOnError();

        $stmt->bind_param('iiisi', $item->client_autoid, $item->type, $item->subtype, $item->date, $item->complete);
        $this->throwExceptionOnError();

        $stmt->execute();
        $this->throwExceptionOnError();

        $item->autoid = $stmt->insert_id;
	    $stmt->free_result();
	    
	    //Insert data into appropriate subtable
	    $table = $this->tableByType[$item->type];
	    $data = $item->data;
	    foreach($data as &$value)
        {
        	if(is_string($value))
        		$value = "'".mysqli_real_escape_string($this->connection,$value)."'";
        }
        $keys = array_keys($data);
		$columns = join(",", $keys);
		$values = join(",", $data);
		$rs = mysqli_query($this->connection, "INSERT INTO $table (client_autoid, $columns) VALUES ($item->autoid, $values)");
	    $this->throwExceptionOnError();
	    
	    $data_autoid = mysqli_insert_id($this->connection);
	    $item->data["autoid"] = $data_autoid;
	    $item->data["assessment_autoid"] = $item->autoid;
	    
	    $this->connection->close();     
        return $item;
    }
    
	/**
	 * Update an assessment
	 * 
	 * @param AssessmentVO $item
	 * 
	 */
    public function updateAssessmentData ($item)
    {   
    	$data = $item->data;
    	$pairs = array();
    	foreach($data as $key => &$value)
        {
        	if(is_string($value))
        		$value = "'".mysqli_real_escape_string($this->connection,$value)."'";
        	array_push($pairs, $key."=".$value);
        }
        $query = join(",", $pairs);
        
        $table = $this->tableByType[$item->type];
        $autoid = $data["autoid"];
        
        mysqli_query($this->connection, "UPDATE $table SET $query WHERE autoid = $autoid");
        $this->throwExceptionOnError();

        $this->connection->close(); 
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