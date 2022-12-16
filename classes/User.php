<?php


class User
{

    private $id;
    private $forename;
    private $surname;
    private $phone;
    private $email;
    private $password;
    private $pdo;


    /**
     * User constructor.
     */
    public function __construct()
    {
        $this->pdo = getPDOObject();
    }

    /**
     * @param mixed $id
     */
    public function setId($id)
    {
        $this->id = $id;
    }

    public function setForename($forename){
        $this->forename = $forename;
    }

    public function setSurname($surname){
        $this->surname = $surname;
    }

    public function setPhone($phone){
        $this->phone = $phone;
    }

    public function setEmail($email){
        $this->email = $email;
    }

    public function setPassword($password){
        $this->password = $password;
    }

    /**
     * @return mixed
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @return mixed
     */
    public function getForename()
    {
        return $this->forename;
    }

    /**
     * @return mixed
     */
    public function getSurname()
    {
        return $this->surname;
    }

    /**
     * @return mixed
     */
    public function getPhone()
    {
        return $this->phone;
    }

    /**
     * @return mixed
     */
    public function getEmail()
    {
        return $this->email;
    }

    /**
     * @return mixed
     */
    public function getPassword()
    {
        return $this->password;
    }

    /**
     * @return mixed
     */
    public function getPasswordHash()
    {
        return password_hash($this->getPassword(), PASSWORD_DEFAULT);
    }


    public function create(){
        if( $this->emailExists($this->email) ) {
            return false;
        }

        $params = [
            'forename'  => $this->getForename(),
            'surname'   => $this->getSurname(),
            'email'     => $this->getEmail(),
            'phone'     => $this->getPhone(),
            'password'  => $this->getPasswordHash()
        ];

        $sql = "INSERT INTO user (forename, surname, email, phone, password) VALUES (:forename, :surname, :email, :phone, :password)";
        $stmt= $this->pdo->prepare($sql);
        $res = $stmt->execute($params);

        return $res;
    }

    private function emailExists($email){
        $sql = "
            SELECT count(*) AS cnt FROM user
            WHERE email=:email";

        $params = [
            'email' => $email
        ];

        // select a particular user by id
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute($params);
        $res = $stmt->fetch();

        return $res['cnt'];
    }

    public function signIn(){
        $sql = "
            SELECT * FROM user
               WHERE email=:email";

        $params = [
            'email' => $this->getEmail()
        ];

        // select a particular user by id
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute($params);
        $userData = $stmt->fetch();


        if( !password_verify($this->getPassword(), $userData['password']) ) {

            return false;
        }

        $this->setId($userData['id']);
        $this->setForename($userData['forename']);
        $this->setSurname($userData['surname']);
        $this->setPhone($userData['phone']);

        return true;
    }

}