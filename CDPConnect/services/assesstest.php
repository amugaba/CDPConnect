<?php
    include('AssessmentService.php');
    $o = new AssessmentService();

    $assessment = new AssessmentVO();
    $assessment->autoid = 2;
    $assessment->episode_autoid = 1;
    $assessment->type = 1;
    $assessment->date = "02/13/2015";
    $assessment->subtype = 0;
    $assessment->complete = 1;

    $res = $o->getAssessmentData($assessment);
    var_dump($res);
?> 
