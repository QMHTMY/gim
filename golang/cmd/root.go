package cmd

import (
    "os"

    "github.com/spf13/cobra"
    "github.com/QMHTMY/gim/golang/gcmd"
    "github.com/QMHTMY/gim/golang/common"
)

var RootCmd = &cobra.Command{
    Use: "gim",
    Short: "推送代码到多平台",
    Long: `推送代码到多平台，包括github, gitee, coding, codeup, codehub`,
}

func addCommands() {
    RootCmd.AddCommand(pushCmd)
}

func Execute() {
    if len(os.Args) == 1 || os.Args[1] == "-h" || os.Args[1] == "--help" {
        gcmd.GitCmd([]string{})
    } else if os.Args[1] == common.Push {
        addCommands()
        RootCmd.Execute()
    } else {
        gcmd.GitCmd(os.Args[1:])
    }
}
