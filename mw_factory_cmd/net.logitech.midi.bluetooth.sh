setprop net.logitech.midi.bluetooth.status ng;am broadcast -a net.logitech.midi.bluetooth > /dev/null;timeout=38;while ((timeout > 0));do let timeout--;status=$(getprop net.logitech.midi.bluetooth.status);[ $status = "ok" ] && getprop net.logitech.midi.bluetooth.return.value && getprop net.logitech.midi.bluetooth.error.msg && getprop net.logitech.midi.bluetooth.api.status  && break || sleep 0.8 && [ $status = "ng" ] && echo "RetVal=None" && echo "Error Message=APK NOT Ready" && echo "API Status=Sys" && break;done ;if [ $timeout -eq 0  ];then echo "RetVal=None";echo "Error Message=Timeout";echo "API Status=Sys";else echo "";fi