<?php
include_once 'ConnectionManager.php';

class ReportService
{
    public $port = "3306";
    public $connection;
    public $cm;

    public function __construct ()
    {
		$cm = new ConnectionManager();

        $this->connection = mysqli_connect($cm->server, $cm->username,
        $cm->password, $cm->databasename, $cm->port);

        $this->throwExceptionOnError($this->connection);
        $this->cm = $cm;
    }
    
	/**
	 * DCI Frequencies
	 * Count the number of DCI Intakes, Discharges, and Followups
	 * Return an associative array with key=property, value=count
	 * 
	 * @return Object
	 */
    public function getDCIFrequencies()
    {   
    	$table = $this->cm->assessment_tbl;
    	$type = $this->cm->DCI;
    	        
        $stmt = mysqli_prepare($this->connection, "SELECT subtype, COUNT(*) as total FROM $table WHERE type = ? GROUP BY subtype");
        $this->throwExceptionOnError();

        $stmt->bind_param('i', $type);
        $this->throwExceptionOnError();

        $stmt->execute();
        $this->throwExceptionOnError();

        $subtype = 0;
        $count = 0;
        $stmt->bind_result($subtype, $count);
        
        $data = array();
        while ($stmt->fetch()) 
        {
        	$data[$subtype] = $count;
        	$stmt->bind_result($subtype, $count);
        }
        
        $this->connection->close();
        return $data;
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