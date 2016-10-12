<?php

require '../Event/EventCrud.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') 
{

    $body = json_decode(file_get_contents("php://input"), true);

    $result= EventCrud::insert(
        $body['eventName'],
        $body['eventDescription'],
        $body['eventDate'],
        $body['eventBeginTime'],
        $body['eventEndTime'],
        $body['eventPlace'],
        $body['eventActors']);

        echo json_encode($result);

}