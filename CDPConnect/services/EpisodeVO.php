<?php
class EpisodeVO
{
	/**
	 * @var int
	 */
	public $autoid;
	
	/**
	 * @var int
	 */
	public $client_autoid;
	
	/**
	 * @var int
	 */
	public $number;
	
	/**
	 * @var string
	 */
	public $date;
	
	/**
	 * @var string
	 */
	public $staff;
	
	/**
	 * @var string
	 */
	public $facility;
	
	/**
	 * @var string
	 */
	public $notes;
	
	public function __construct()
	{
		$this->autoid = -1;
		$this->client_autoid = -1;
		$this->number = -1;
		$this->date = "";
		$this->staff = "";
		$this->facility = "";
		$this->notes = "";
	}
}
?>