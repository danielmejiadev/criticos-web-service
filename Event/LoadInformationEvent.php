<?php

require '../Event/EventCrud.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') 
{

    $body = json_decode(file_get_contents("php://input"), true);

    $actors = EventCrud::searchActorsByEvent($body['eventId']);
    $comments = EventCrud::searchCommetsByEvent($body['eventId']);
        
    echo json_encode(array('actors'=>$actors,'comments'=>$comments));


}