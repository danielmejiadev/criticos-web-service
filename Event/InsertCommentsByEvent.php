<?php

require '../Event/EventCrud.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') 
{

    $body = json_decode(file_get_contents("php://input"), true);

    $result= EventCrud::insertCommentsByEvent($body['eventId'],$body['comments']);

    echo json_encode(array('state'=>$result));
}