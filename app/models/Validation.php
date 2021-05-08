<?php

namespace app\models;

use app\Database;

class Validation{

    public function validate($username = '', $password =''){
        $db = Database::$db;

        $login = $db->validate($username);

        if($login && password_verify($password,$login['password'])){
            $_SESSION['current_user'] = $login;
            $this->redirect($login);
        }
        else{
            return ['*username or password is incorrect'];
        }   
        
    }

    public function redirect( $current_user){
        $role = $current_user['role'];

        if($role == 0){
            
            header("location:/");
            exit;
        }
        else{
            var_dump( $_SERVER['HTTP_REFERER']);
            header('location:/dashboard');
            
        }
        
        
    }
}