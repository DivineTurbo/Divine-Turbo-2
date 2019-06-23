ui_print " "
# Use the current running profile in case of upgrade
if $KEEPPROFILE ; then
	PROFILEMODE=$(cat /data/adb/lktprofile.txt | tr -d '\n')
fi

 sleep "1"

if [ -z $PROFILEMODE ] ; then
  ui_print " "

  ui_print "- Strm 模式选择 "
  ui_print " "
  ui_print "   1. 省电模式"
  ui_print "   2. 平衡模式"
  ui_print "   3. 性能模式"
  ui_print "   4. 涡轮模式"
  ui_print " "
  ui_print "- 请选择模块模式 "
  ui_print " "
  ui_print "   Vol(+) = 省电模式"
  ui_print "   Vol(-) = 更多选择.."
  ui_print " "

  if $VKSEL; then
    PROFILEMODE=0
    ui_print "   你已选择省电模式。"
    ui_print " "

  else
  ui_print "- 请选择模块模式 "
  ui_print " "
  ui_print "   Vol(+) = 平衡模式"
  ui_print "   Vol(-) = 更多选择.."
  ui_print " "

  if $VKSEL; then
    PROFILEMODE=1
    ui_print "   你已选择平衡模式。"
    ui_print " "

  else

  ui_print "- 请选择模块模式 "
  ui_print " "
  ui_print "   Vol(+) = 性能模式"
  ui_print "   Vol(-) = 更多选择.."
  ui_print " "

  if $VKSEL; then
    PROFILEMODE=2
    ui_print "   你已选择性能模式。"
    ui_print " "

  else

  ui_print "- 请选择模块模式 "
  ui_print " "
  ui_print "   Vol(+) = 涡轮模式"
  ui_print " "

  if $VKSEL; then
    PROFILEMODE=3
    ui_print "   你已选择涡轮模式。"
    ui_print " "

  else
    PROFILEMODE=1
    ui_print "- 输入不正确。"
    ui_print "- 选择配置文件"
    ui_print " "
  fi
  fi
  fi
  fi
  elif [ ${PROFILEMODE} -eq 0 ];then
  ui_print "   您的选择 = 省电模式"
  ui_print " "
  elif [ ${PROFILEMODE} -eq 1 ];then
  ui_print "   您的选择 = 平衡模式"
  ui_print " "
  elif [ ${PROFILEMODE} -eq 2 ];then
  ui_print "   您的选择= 性能模式"
  ui_print " "
  elif [ ${PROFILEMODE} -eq 3 ];then
  ui_print "   您的选择 = 涡轮模式"
  ui_print " "
  else
  ui_print " "
  ui_print " "
  fi

  VER=$(cat ${TMPDIR}/module.prop | grep -oE 'version=v[0-9].[0-9]+' | awk -F= '{ print $2 }' )
  
  sed -i "s/<VER>/${VER}/g" ${TMPDIR}/common/service.sh
  sed -i "s/<PROFILE_MODE>/${PROFILEMODE}/g" ${TMPDIR}/common/service.sh

ui_print "- 感谢LTK提供的源码"
ui_print " "
ui_print "- 安装配置中"
ui_print "安装完毕 "
ui_print " "

