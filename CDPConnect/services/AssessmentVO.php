<?php
class AssessmentVO
{
	/**
	 * @var int
	 */
	public $autoid;
	
	/**
	 * @var int
	 */
	public $episode_autoid;
	
	/**
	 * @var int
	 */
	public $type;
	
	/**
	 * @var int
	 */
	public $subtype;
	
	/**
	 * @var string
	 */
	public $date;
	
	/**
	 * @var int
	 */
	public $complete;
	
	/**
	 * @var array
	 */
	public $data;
	
	public function __construct()
	{
		$this->autoid = -1;
		$this->episode_autoid = -1;
		$this->type = 0;
		$this->subtype = 0;
		$this->date = "";
		$this->complete = 0;
		$this->data = array();
	}
}
?>