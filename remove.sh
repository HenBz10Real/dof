source $FUNCTION
sleep 2.5 && echo
echo "
█▄░█ █▀█ █▀█   ▀█▀ █░█░█ █▀▀ ▄▀█ █▄▀ █▀
█░▀█ █▄█ █▀▄   ░█░ ▀▄▀▄▀ ██▄ █▀█ █░█ ▄█"
sleep 2 && echo
echo ""
echo "Please wait, remove in your device... "
sleep 1 && echo
cmd package bg-dexopt-job > /dev/null 2>&1
settings delete global device_idle_constants light_after_inactive_to
sleep 1 && echo 
echo "Succes, done remove in your device."
sleep 2 && echo
echo ""
