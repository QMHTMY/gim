package gcmd

import (
    "fmt"
    "io/ioutil"
    "os/exec"

    "github.com/QMHTMY/gim/golang/common"
)

func GitCmd(args []string) {
    var cmd *exec.Cmd

    if len(args) == 0 {
        cmd = exec.Command(common.Git)
    } else {
        cmd = exec.Command(common.Git, args...)
    }

    stdout, _ := cmd.StdoutPipe()
    if err := cmd.Start(); err != nil {
        fmt.Println("Error:", err.Error())
        return
    }
    bytes, _ := ioutil.ReadAll(stdout)
    stdout.Close()

    if err := cmd.Wait(); err != nil {
        fmt.Printf("%s", bytes)
        return
    }

    fmt.Printf("%s", bytes)
}
