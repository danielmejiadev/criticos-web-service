<?php

require '../Event/EventCrud.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') 
{

    $body = json_decode(file_get_contents("php://input"), true);

    $result= EventCrud::LoadEventsByUserLikeCreator($body['userEmail']);

    echo json_encode(array('events'=>$result));
}