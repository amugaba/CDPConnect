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
	 * @var bool
	 */
	public $intakeExists;
	
	/**
	 * @var string
	 */
	public $intakeDate;
	
	/**
	 * @var bool
	 */
	public $dischargeExists;
	
	/**
	 * @var bool
	 */
	public $followupExists;
	
	/**
	 * @var bool
	 */
	public $followupSelected;
	
	public function __construct()
	{
		$this->autoid = -1;
		$this->clientid = "";
		$this->intakeExists = false;
		$this->intakeDate = "";
		$this->dischargeExists = false;
		$this->followupExists = false;
		$this->followupSelected = false;
	}
}
?>