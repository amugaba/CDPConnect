<?php
class UserVO
{
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
	
	public $admin;

	public function __construct()
	{
		$this->username = "";
		$this->name = "";
		$this->password = "";
		$this->initials = "ZZ";
		$this->facility = "Unknown";
		$this->email = "";
		$this->admin = 0;
	}
}
?>