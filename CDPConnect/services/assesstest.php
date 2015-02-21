<?php
    include('AssessmentService.php');
    $o = new AssessmentService();

    /*$assessment = new AssessmentVO();
    $assessment->autoid = 18;
    $assessment->episode_autoid = 1;
    $assessment->type = 0;
    $assessment->date = "02/13/2015";
    $assessment->subtype = 0;
    $assessment->complete = 1;

    $res = $o->getAssessmentData($assessment);*/
    
    $res = $o->checkFollowupEligibility();
    var_dump($res);
?> 
