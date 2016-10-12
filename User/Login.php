<?php 

 require '../Connection.php';

 $user=$_REQUEST['user'];
 $password=$_REQUEST['password'];

 $dateBaseConnection=Connection::toConnect();

 $query = "select * from user where useremail='$user' and userpassword='$password'";

 $queryResult =$dateBaseConnection->query($query);

 $data = $queryResult->fetchAll();

 echo json_encode($data)

 ?>



 