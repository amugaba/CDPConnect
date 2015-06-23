<?php
    include('ClientService.php');
    $o = new ClientService();

    
    $res = $o->searchClients("asdf");
    var_dump($res);
?> 
