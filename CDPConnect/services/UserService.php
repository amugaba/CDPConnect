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
	 * Login user
	 * Retrieve user data. Then verify the password hash.
	 * 
	 * @param string $username
	 * @param string $password
	 * @return UserVO
	 */
    public function loginUser($username, $password)
    {
    	$stmt = $this->connection->prepare("SELECT
        	autoid, username, name, password, initials, facility, email, admin, grantid, eulaSigned, passwordChangedDate
           FROM $this->tablename WHERE username=?");
        $this->throwExceptionOnError();
        
        $stmt->bind_param('s', $username);
        $this->throwExceptionOnError();
        
        $stmt->execute();
        $this->throwExceptionOnError();

        $obj = new UserVO();
        
        $stmt->bind_result($obj->autoid, $obj->username, $obj->name, $obj->password, $obj->initials, $obj->facility, $obj->email, 
        	$obj->admin, $obj->grantid, $obj->eulaSigned, $obj->passwordChangedDate);
        $stmt->fetch();
        
        mysqli_stmt_free_result($stmt);
        mysqli_close($this->connection);
        
        //Verify the password
        if(password_verify($password,$obj->password))
        	return $obj;
        else 
        	return null;  
    }
    
    /**
	 * Get user by username
	 * 
	 * @param string $username
	 * @return UserVO
	 */
    public function getUser($username)
    {
    	$stmt = $this->connection->prepare("SELECT
        	autoid, username, email
           FROM $this->tablename WHERE username=?");
        $this->throwExceptionOnError();
        
        $stmt->bind_param('s', $username);
        $this->throwExceptionOnError();
        
        $stmt->execute();
        $this->throwExceptionOnError();

        $obj = new UserVO();
        
        $stmt->bind_result($obj->autoid, $obj->username, $obj->email);
        $found = $stmt->fetch();
        
        mysqli_stmt_free_result($stmt);
        mysqli_close($this->connection);
        
        if($found)
        	return $obj;
        else 
        	return null;  
    }
    
    /**
	 * Update user
	 * 
	 * @param UserVO $user
	 * @return bool
	 */
    public function updatePassword($user)
    {
    	$hash = password_hash($user->password, PASSWORD_DEFAULT);
    	
    	$stmt = $this->connection->prepare("UPDATE $this->tablename SET password=?, passwordChangedDate=NOW() WHERE autoid=?");
    	$this->throwExceptionOnError();
    	
    	$stmt->bind_param('si', $hash, $user->autoid);
    	$this->throwExceptionOnError();
    	
    	$rs = $stmt->execute();
    	$this->throwExceptionOnError();
    	
    	mysqli_stmt_free_result($stmt);
        mysqli_close($this->connection);
        
        return $rs != null;
    }
    
    /**
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
	 * Create a new random, temporary password for user.
	 * Store temp password in database and require it to be changed on next login.
	 * Email temp password to user.
	 *
	 * @param UserVO $user
	 * @return bool
	 */
    public function resetPassword($user)
    {
    	//create a ten digit password
    	$length = 10;
	    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
	    $charactersLength = strlen($characters);
	    $randomString = '';
	    for ($i = 0; $i < $length; $i++) {
	        $randomString .= $characters[rand(0, $charactersLength - 1)];
	    }
	    
	    //store in database
	    $hash = password_hash($randomString, PASSWORD_DEFAULT);
	    $stmt = $this->connection->prepare("UPDATE $this->tablename SET password=?, passwordChangedDate='0000-00-00' WHERE autoid=?");
    	$this->throwExceptionOnError();
    	
    	$stmt->bind_param('si', $hash, $user->autoid);
    	$this->throwExceptionOnError();
    	
    	$rs = $stmt->execute();
    	$this->throwExceptionOnError();

        mysqli_close($this->connection);
        
        //email password to user
       	$config = array('auth' => 'login',
                'username' => 'contact@angstrom-software.com',
                'password' => 'squirrelmob',
    	          'port'     => 587,
                'ssl' => 'tls');

        $transport = new Zend_Mail_Transport_Smtp('mail.angstrom-software.com', $config);

    	$mail = new Zend_Mail();
		$mail->setBodyText('Your temporary password is '.$randomString.'   When you log in using this password, you will be asked to create a new password.');
		$mail->setBodyHtml('<p>Your temporary password is <b>'.$randomString.'</b></p><p>When you log in using this password, you will be asked to create a new password.</p>');
		$mail->setFrom('contact@angstrom-software.com', 'CDPConnect System');
		$mail->addTo($user->email, 'User');
		$mail->setSubject('CDPConnect System: Password Recovery');
		$mail->send($transport);
		
		return true;
    }
    
    /**
     * Sign EULA
     * 
     * @param int $userid
     * @return bool
     */
    public function signEULA($userid)
    {
    	$stmt = $this->connection->prepare("UPDATE $this->tablename SET eulaSigned=1 WHERE autoid=?");
    	$this->throwExceptionOnError();
    	
    	$stmt->bind_param('i', $userid);
        $this->throwExceptionOnError();
    	
    	$rs = $stmt->execute();
    	$this->throwExceptionOnError();
    	
    	mysqli_stmt_free_result($stmt);
        mysqli_close($this->connection);
        
        return $rs != null;
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