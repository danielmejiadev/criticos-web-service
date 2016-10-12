<?php

class Connection
{

    private static $pdo;
  
    /**
     * Crear una nueva conexión PDO basada en los datos de conexión
     */
    public function toConnect()
    {
        if (self::$pdo == null) 
        {
            self::$pdo = new PDO
            (
              "mysql:host=localhost; dbname=criticos","root",""
            );

            self::$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        }

        return self::$pdo;
    }
    

    private function _destroy()
    {
        self::$pdo = null;
    }
}

?>