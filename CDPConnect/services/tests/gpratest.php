<?php
    include('GpraService.php');
    $o = new GpraService();
    $res = $o->getGpraSummaryByClientID(5);
    var_dump($res);
?>