#!/usr/bin/env bash
INSTALL_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source ../../utils/utils.sh

BASE_FANDOM_URL="http://fandom.wikia.com/"

request_simple_pages() {
    array=(
        movies
        tv
        games
        careers
        about
    )
    for link in "${array[@]}"
    do
        shw_start_init "Requesting Articles ${BASE_FANDOM_URL}${link}"
        httpstat ${BASE_FANDOM_URL}${link}
        shw_success_final "Request to fandom has finished"
        echo ""
        sleep 2
    done
}

request_articles() {
    array=(
        articles/happy-festivus-and-pop-culture-holidays-worth-celebrating
        articles/messed-movies-made-oscar-winning-directors
        articles/overwatch-new-character
        articles/nintendo-switch-joy-con-sync-problems
        articles/fandom-predicts-winners-2017-oscars
        articles/call-of-duty-timeline
        articles/fall-movie-preview-sleepers
        articles/fandoms-battle-fantasy-foods-2016-finals
        articles/fandom-recommends-watch-play-june
        articles/wondercon-limitless-update
        articles/punisher-doesnt-make-sense-anymore
        articles/5-reasons-watching-expanse
        articles/heres-la-la-land-won-lost-oscars
    )
    for link in "${array[@]}"
    do
        shw_start_init "Requesting Articles ${BASE_FANDOM_URL}${link}"
        httpstat ${BASE_FANDOM_URL}${link}
        shw_success_final "Request to fandom has finished"
        echo ""
        sleep 2
    done
}

request_simple_pages
request_articles
