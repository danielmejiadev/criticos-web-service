<?php

require '../Connection.php';

class UserCrud
{
    function __construct()
    {
    }

    public static function searchByEmail($userEmail)
    {
        $dateBaseConnection=Connection::toConnect();

        $query = "select * from user where useremail='$userEmail'";

        $queryResult =$dateBaseConnection->query($query);

        $data = $queryResult->fetchAll();

        return  $data;
    }

    public static function insert(
        $userEmail,
        $userPassword,
        $userName,
        $userLastName,
        $userOccupation,
        $userPicture,
        $userState
        )
    {
        $searchUser= UserCrud::searchByEmail($userEmail);

        if(!empty($searchUser))
        {
           return array('state' => false, 'message' => 'Ya existe un usuario con este correo');
        }
        else 
        {
            $query = "insert into user ( " .
            " useremail," .
            " userpassword," .
            " username," .
            " userlastname," .
            " useroccupation," .
            " userpicture,".
            " userstate)" .
            " VALUES( ?,?,?,?,?,?,?)";


            $sentence = Connection::toConnect()->prepare($query);

            $result = $sentence->execute(
                array(
                    $userEmail,
                    $userPassword,
                    $userName,
                    $userLastName,
                    $userOccupation,
                    $userPicture,
                    $userState));

            if($result)
            {
                return array('state' => true, 'message' => 'Usuario registrado exitosamente');
            }
            else
            {
                return array('state' => false, 'message' => 'No se ha podido registra el usuario');
            }
        }
    }


    public static function update(
        $userEmailNew,
        $userEmailOld,
        $userPassword,
        $userName,
        $userLastName,
        $userOccupation,
        $userPicture,
        $userState
    )
    {
        $searchUser=array();

        if($userEmailNew!=$userEmailOld)
        {
            $searchUser=UserCrud::searchByEmail($userEmailNew);
        }

        if(!empty($searchUser))
        {
           return array('state' => false, 'message' => 'Ya existe un usuario con este correo');
        }
        else 
        {
             $query = "update user" .
            " SET useremail=?, userpassword=?, username=?, userlastname=?, useroccupation=?, userpicture=?, userstate=? " .
            "WHERE useremail=?";

             $sentence = Connection::toConnect()->prepare($query);

             $result = $sentence->execute(
                array(
                    $userEmailNew,
                    $userPassword,
                    $userName,
                    $userLastName,
                    $userOccupation,
                    $userPicture,
                    $userState,
                    $userEmailOld));
           
            if($result)
            {
                return array('state' => true, 'message' => 'Actualizacion exitosa');
            }
            else
            {
                return array('state' => false, 'message' => 'Actualizacion fallida');
            }
        }
       
    }


}

?>