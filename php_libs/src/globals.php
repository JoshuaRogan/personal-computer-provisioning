<?php
namespace Josh;


############################## HELPERS ##############################

function dd(...$args) {
    ddd(...$args);
}

function jIsArticle(){
    return strpos($_SERVER['REQUEST_URI'], '/articles/') !== false;
}
function jIsVideo(){
    return strpos($_SERVER['REQUEST_URI'], '/video/') !== false;
}
function jIsPost(){
    return (jIsArticle() || jIsVideo());
}


############################## HELPERS ##############################