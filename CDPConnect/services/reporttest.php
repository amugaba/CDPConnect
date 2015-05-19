<?php
    include('ReportService.php');
    $o = new ReportService();
    
    $res = $o->getDCIFrequencies();
    var_dump($res);
?> 
