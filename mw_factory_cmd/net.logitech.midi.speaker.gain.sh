setprop net.logitech.midi.speaker.gain.status ng;am broadcast -a net.logitech.midi.speaker.gain --es  gain $1 > /dev/null;timeout=38;while ((timeout > 0));do let timeout--;status=$(getprop net.logitech.midi.speaker.gain.status);[ $status = "ok" ] && getprop net.logitech.midi.speaker.gain.return.value && getprop net.logitech.midi.speaker.gain.error.msg && getprop net.logitech.midi.speaker.gain.api.status  && break || sleep 0.8 && [ $status = "ng" ] && echo "RetVal=None" && echo "Error Message=APK NOT Ready" && echo "API Status=Sys" && break;done ;if [ $timeout -eq 0  ];then echo "RetVal=None";echo "Error Message=Timeout";echo "API Status=Sys";else echo "";fi