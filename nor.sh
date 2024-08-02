#!/system/bin/sh
source $FUNCTION
ver="7.0 Online"
dev=@HenVx0
echo ""
echo "
█▄░█ █▀█ █▀█   ▀█▀ █░█░█ █▀▀ ▄▀█ █▄▀ █▀
█░▀█ █▄█ █▀▄   ░█░ ▀▄▀▄▀ ██▄ █▀█ █░█ ▄█"
sleep 2 && echo
echo "Developer : ${dev} "
echo "Version : ${ver} "
echo "Source : - "
#function resource @Henpeex copy and ekstrak file and automatic running
#Use render smooth
setprop debug.hwui.renderer skiagl
#Mengontrol apakah HWUI akan mengirimkan petunjuk waktu ke HintManager
#penjadwalan CPU yang lebih baik.
setprop debug.hwui.use_hint_manager true
#Persentase waktu frame yang digunakan untuk kerja CPU. Sisanya adalah
#dicadangkan untuk pekerjaan GPU. Ini digunakan dengan use_hint_manager ke
#memberikan petunjuk waktu ke HintManager
setprop debug.hwui.target_cpu_time_percent 85
setprop debug.hwui.profile false
setprop debug.renderengine.skia_tracing_enabled false
#Doze tweaks form android without root
settings put global device_idle_constants light_after_inactive_to 2592000000
#trim memory ui system ( untuk mengurangi penggunaan memory sebanyak mungkin )
am send-trim-memory --user 0 com.android.systemui RUNNING_CRITICAL
cmd otadexopt cleanup > /dev/null 2>&1
sleep 1 && echo
#Apps optimazion with jit compiler
for app in $(cmd package list packages | cut -f 2 -d ":"); do
cmd appops set "$app" RUN_IN_BACKGROUND ignore> /dev/null 2>&1 && echo Optimization Apps || echo Device not support
done
for app in $(cmd package list packages | cut -f 2 -d ":"); do
find "$app" -iname "cache" -exec rm -rf {} +
find "$app/files" -iname "cache" -exec rm -rf {} +
find "$app/file" -iname "cache" -exec rm -rf {} +
find "$app" -iname "cache" -exec rm -rf {} +
done
sleep 1 && echo 
echo "Succes, done installing your device."
cmd notification post -i /sdcard/logo.png -S inbox -t 'NORTWEAKS+' 'tag' 'Programs Running Always'
sleep 2 && echo
echo ""
