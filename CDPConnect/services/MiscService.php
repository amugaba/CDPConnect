<?php
include_once 'ConnectionManager.php';
include_once 'GrantVO.php';

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
	 * 
	 * Get a grant's settings by ID
	 * 
	 * @param int $grantID
	 * @return GrantVO
	 */
    public function getGrant($grantID)
    {
    	$stmt = $this->connection->prepare("SELECT autoid, name, samhsaCenter, programType, grantCode, sbirt FROM grant_tbl WHERE autoid=?");
    	$this->throwExceptionOnError();
    	
    	$stmt->bind_param('i', $grantID);
        $this->throwExceptionOnError();
        
    	$stmt->execute();
    	$this->throwExceptionOnError();
    	
    	$grant = new GrantVO();
    	
    	$stmt->bind_result($grant->autoid, $grant->name, $grant->samhsaCenter, $grant->programType, $grant->grantCode, $grant->sbirt);
    	
    	if ($stmt->fetch()) 
    	{
    		$stmt->free_result();
	        $this->connection->close();  
        	return $grant;
        }
    	else 
    	{
	    	$stmt->free_result();
	        $this->connection->close();  
	        return null;
    	}
    }
    
/**
	 * 
	 * Update a grant's settings by ID
	 * 
	 * @param GrantVO $grant
	 */
    public function updateGrant($grantVO)
    {
    	$stmt = $this->connection->prepare("UPDATE grant_tbl SET samhsaCenter=?, programType=?, grantCode=? WHERE autoid=?");
    	$this->throwExceptionOnError();
    	
    	$stmt->bind_param('iisi', $grantVO->samhsaCenter, $grantVO->programType, $grantVO->grantCode, $grantVO->autoid);
        $this->throwExceptionOnError();
        
    	$stmt->execute();
    	$this->throwExceptionOnError();
    	
    	$stmt->free_result();
	    $this->connection->close();  
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