<?php


class Tour
{
    private $id;
    private $country_id;
    private $country_name;
    private $country_image;
    private $name;
    private $city_id;
    private $city_name;
    private $departure_city_id;
    private $departure_city_name;
    private $departure_time;
    private $departure_place;
    private $return_time;
    private $price;
    private $currency_id;
    private $currency_sign;
    private $description;
    private $main_image;
    private $hot;
    private $type;

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
    public function getCardName()
    {
        return $this->name;
    }

    /**
     * @return mixed
     */
    public function getHot()
    {
        return $this->hot;
    }

    /**
     * @return mixed
     */
    public function getCountryName()
    {
        return $this->country_name;
    }

    /**
     * @return mixed
     */
    public function getCountryImage()
    {
        return $this->country_image;
    }

    public function get (){
        return getCollageImgName($this->getCountryImage());
    }

    /**
     * @return mixed
     */
    public function getCityName()
    {
        return $this->city_name;
    }

    /**
     * @return mixed
     */
    public function getType()
    {
        return $this->type;
    }

    /**
     * @return mixed
     */
    public function getMainImage()
    {
        return $this->main_image;
    }

    /**
     * @return string
     */
    public function getFullPrice(){
        return $this->currency_sign . $this->price;
    }

    /**
     * @return mixed
     */
    public function getPrice()
    {
        return $this->price;
    }

    /**
     * @return string
     */
    public function getDepartureDate(){
        $day = date("d", $this->departure_time);
        $month = date("n", $this->departure_time);
        $year = date("Y", $this->departure_time);

        return  $day. " " . $this->getUAMonthName($month) . " " . $year;
    }

    /**
     * @return string
     */
    public function getCompareDate(){
        $day = date("d", $this->departure_time);
        $month = date("m", $this->departure_time);
        $year = date("Y", $this->departure_time);

        return  $year . $month . $day;
    }


    /**
     * @return false|string
     */
    public function getDepartureTime(){
        return date("H:i", $this->departure_time);
    }


    /**
     * @param $monthNo
     * @return string
     */
    private function getUAMonthName($monthNo){
        $monthsUA = [
            1 => 'Січня',
            2 => 'Лютого',
            3 => 'Березеня',
            4 => 'Квітня',
            5 => 'Травня',
            6 => 'Червня',
            7 => 'Липня',
            8 => 'Серпня',
            9 => 'Вересня',
            10 => 'Жовтня',
            11 => 'Листопада',
            12 => 'Грудня'
        ];

        return $monthsUA[$monthNo];
    }

    public function getDaysCount(){
        $diff = $this->return_time - $this->departure_time;
        $daysCnt = ceil($diff / 86400);
        $nightsCnt = $daysCnt - 1;

        return $daysCnt . " Днів, " . $nightsCnt . " Ночей";
    }

    /**
     * @return string
     */
    public function getDepartureCityName(){
        return $this->departure_city_name;
    }

    /**
     * @return string
     */
    public function getDeparturePlaceName(){
        return $this->departure_place;
    }

    /**
     * @return string
     */
    public function getReturnDate(){
        $day = date("d", $this->return_time);
        $month = date("n", $this->return_time);
        $year = date("Y", $this->return_time);

        return  $day. " " . $this->getUAMonthName($month) . " " . $year;
    }

    /**
     * @return false|string
     */
    public function getReturnTime(){
        return date("H:i", $this->return_time);
    }

    /**
     * @return mixed
     */
    public function getCountryId()
    {
        return $this->country_id;
    }

    /**
     * @return mixed
     */
    public function getDescription()
    {
        return $this->description;
    }

    public function getCardTypeClass(){
        switch(mb_strtolower($this->getType())){
            case 'пригоди': return 'adventures';
            case 'релакс': return 'relax';
            default: return 'adventures';
        }
    }
}
