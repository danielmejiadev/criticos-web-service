<?php

require '../User/UserCrud.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') 
{

    $body = json_decode(file_get_contents("php://input"), true);

    $result = UserCrud::searchByEmail($body[0]);
        
    echo json_encode($result);
}