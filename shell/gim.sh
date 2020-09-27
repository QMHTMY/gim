#!/bin/bash
# 2020-09-07
# 一次推送代码到多个托管平台

### 简介:
###     gim — 推送代码到多个托管平台
###
### 作者: Shieber <QMH_XB_FLTMY@yahoo.com>
###
### 使用:
###     gim <command> 
###     gim push [platform] [branch]
###
### 选项:
###     <command>   命令
###     [platform]  平台
###     [branch]    分支
###     -h          显示push帮助信息
###     --help      显示所有帮助信息
###
### 用例:
###     gim -h
###     gim --help
###     gim add file
###     gim push                 # 推送到origin (默认)
###     gim push all master      # 推送到所有平台
###     gim push gitee master    # 推送到单个平台
###     gim push github main     # 2020.10.1, github用main替代master
###     gim push codeup master   # 目前支持的代码托管平台
###     gim push coding dev      # gitee  -- 码云  codeup  -- 阿里 
###     gim push codehup beta    # coding -- 腾讯  codehub -- 华为 github -- 微软

#吉祥物
TUX="🐧🐧🐧.."                 #Linux吉祥物
DOVE="🕊️"                      #和平鸽🕊️
CHINA="🐉"                     #中国龙🐲
AMERICA="🦅"                   #美国鹰🦅
PRETITLE="推送当前代码分支到"

#帮助函数
function help() {
    sed -rn 's/^### ?//;T;p' "$0"
}

#推送函数
function pushTo() {
    symbol="$CHINA"
    country="中国"
    platform="$1"

    if   [[ "$platform" == "gitee"   ]]; then
        title="码云Gitee  "
    elif [[ "$platform" == "coding"  ]]; then
        title="腾讯Coding "
    elif [[ "$platform" == "codeup"  ]]; then
        title="阿里Codeup "
    elif [[ "$platform" == "codehub" ]]; then
        title="华为Codehub"
    elif [[ "$platform" == "origin"  ]]; then
        country=""
        symbol="$DOVE"
        title="Origin"
    elif [[ "$platform" == "github"  ]]; then
        country="美国"
        symbol="$AMERICA"
        title="微软Github "
    fi

    echo "$TUX $PRETITLE$title $country$symbol"
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
