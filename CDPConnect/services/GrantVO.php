<?php
class GrantVO
{
	public $autoid;
	public $name;
	public $samhsaCenter;
	public $programType;
	public $grantCode;

	public function __construct()
	{
		$this->autoid = 0;
		$this->name = "";
		$this->samhsaCenter = 0;
		$this->programType = 0;
		$this->grantCode = "";
	}
}
?>