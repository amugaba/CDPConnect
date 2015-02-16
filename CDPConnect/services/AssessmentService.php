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
	 * Get all assessments belonging to an episode
	 * 
	 * @param int $autoid
	 * @return AssessmentVO[]
	 */
    public function getAssessmentsByEpisodeID ($autoid)
    {
        $stmt = mysqli_prepare($this->connection, "SELECT autoid, episode_autoid, type, date, complete FROM $this->tablename where episode_autoid=?");
        $this->throwExceptionOnError();

        $stmt->bind_param('i', $autoid);
        $this->throwExceptionOnError();

        $stmt->execute();
        $this->throwExceptionOnError();

        $item = new AssessmentVO();
        $stmt->bind_result($item->autoid, $item->episode_autoid, $item->type, $item->date, $item->complete);
        
        $items = array();
        while($stmt->fetch())
        {
        	array_push($items, $item);
        	$item = new AssessmentVO();
        	$stmt->bind_result($item->autoid, $item->episode_autoid, $item->type, $item->date, $item->complete);
        }

	    $stmt->free_result();
	    $this->connection->close();     
        return $items;
    }
    
	/**
	 * Create assessment
	 * 
	 * @param AssessmentVO $item
	 * @return AssessmentVO
	 */
    public function createAssessment ($item)
    {
        $stmt = mysqli_prepare($this->connection, "INSERT IGNORE INTO $this->tablename (episode_autoid, type, date, complete) VALUES (?,?,?,?)");
        $this->throwExceptionOnError();

        $stmt->bind_param('iisi', $item->episode_autoid, $item->type, $item->date, $item->complete);
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
	    
	    $this->connection->close();     
        return $item;
    }
    
	/**
	 * Update an assessment
	 * 
	 * @param AssessmentVO $item
	 * @return AssessmentVO
	 */
    public function updateAssessment ($item)
    {        
        $stmt = $this->connection->prepare("UPDATE $this->tablename SET
        episode_autoid=?, type=?, date=?, complete=?
        WHERE autoid=?");
        $this->throwExceptionOnError();

        $stmt->bind_param('iisii', $item->episode_autoid, $item->type, $item->date, $item->complete, $item->autoid);
        $this->throwExceptionOnError();

        $rs = $stmt->execute();
        $this->throwExceptionOnError();
        
        $stmt->free_result();
        $this->connection->close();
        
        return $item; 
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