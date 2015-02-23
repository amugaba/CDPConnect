<?php
//Make sure to remove the close connection bits of the services called
//Then add them back in when done running this
//Separate the file into smaller chunks so that it doesn't time out
    include('ClientService.php');
	include('EpisodeService.php');
	include('AssessmentService.php');

	$cserv = new ClientService();
	$eserv = new EpisodeService();
	$aserv = new AssessmentService();

	$file = fopen("Episode Data Short.txt","r");
	fgets($file);//skip first line

	while(!feof($file))
	{
		$line = fgets($file);
		$words = explode("\t",$line);

		//1. Look up the clientid associated with this WITS ID
		$clientid = $cserv->getClientIDByWitsID($words[0]);//this will be blank if the client is not found
		if($clientid == "")
			continue;

		//2. Create episode
		$e = new EpisodeVO();
		$e->client_autoid = $clientid;
		$e->number = $words[2];
		$e->date = $words[1];
		$e->staff = $words[13];
		$e->facility = $words[14];
		$e = $eserv->createEpisode($e);

		//3. Create prescreen
		$alc = 0;
		if($words[3] == "Yes")
			$alc = 1;
		$drug = 0;
		if($words[4] == "Yes")
			$drug = 1;
		$dep = 0;
		if($words[5] == "Yes")
			$dep = 1;
		$score = 0;
		if(($alc + $drug) > 0)
			$score = 1;

		$p = new AssessmentVO();
		$p->episode_autoid = $e->autoid;
		$p->type = 1;
		$p->subtype = 0;
		$p->date = $e->date;
		$p->data = array();
		$p->data["Alcohol"] = $alc;
		$p->data["Drug"] = $drug;
		$p->data["Depression"] = $dep;
		$p->data["Positive"] = $score;
		$aserv->createAssessment($p);
	}
	fclose($file);
?> 
