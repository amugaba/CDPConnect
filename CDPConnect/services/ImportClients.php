<?php
    include('ClientService.php');
    $o = new ClientService();

	$file = fopen("Client Profile WITS.txt","r");
	fgets($file);//skip first line

	while(!feof($file))
	{
		$line = fgets($file);
		$words = explode("\t",$line);
		$c = new ClientVO();
		$c->clientid = $words[0];
		$c->firstname = $words[1];
		$c->lastname = $words[2];
		$c->dob = $words[4];
		$c->ssn = $words[3];
		$c->createddate = $words[5];
		$o->createClient($c);
	}
	fclose($file);
?> 
