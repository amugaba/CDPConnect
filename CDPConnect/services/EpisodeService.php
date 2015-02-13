<?php
include_once 'ConnectionManager.php';
include_once 'EpisodeVO.php';

/**
 * This sample service contains functions that illustrate typical
 * service operations. This code is for prototyping only.
 *
 * Authenticate users before allowing them to call these methods.
 */


class EpisodeService
{
	var $tablename = "episode_tbl";
    public $connection;

    public function __construct ()
    {
		$cm = new ConnectionManager();

        $this->connection = mysqli_connect($cm->server, $cm->username,
        $cm->password, $cm->databasename, $cm->port);

        $this->throwExceptionOnError($this->connection);
    }

	/**
	 * Get all episodes belong to a client
	 * 
	 * @param int $autoid
	 * @return EpisodeVO[]
	 */
    public function getEpisodesByClientID ($autoid)
    {
        $stmt = mysqli_prepare($this->connection, "SELECT autoid, number, date, staff, facility, complete FROM $this->tablename where client_autoid=?");
        $this->throwExceptionOnError();

        $stmt->bind_param('i', $autoid);
        $this->throwExceptionOnError();

        $stmt->execute();
        $this->throwExceptionOnError();

        $episode = new EpisodeVO();
        $stmt->bind_result($episode->autoid, $episode->number, $episode->date, $episode->staff, $episode->facility, $episode->complete);
        
        $episodes = array();
        while($stmt->fetch())
        {
        	$episode->client_autoid = $autoid;
        	array_push($episodes, $episode);
        	$episode = new EpisodeVO();
        	$stmt->bind_result($episode->autoid, $episode->number, $episode->date, $episode->staff, $episode->facility, $episode->complete);
        }

	    $stmt->free_result();
	    $this->connection->close();     
        return $episodes;
    }
    
	/**
	 * Create episode
	 * 
	 * @param EpisodeVO $episode
	 * @return EpisodeVO
	 */
    public function createEpisode ($episode)
    {
        $stmt = mysqli_prepare($this->connection, "INSERT IGNORE INTO $this->tablename (client_autoid, number, date, staff, facility, complete) VALUES (?,?,?,?,?,?)");
        $this->throwExceptionOnError();

        $stmt->bind_param('iisssi', $episode->client_autoid, $episode->number, $episode->date, $episode->staff, $episode->facility, $episode->complete);
        $this->throwExceptionOnError();

        $stmt->execute();
        $this->throwExceptionOnError();

        $episode->autoid = $stmt->insert_id;

	    $stmt->free_result();
	    $this->connection->close();     
        return $episode;
    }
   
    /**
     * Utitity function to throw an exception if an error occurs
     * while running a mysql command.
     */
    private function throwExceptionOnError ($link = null)
    {
        if ($link == null) {
            $link = $this->connection;
        }

        if (mysqli_error($link)) {
            $msg = mysqli_errno($link) . ": " . mysqli_error($link);
            throw new Exception('MySQL Error - ' . $msg);
        }
    }
}