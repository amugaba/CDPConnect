<?php
include_once 'GpraVO.php';
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
	 * @var GpraVO[]
	 */
	public $gpras;
	
	/**
	 * @var GpraVO
	 */
	public $intake;
	
	/**
	 * @var GpraVO
	 */
	public $discharge;
	
	/**
	 * @var GpraVO
	 */
	public $followup;
	
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
	 * @var string
	 */
	public $intakestaff;
	
	/**
	 * @var string
	 */
	public $createddate;
	
	public function __construct()
	{
		$this->autoid = -1;
		$this->clientid = "";
		$this->gpras = array();
		$this->intake = null;
		$this->discharge = null;
		$this->followup = null;
		$this->firstname = "";
		$this->lastname = "";
		$this->dob = "";
		$this->ssn = "";
		$this->intakestaff = "Unknown";
		$this->createddate = "";
	}
}
?>