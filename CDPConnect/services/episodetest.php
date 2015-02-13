<?php
    include('EpisodeService.php');
    $o = new EpisodeService();

    $episode = new EpisodeVO();
    $episode->client_autoid = 99;
    $episode->number = 1;
    $episode->date = "02/13/2015";
    $episode->staff = "Test, Test";
    $episode->facility = "Emberwood";
    $episode->complete = 0;

    $res = $o->createEpisode($episode);
    var_dump($res);
?> 
