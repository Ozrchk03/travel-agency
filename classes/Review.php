<?php


class Review
{
    private $id;
    private $description;
    private $score;
    private $forename;
    private $surname;



    /**
     * @return mixed
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @return string
     */
    public function getFullName(){
        return  $this->forename . " " . $this->surname;
    }

    /**
     * @return mixed
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * @return mixed
     */
    public function getScore()
    {
        return $this->score;
    }

}