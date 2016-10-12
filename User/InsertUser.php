<?php

require '../User/UserCrud.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') 
{

    $body = json_decode(file_get_contents("php://input"), true);

    $result= UserCrud::insert(
        $body['userEmail'],
        $body['userPassword'],
        $body['userName'],
        $body['userLastName'],
        $body['userOccupation'],
        $body['userPicture'],
        $body['userState']);

        echo json_encode($result);
}