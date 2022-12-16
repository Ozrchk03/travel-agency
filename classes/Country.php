<?php


class Country
{
    private $id;
    private $name;
    private $region_id;
    private $region_name;
    private $main_image;
    private $description;

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
    public function getName()
    {
        return $this->name;
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
    public function getMainImage()
    {
        return $this->main_image;
    }

    /**
     * @return mixed
     */
    public function getRegionName()
    {
        return $this->region_name;
    }

}