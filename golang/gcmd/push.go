package gcmd

import (
    "fmt"
    "os"
    "time"
    "bytes"
    "os/exec"
    "strings"

    "github.com/QMHTMY/gim/golang/common"
)

func Help() {
    fmt.Println(common.Help_msg)
}

func Push2origin() {
    push(common.Origin, common.Master)
}

func Push2platform(platform, branch string) {
    if platform == common.All {
        cmd := exec.Command(common.Git, common.Remote)
        output, _ := cmd.Output()
        output = output[:len(output)-1]
        for _, p := range strings.Split(string(output), "\n") {
            push(p, branch)
        }
    } else {
        push(platform, branch)
    }
}

func push(platform, branch string) {
    title := getTitle(platform)
    fmt.Println(title)

    start := time.Now().Second()

    var out bytes.Buffer
    cmd := exec.Command(common.Git, common.Push, platform, branch)
    cmd.Stdout = &out
    cmd.Stderr = &out
    if err := cmd.Run(); err != nil {
        fmt.Println(err)
    }
    fmt.Printf("%s", out.String())

    end := time.Now().Second()
    elapsed(start, end)
}

func getTitle(platform string) string {
    var title string

    if common.InPlatforms(platform) {
        title = common.Titles[platform]
    } else {
        fmt.Println("不支持的平台"+platform+", 目前支持如下平台" )
        for i, p := range common.Platforms {
            fmt.Printf("(%d) %s\n", i+1, p)
        }
        os.Exit(1)
    }

    return title
}

func elapsed(start, end int) {
    elapse := end - start
    if elapse < 0 {
        elapse = 0
    }
    fmt.Printf("耗时: %ds\n\n", elapse)
}
