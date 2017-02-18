<?php
/**
 * Created by PhpStorm.
 * User: joshrogan
 * Date: 2/15/17
 * Time: 8:07 PM
 */

namespace Upstream;


class ReplaceImages {

    public static function start() {
        if ( Config::EXTERNAL_IMAGES ) {
            ob_start(function ($buffer) {
                $root = Config::homeUrl();
                $content = str_replace( "$root/wp-content/uploads", "http://fandom.wikia.com/wp-content/uploads", $buffer );
                $content = str_replace( "http://fandom.wikia.com/articles", "$root/articles", $content );
                $content = str_replace( "http://fandom.wikia.com/videos", "$root/videos", $content );
                //                $content = preg_replace( '@https?://fandom[.]wikia[.]com(?=/(videos|articles))@', $root , $content );
                return $content;
            });
        }
    }

    public static function stop() {
        if ( Config::EXTERNAL_IMAGES ) {
            ob_end_flush();
        }
    }
}