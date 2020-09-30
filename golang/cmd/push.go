package cmd

import (
    "github.com/spf13/cobra"
    "github.com/QMHTMY/gim/golang/gcmd"
    "github.com/QMHTMY/gim/golang/common"
)

var pushCmd = &cobra.Command{
    Use: "push",
    Short: "推送到平台",
    Long: `推送到各大平台，包括github gitee coding codeup codehub`,
    Run: pushRun,
}

func pushRun(cmd *cobra.Command, args []string) {
    if len(args) == 0 {
        gcmd.Push2origin()
    } else if len(args) == 1 {
        gcmd.Push2platform(args[0], common.Master)
    } else if len(args) == 2 {
        gcmd.Push2platform(args[0], args[1])
    } else {
        gcmd.Help()
    }
}
