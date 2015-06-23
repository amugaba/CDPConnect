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
		$this->notes = "";
		$this->intakeExists = false;
		$this->dischargeExists = false;
		$this->followupExists = false;
		$this->followupSelected = false;
	}
}
?>