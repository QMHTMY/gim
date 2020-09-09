#!/bin/bash
# 2020-09-07
# 一次推送代码到多个托管平台

### Description:
###     Gitm — Push code to multiple Opensource-Platforms
###          Author: Shieber <QMH_XB_FLTMY@yahoo.com>
###
### Usage:
###     Gitm <command>
###
### Options:
###     <command>   command to execute.
###     -h          Show help message for push.
###     --help      Show help message of git.
###
### Examples:
###     Gitm -h
###     Gitm --help
###     Gitm add file     
###     Gitm push         #push to <origin> platform you've set. (default)
###     Gitm push all     #push to <all> platforms you've set.
###     Gitm push gitee   #push to <a single> platform.
###     Gitm push coding
###     Gitm push codeup
###     Gitm push github
###     Gitm push codehup
###    

#吉祥物
Tux="🐧🐧🐧.."                 #Linux吉祥物
Dove="🕊️"                      #和平鸽🕊️
China="🐉"                     #中国龙🐲
America="🦅"                   #美国鹰🦅
Pretitle="推送当前代码分支到"

#帮助函数
function help() {
    sed -rn 's/^### ?//;T;p' "$0"
}

#推送函数
function pushTo() {
    symbol="$China"
    country="中国"
    platform="$1"

    if   [[ "$platform" == "gitee"   ]]; then
        title="码云Gitee "
    elif [[ "$platform" == "coding"  ]]; then
        title="腾讯Coding"
    elif [[ "$platform" == "codeup"  ]]; then
        title="阿里Codeup"
    elif [[ "$platform" == "codehub" ]]; then
        title="华为Codehub"
    elif [[ "$platform" == "origin"  ]]; then
        country=""
        symbol="$Dove"
        title="Origin"
    elif [[ "$platform" == "github"  ]]; then
        country="美国"
        symbol="$America"
        title="微软Github"
    fi

    echo "$Tux $Pretitle$title $country$symbol"
    stt=`date +%s`
    git push $@
    edt=`date +%s`
    echo "耗时: $(($edt - $stt))s"
    echo ""
}

#脚本执行入口
if   [[ $# == 0 ]]  || [[ "$1" == "--help" ]]; then
    git $@
elif [[ "$1" == "-h"   ]]; then
    help
elif [[ "$1" == "push" ]]; then
    if   [[ "$2" == "" ]]; then
        git push
    elif [[ "$2" == "gitee"   ]]; then
        pushTo $2 $3
    elif [[ "$2" == "coding"  ]]; then
        pushTo $2 $3
    elif [[ "$2" == "codeup"  ]]; then
        pushTo $2 $3
    elif [[ "$2" == "codehub" ]]; then
        pushTo $2 $3
    elif [[ "$2" == "github"  ]]; then
        pushTo $2 $3
    elif [[ "$2" == "all"     ]]; then
        platforms=`git remote`
        for platform in ${platforms}; do
            pushTo ${platform} $3
        done
    else
        git $@
    fi
else
    git $@
fi
