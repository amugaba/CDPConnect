<?php
class UserVO
{
	/**
	 * @var int
	 */
	public $autoid;
	/**
	 * @var string
	 */
	public $username;
	
	/**
	 * @var string
	 */
	public $name;
	
	/**
	 * @var string
	 */
	public $password;
	
	/**
	 * @var string
	 */
	public $initials;
	
	/**
	 * @var string
	 */
	public $facility;
	
	/**
	 * @var string
	 */
	public $email;
	
	/**
	 * @var bool
	 */
	public $admin;
	public $grantid;
	/**
	 * @var int
	 */
	public $eulaSigned;
	/**
	 * @var string
	 */
	public $passwordChangedDate;

	public function __construct()
	{
		$this->autoid = 0;
		$this->username = "";
		$this->name = "";
		$this->password = "";
		$this->initials = "ZZ";
		$this->facility = "Unknown";
		$this->email = "";
		$this->admin = FALSE;
		$this->grantid = 0;
		$this->eulaSigned = 0;
		$this->passwordChangedDate = "";
	}
}
?>