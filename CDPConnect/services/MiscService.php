<?php
include_once 'ConnectionManager.php';

class MiscService
{
    public $port = "3306";
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
	 * Get facilities
	 * 
	 * @return String[]
	 */
    public function getFacilities()
    {
    	$stmt = $this->connection->prepare("SELECT name FROM facility_tbl");
    	$this->throwExceptionOnError();
    	
    	$stmt->execute();
    	$this->throwExceptionOnError();
    	
    	$facilities = array();
    	
    	$s = "";
    	$stmt->bind_result($s);
    	
    	while ($stmt->fetch()) 
    	{
    		$facilities[] = $s;
    		$stmt->bind_result($s);
        }
    	
    	mysqli_stmt_free_result($stmt);
        mysqli_close($this->connection);
        
        return $facilities;
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