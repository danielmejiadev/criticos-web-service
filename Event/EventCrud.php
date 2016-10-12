<?php

require '../Connection.php';

class EventCrud
{
    function __construct()
    {
    }

    public static function searchEventByName($eventName,$currentDate)
    {
        $query = "select * from event where eventname LIKE '%$eventName%' AND eventdate >=  '$currentDate'";

        $sentenceEvent = Connection::toConnect()->prepare($query);

        $sentenceEvent->execute();

        return $sentenceEvent->fetchAll();
    }

    public static function delete($eventid)
    {
        $query = "delete from event where eventid='$eventid'";
        $sentenceEvent = Connection::toConnect()->prepare($query);
        return $sentenceEvent->execute();        
    }

    public static function insert(
        $eventName,
        $eventDescription,
        $eventDate,
        $eventBeginTime,
        $eventEndTime,
        $eventPlace,
        $eventActors
        )
    {
        $query = "insert into event ( " .
            " eventname," .
            " eventdescription," .
            " eventdate," .
            " eventbegintime," .
            " eventendtime," .
            " eventplace,".
            " eventcalification)" .
            " VALUES( ?,?,?,?,?,?,?)";


        $sentenceEvent = Connection::toConnect()->prepare($query);

        $resultExecuteEvent = $sentenceEvent->execute(
                array(
                    $eventName,
                    $eventDescription,
                    $eventDate,
                    $eventBeginTime,
                    $eventEndTime,
                    $eventPlace,
                    0));

        $eventId = Connection::toConnect()->lastInsertId();

        $resultExecuteActor=true;
       
        foreach ($eventActors as $actor) 
        {
           $result = EventCrud::InsertActor($actor['userEmail'],$eventId,$actor['rol'],0);

           if(!$result)
           {
                $resultExecuteActor=false;
                if($resultExecuteEvent)
                {
                    while(!EventCrud::delete($eventId))
                    {

                    }
                }    
                break;
           }
        }

        if($resultExecuteActor and $resultExecuteEvent)
        {
            return array('state'=> true, 'message'=>'El evento se registro con exito');
        }
        else
        {
            return array('state'=> false, 'message'=>'El evento no se ha podido registrar');
        }

    }

    public static function InsertActor($userEmail,$eventId,$rol,$calification)
    {

      $queryActor = "insert into actor ( " . 
                " useremail, " .
                " eventid, " . 
                " rol, ".
                " calification)" . 
                " VALUES( ?,?,?,?)";

        $sentenceActor = Connection::toConnect()->prepare($queryActor); 
        
        return $sentenceActor->execute(array($userEmail,$eventId,$rol,$calification));
    }

    public static function searchActorsByEvent($eventId)
    {
        $query = "select u.*, a.rol, a.calification FROM 
                    actor a INNER JOIN user u   
                    on a.useremail=u.useremail
                    where a.eventid=$eventId";

        $sentenceEvent = Connection::toConnect()->prepare($query);
        $sentenceEvent->execute();  

        return $sentenceEvent->fetchAll();
    }


    public static function insertCommentsByEvent($eventId,$comments)
    {

        $queryComment = "insert into comment ( " . 
                " commentdescription, " .
                " commentdate)" .  
                " VALUES( ?, ?)";

        $sentenceComment = Connection::toConnect()->prepare($queryComment); 

        $queryEventComment = "insert into eventcomment ( " . 
                " eventid, " .
                " commentid)" .  
                " VALUES( ?, ?)";

        $sentenceEventCommet = Connection::toConnect()->prepare($queryEventComment); 


        $result=true;

        foreach($comments as $comment)
        {
            $commentDescription = $comment["commentDescription"];
            $commentDate = $comment["commentDate"];

            $resultComment = $sentenceComment->execute(array($commentDescription,$commentDate));

            $commentId = Connection::toConnect()->lastInsertId();

            $resultEventComment = $sentenceEventCommet->execute(array($eventId,$commentId));

            if(!$resultComment or ! $resultEventComment)
            {
                $result=false;
            }
        }

        return $result;
    }

    public static function searchCommetsByEvent($eventId)
    {
        $query = "select coe.commentid, coe.commentdescription, coe.commentdate from 
                    event e
                    inner join
                    (
                    select ec.eventid, c.* FROM 
                      comment c
                      inner join 
                      eventcomment ec 
                      on c.commentid=ec.commentid
                    ) as coe

                    on e.eventid = coe.eventid

                    where e.eventid=$eventId";

        $sentenceEvent = Connection::toConnect()->prepare($query);
        $sentenceEvent->execute();  

        return $sentenceEvent->fetchAll();

    }


    public static function LoadEventsByUserLikeCreator($userEmail)
    {
        $query = "select event.* FROM 
            actor inner join event
            on actor.eventid=event.eventid
            where useremail='$userEmail' and rol='creador'";

        $sentenceEvent = Connection::toConnect()->prepare($query);
        $sentenceEvent->execute();  

        return $sentenceEvent->fetchAll();

    }

     public static function LoadEventsByUserLikeActor($userEmail)
    {
        $query = "select event.* FROM 
            actor inner join event
            on actor.eventid=event.eventid
            where useremail='$userEmail' and rol!='creador'";

        $sentenceEvent = Connection::toConnect()->prepare($query);
        $sentenceEvent->execute();  

        return $sentenceEvent->fetchAll();

    }

}

?>