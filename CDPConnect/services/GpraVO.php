<?php
class GpraVO
{
	/**
	 * @var int
	 */
	public $autoid;
	
	/**
	 * @var int
	 */
	public $clientid;
	
	/**
	 * @var int
	 */
	public $type;
	
	/**
	 * @var string
	 */
	public $date;
	
	/**
	 * @var int
	 */
	public $status;	
	
	/**
	 * @var array
	 */
	public $data;	
	
	public function __construct()
	{
		$this->autoid = -1;
		$this->clientid = -1;
		$this->type = 0;
		$this->date = "";
		$this->status = 0;
		$this->data = array();
	}
}
?>