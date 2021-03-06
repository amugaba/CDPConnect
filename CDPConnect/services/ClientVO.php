<?php
class ClientVO
{
	/**
	 * @var int
	 */
	public $autoid;
	
	/**
	 * @var string
	 */
	public $clientid;
	
	/**
	 * @var string
	 */
	public $firstname;
	
	/**
	 * @var string
	 */
	public $lastname;
	
	/**
	 * @var string
	 */
	public $dob;
	
	/**
	 * @var string
	 */
	public $ssn;
	
	/**
	 * @var int
	 */
	public $gender;
	
	/**
	 * @var string
	 */
	public $notes;
	
	public function __construct()
	{
		$this->autoid = -1;
		$this->clientid = "";
		$this->firstname = "";
		$this->lastname = "";
		$this->dob = "";
		$this->ssn = "";
		$this->gender = 0;
		$this->notes = "";
	}
}
?>