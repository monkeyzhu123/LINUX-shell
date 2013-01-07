#!/bin/bash
#set -x
#author:monkeyzhu
echo "create the script 2013-01-07"
echo "**********  `date +%Y/%m/%d---%H:%M:%S`  **********"
#display "CPU,MEMORY,DISK,NETWORK OR OTHER FOR YOU WANT CODE"
#BUT NOT MORE THE SYSTEM CODE,I HANDLE IT.
################ DEFINE FUNCTION PART ###########
function mon_uptime
{
    uptime_time=`uptime|awk -F, '{print$1}'`
    uptime_user=`uptime|awk -F, '{print$2}'`
    echo "System total running time $uptime_time"
    echo "login user for now:$uptime_user"
    echo "display users('w' code)"
    w
}

function mon_iostat
{
    iostat|sed '1,2d'|sed '3,6d'
}

function mon_vmstat
{
    vmstat 1 5
}

function mon_df
{
    echo "分区名 文件系统类型 分区大小 已使用空间 剩余空间 空闲百分比 挂载点"
    df -hT|sed '1d'|grep -v tmpfs|awk '{print$1"\t"$2"\t"$3"\t"$4"          "$5"\t"$6"         "$7}'
}
function mon_user_input
{
    read -p "input your order like in shell:" input_order
    $input_order
}

################ BEGIN MAIN #####################

echo "**********  i can do those things  ***********"
PS3="请输入编号查询或者键入enter显示菜单:"
select input in "uptime" "iostat" "vmstat" "df" "support_your_enter_code" "exit" "*"
do
    case $input in
        uptime)    mon_uptime
                ;;
        iostat)    mon_iostat
                ;;
        vmstat)    mon_vmstat
                ;;
        df)        mon_df
                ;;
        support_your_enter_code)
                   mon_user_input
                ;;
        exit)
                break
                ;;
        *)        echo "i don't handle it!"
                ;;
    esac
done
