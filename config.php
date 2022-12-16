<?php

define("DB_SYSTEM", "mysql");
define("DB_HOST", "localhost");
define("DB_NAME", "agency");
define("DB_CHARSET", "utf8");
define("DB_LOGIN", "root");
//define("DB_PASSWORD", "root");
if($_SERVER['SERVER_ADDR'] === '192.168.0.103'){
    define("DB_PASSWORD", "");
}else{
    define("DB_PASSWORD", "root");
}

define("DEFAULT_MAIN_IMAGE", "images/default_main_image.jpg");
define("COUNTRY_IMAGES_DIR", "images/countries/");
define("COLLAGES_DIR", "images/collages/");
define("CAPTION_IMAGES_DIR", "images/captions/");



