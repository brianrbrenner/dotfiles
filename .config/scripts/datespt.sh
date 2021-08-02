 while true; do
      
     export DISPLAY=:0

     DATE=$(/bin/date +"%a %b %d %H:%M")

     ROOT="$DATE"

     xsetroot -name "$DATE"
      
     sleep 1s

done 
