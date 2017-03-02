<?php

namespace Josh {


    ############################## HELPERS ##############################

    function dd(...$args)
    {
        ob_end_clean();
        \Kint::enabled(true);
        header('Content-Type: text/html');
        ddd(...$args);
    }

    function jIsArticle()
    {
        return strpos($_SERVER['REQUEST_URI'], '/articles/') !== false;
    }

    function jIsVideo()
    {
        return strpos($_SERVER['REQUEST_URI'], '/video/') !== false;
    }

    function jIsPost()
    {
        return (jIsArticle() || jIsVideo());
    }


    ############################## HELPERS ##############################
}

namespace {
    function jlog($msg, $data = [], $label = null){
        \Josh\JLogger::debug($msg, $data, $label);
    }

    function dd(...$args)
    {
        ob_end_clean();
        \Kint::enabled(true);
        header('Content-Type: text/html');
        ddd(...$args);
    }
}


