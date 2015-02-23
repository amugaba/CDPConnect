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
        $stmt = mysqli_prepare($this->connection, "SELECT autoid, number, date, staff, facility, notes FROM $this->tablename where client_autoid=?");
        $this->throwExceptionOnError();

        $stmt->bind_param('i', $autoid);
        $this->throwExceptionOnError();

        $stmt->execute();
        $this->throwExceptionOnError();

        $episode = new EpisodeVO();
        $stmt->bind_result($episode->autoid, $episode->number, $episode->date, $episode->staff, $episode->facility, $episode->notes);
        
        $episodes = array();
        while($stmt->fetch())
        {
        	$episode->client_autoid = $autoid;
        	array_push($episodes, $episode);
        	$episode = new EpisodeVO();
        	$stmt->bind_result($episode->autoid, $episode->number, $episode->date, $episode->staff, $episode->facility, $episode->notes);
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
        $stmt = mysqli_prepare($this->connection, "INSERT IGNORE INTO $this->tablename (client_autoid, number, date, staff, facility) VALUES (?,?,?,?,?)");
        $this->throwExceptionOnError();

        $stmt->bind_param('iisss', $episode->client_autoid, $episode->number, $episode->date, $episode->staff, $episode->facility);
        $this->throwExceptionOnError();

        $stmt->execute();
        $this->throwExceptionOnError();

        $episode->autoid = $stmt->insert_id;

	    $stmt->free_result();
	    $this->connection->close();     
        return $episode;
    }
    
	/**
	 * Update an episode
	 * 
	 * @param EpisodeVO $item
	 * @return EpisodeVO
	 */
    public function updateEpisode ($item)
    {        
        $stmt = $this->connection->prepare("UPDATE $this->tablename SET
        client_autoid=?, number=?, date=?, staff=?, facility=?
        WHERE autoid=?");
        $this->throwExceptionOnError();

        $stmt->bind_param('iisssi', $item->client_autoid, $item->number, $item->date, $item->staff,
        	$item->facility, $item->autoid);
        $this->throwExceptionOnError();

        $rs = $stmt->execute();
        $this->throwExceptionOnError();
        
        $stmt->free_result();
        $this->connection->close();
        
        return $item; 
    }
    
	/**
	 * Save notes
	 * 
	 * @param EpisodeVO $item
	 * @return EpisodeVO
	 */
    public function updateNotes ($item)
    {        
        $stmt = $this->connection->prepare("UPDATE $this->tablename SET
        notes=? WHERE autoid=?");
        $this->throwExceptionOnError();

        $stmt->bind_param('si', $item->notes, $item->autoid);
        $this->throwExceptionOnError();

        $rs = $stmt->execute();
        $this->throwExceptionOnError();
        
        $stmt->free_result();
        $this->connection->close();
        
        return $item; 
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