package common

// 平台
var Platforms = []string{"github", "gitee", "coding", "codeup", "codehub", "origin"}

func InPlatforms(platform string) bool {
    for _, p := range Platforms {
        if p == platform {
            return true
        }
    }
    return false
}

// 分支名
const (
    All = "all"
    Main = "main"
    Master = "master"
    Origin = "origin"
)

// git指令
const (
    Git = "git"
    Push = "push"
    Remote = "remote"
)

// 特殊符号
const (
    TUX = "🐧🐧🐧.. "                //Linux吉祥物
    DOVE = "🕊️"                      //和平鸽🕊️
    CHINA = "🐉"                     //中国龙🐲
    AMERICA = "🦅"                   //美国鹰🦅
    PRETITLE = "推送当前代码分支到"  //标题前缀
)

// 标题
var Titles = map[string]string{
    "origin":  TUX + PRETITLE +"Origin"       + " "    + DOVE,
    "gitee":   TUX + PRETITLE +"码云Gitee   " + "中国" + CHINA,
    "coding":  TUX + PRETITLE +"腾讯Coding  " + "中国" + CHINA,
    "codeup":  TUX + PRETITLE +"阿里Codeup  " + "中国" + CHINA,
    "github":  TUX + PRETITLE +"微软Github  " + "美国" + AMERICA,
    "codehub": TUX + PRETITLE +"华为Codehub " + "中国" + CHINA,
}

// 帮助信息，在push参数多于两个时显示
var  Help_msg = `
简介:
    gim — 推送代码到多个托管平台

作者: Shieber <QMH_XB_FLTMY@yahoo.com>

使用:
    gim <command> 
    gim push [platform] [branch]

选项:
    <command>   命令
    [platform]  平台
    [branch]    分支
    -h          显示push帮助信息
    --help      显示push帮助信息

用例:
    gim --help
    gim add file
    gim push -h              # 输出push的帮助信息
    gim push --help          # 输出push的帮助信息
    gim push                 # 推送到origin master (默认)
    gim push all brach       # 推送到所有平台branch分支
    gim push gitee master    # 推送到单个平台master分支
    gim push github main     # 2020.10.1, github用main替代master
    gim push codeup master   # 目前支持的代码托管平台
    gim push coding dev      # gitee  -- 码云  codeup  -- 阿里 
    gim push codehup beta    # coding -- 腾讯  codehub -- 华为 github -- 微软`
