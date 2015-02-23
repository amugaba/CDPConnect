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
	var $prescreen_type = 2;
	var $audit_type = 3;
	var $dast10_type = 4;
	var $phq9_type = 5;
	
	var $tableByType = array("gpra_tbl", "prescreen_tbl", "audit_tbl", "dast10_tbl", "phq9_tbl");
	
    public $connection;

    public function __construct ()
    {
		$cm = new ConnectionManager();

        $this->connection = mysqli_connect($cm->server, $cm->username,
        $cm->password, $cm->databasename, $cm->port);

        $this->throwExceptionOnError($this->connection);
    }

	/**
	 * Get all assessments belonging to an episode, without the data
	 * 
	 * @param int $autoid
	 * @return AssessmentVO[]
	 */
    public function getAssessmentsByEpisodeID ($autoid)
    {
        $stmt = mysqli_prepare($this->connection, "SELECT autoid, episode_autoid, type, subtype, date, complete FROM $this->tablename where episode_autoid=?");
        $this->throwExceptionOnError();

        $stmt->bind_param('i', $autoid);
        $this->throwExceptionOnError();

        $stmt->execute();
        $this->throwExceptionOnError();

        $item = new AssessmentVO();
        $stmt->bind_result($item->autoid, $item->episode_autoid, $item->type, $item->subtype, $item->date, $item->complete);
        
        $items = array();
        while ($stmt->fetch()) 
        {
            array_push($items, $item);
        	$item = new AssessmentVO();
        	$stmt->bind_result($item->autoid, $item->episode_autoid, $item->type, $item->subtype, $item->date, $item->complete);
        }

        $stmt->free_result();
        
        //Now get data from subtable for each assessment
        foreach($items as $item)
        {
        	//Get data from subtable
        	$table = $this->tableByType[$item->type];
	        $rs = mysqli_query($this->connection, "SELECT * FROM $table where assessment_autoid=$item->autoid");
			$this->throwExceptionOnError();
			
			$res = mysqli_fetch_assoc($rs);
		    
		    $res["autoid"] = intval($res["autoid"]);
		    $res["assessment_autoid"] = intval($res["assessment_autoid"]);
		    $item->data = $res;
		    
		    $rs->free_result();
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
    public function getAssessmentData ($item)
    {
    	$table = $this->tableByType[$item->type];
        $rs = mysqli_query($this->connection, "SELECT * FROM $table where assessment_autoid=$item->autoid");
		$this->throwExceptionOnError();
		
		$res = mysqli_fetch_assoc($rs);
	    mysqli_close($this->connection);
	    
	    $res["autoid"] = intval($res["autoid"]);
	    $res["assessment_autoid"] = intval($res["assessment_autoid"]);
	
	    return $res;
    }
    
	/**
	 * Create assessment
	 * 
	 * @param AssessmentVO $item
	 * @return AssessmentVO
	 */
    public function createAssessment ($item)
    {
        $stmt = mysqli_prepare($this->connection, "INSERT IGNORE INTO $this->tablename (episode_autoid, type, subtype, date, complete) VALUES (?,?,?,?,?)");
        $this->throwExceptionOnError();

        $stmt->bind_param('iiisi', $item->episode_autoid, $item->type, $item->subtype, $item->date, $item->complete);
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
		$rs = mysqli_query($this->connection, "INSERT INTO $table (assessment_autoid, $columns) VALUES ($item->autoid, $values)");
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
	 * Followup Eligibility
	 * A. Count the number of positive intakes
	 * B. Count the number of followup-selected intakes
	 * If B/A < 10%, this client is eligible for followup
	 * 
	 * @return bool
	 */
    public function checkFollowupEligibility()
    {   
    	$table = $this->tableByType[0];
    	$rs = mysqli_query($this->connection, "SELECT COUNT(*) as total FROM $table WHERE SBIRTScreen = 1");
        $this->throwExceptionOnError();
        $arr = $rs->fetch_assoc();
        $numPosIntakes = $arr["total"];
        
        $rs = $numFollowupSelected = mysqli_query($this->connection, "SELECT COUNT(*) as total FROM $table WHERE followupSelected = 1");
        $this->throwExceptionOnError();
        $arr = $rs->fetch_assoc();
        $numFollowupSelected = $arr["total"];
        
        $percent = $numFollowupSelected * 1.0 / $numPosIntakes;
        
        $this->connection->close();
        return $percent < 0.1;
    }
    
	/**
	 * Set DCI intake as followup selected
	 * @param int $autoid
	 */
    public function setFollowupSelected($autoid)
    {   
    	$table = $this->tableByType[0];
    	mysqli_query($this->connection, "UPDATE $table SET followupSelected = 1 WHERE autoid = $autoid");
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