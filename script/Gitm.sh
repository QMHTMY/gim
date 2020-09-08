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
help() {
    sed -rn 's/^### ?//;T;p' "$0"
}


#吉祥物
Tux="🐧🐧🐧"   #Linux吉祥物
China="🐉"     #中国龙🐲
America="🦅"   #美国鹰

#推送函数
function push2platform() {
    if [[ $# == 0 ]] || [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]];then
        help
        exit 1
    elif [[ "$1" == "gitee" ]]; then
        county="中国"
        symbol="$China"
        platform="$1"
        platforms="码云Gitee "
    elif [[ "$1" == "coding" ]]; then
        county="中国"
        symbol="$China"
        platform="$1"
        platforms="腾讯Coding"
    elif [[ "$1" == "codeup" ]]; then
        county="中国"
        symbol="$China"
        platform="$1"
        platforms="阿里Codeup"
    else
        county="美国"
        symbol="$America"
        platform="github"
        platforms="微软Github"
    fi

    echo "$Tux. 推送当前分支代码到$platforms $county$symbol"
    stt=`date +%s`
    #git push $platform master
    edt=`date +%s`
    echo "$platform"
    echo "耗时: $(($edt - $stt))s"
    echo ""
}

push2platform gitee
push2platform coding
push2platform codeup
push2platform github
