#!/bin/bash
# 2020-09-08
# 一次推送代码到多个托管平台

### Description:
###     Gitm — Push code to multiple Opensource-Platforms
###         Author: Shieber <QMH_XB_FLTMY@yahoo.com>
###
### Usage:
###     Gitm <command>
###
### Options:
###     <command>   command to execute.
###     -h,--help   Show help message.
###
### Example:
###     Gitm -h
###     Gitm --help
###     Gitm push         #push to all platforms you've set. (default)
###     Gitm push gitee   #push to a single platform from platforms you've set.
###     Gitm push coding
###     Gitm push github
###    

#吉祥物
Tux="🐧🐧🐧."  #Linux吉祥物
China="🐉"     #中国龙🐲
America="🦅"   #美国鹰

#帮助函数
function help() {
    sed -rn 's/^### ?//;T;p' "$0"
}

#推送函数
function pushTo() {
    if [[ "$1" == "gitee" ]]; then
        county="中国"
        symbol="$China"
        platform="$1"
        platformtitle="码云Gitee "
    elif [[ "$1" == "coding" ]]; then
        county="中国"
        symbol="$China"
        platform="$1"
        platformtitle="腾讯Coding"
    elif [[ "$1" == "codeup" ]]; then
        county="中国"
        symbol="$China"
        platform="$1"
        platformtitle="阿里Codeup"
    elif [[ "$1" == "github" ]]; then
        county="美国"
        symbol="$America"
        platform="github"
        platformtitle="微软Github"
    fi

    echo "$Tux 推送当前分支代码到$platformtitle $county$symbol"

    stt=`date +%s`
    git push $platform master
    edt=`date +%s`

    echo "耗时: $(($edt - $stt))s"
    echo ""
}

if [[ $# == 0 ]] || [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]]; then
    help
    exit 1
fi

if [[ "$1" == "push" ]]; then
    if [[ "$2" == "gitee" ]]; then
        pushTo gitee
    elif [[ "$2" == "coding" ]]; then
        pushTo coding
    elif [[ "$2" == "codeup" ]]; then
        pushTo codeup
    elif [[ "$2" == "github" ]]; then
        pushTo github
    elif [[ "$2" == "all" ]]; then
        platforms=`git remote -v | grep "push" | awk '{print $1}'`
        for platform in "${platforms}"; do
            pushTo platform
        done
    else
        pushTo origin
    fi
else
    help
    exit 1
fi
