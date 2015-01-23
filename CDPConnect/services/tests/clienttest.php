<?php
    include('ClientService.php');
    $o = new ClientService();
    //$res = $o->getClientByID("abcd");
    //$item = new ClientVO();
    //$item->clientid = "qwer";
    //$res = $o->createClient($item);
    $res = $o->searchClients(0, '', '', '', '', '');
    var_dump($res);
?> 
