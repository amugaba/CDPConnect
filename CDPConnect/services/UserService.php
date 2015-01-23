<?php
include_once 'UserVO.php';
	require_once('Zend/Mail/Transport/Smtp.php');
	require_once 'Zend/Mail.php';
include_once 'ConnectionManager.php';

class UserService
{
    var $tablename = "user_tbl";
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
	 * Login user
	 * 
	 * @param string $username
	 * @param string $password
	 * @return UserVO
	 */
    public function loginUser($username, $password)
    {
    	$stmt = $this->connection->prepare("SELECT
        	username, name, password, initials, facility, admin
           FROM $this->tablename WHERE username=? AND password=?");
        $this->throwExceptionOnError();
        
        $stmt->bind_param('ss', $username, $password);
        $this->throwExceptionOnError();
        
        $stmt->execute();
        $this->throwExceptionOnError();

        $obj = new UserVO();
        
        $stmt->bind_result($obj->username, $obj->name, $obj->password, $obj->initials, $obj->facility, $obj->admin);
        
        $auth = $stmt->fetch();
        
        mysqli_stmt_free_result($stmt);
        mysqli_close($this->connection);
        
        if($auth)
        	return $obj;
        else return null;  
        
    }
    
    /**
	 * 
	 * Update user
	 * 
	 * @param UserVO $user
	 * @return bool
	 */
    public function updateUser($user)
    {
    	$stmt = $this->connection->prepare("UPDATE $this->tablename SET password=?, facility=? WHERE username=?");
    	$this->throwExceptionOnError();
    	
    	$stmt->bind_param('sss', $user->password, $user->facility, $user->username);
    	$this->throwExceptionOnError();
    	
    	$rs = $stmt->execute();
    	$this->throwExceptionOnError();
    	
    	mysqli_stmt_free_result($stmt);
        mysqli_close($this->connection);
        
        return $rs != null;
    }
    
    /**
	 * 
	 * Get users
	 * 
	 * @return UserVO[]
	 */
    public function getUsers()
    {
    	$stmt = $this->connection->prepare("SELECT username, name, initials, email FROM $this->tablename");
    	$this->throwExceptionOnError();
    	
    	$stmt->execute();
    	$this->throwExceptionOnError();
    	
    	$users = array();
    	
    	$obj = new UserVO();
    	$stmt->bind_result($obj->username, $obj->name, $obj->initials, $obj->email);
    	
    	while ($stmt->fetch()) 
    	{
    		if($obj->initials != 'ZZ')
            	$users[] = $obj;
            $obj = new UserVO();
    		$stmt->bind_result($obj->username, $obj->name, $obj->initials, $obj->email);
        }
    	
    	mysqli_stmt_free_result($stmt);
        mysqli_close($this->connection);
        
        return $users;
    }
    
    /**
	 *
	 * Email forgotten password to user
	 *
	 * @param string $username
	 * @return bool
	 */
    public function emailPassword($username)
    {
        $stmt = $this->connection->prepare("SELECT
        	password, email
           FROM $this->tablename WHERE username=?");
        $this->throwExceptionOnError();

        $stmt->bind_param('s', $username);
        $this->throwExceptionOnError();

        $stmt->execute();
        $this->throwExceptionOnError();
		
        $pw = "";
        $email = "";
        $stmt->bind_result($pw, $email);

        $auth = $stmt->fetch();

        mysqli_stmt_free_result($stmt);
        mysqli_close($this->connection);
        
        if($auth)
        {
        //Setting used to send mail to user
       	$config = array('auth' => 'login',
                'username' => 'indiana.sated@gmail.com',
                'password' => 'poiu0897',
    	          'port'     => 587,
                'ssl' => 'tls');

        $transport = new Zend_Mail_Transport_Smtp('smtp.gmail.com', $config);

    		$mail = new Zend_Mail();
		    $mail->setBodyText('Your password is '.$pw.'.');
		    $mail->setFrom('indiana.sated@gmail.com', 'Indiana SATED System');
		    $mail->addTo($email, 'BHS');
		    $mail->setSubject('Indiana SATED System: Password Recovery');
		    $mail->send($transport);
		    return true;
        }
        else return false;
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