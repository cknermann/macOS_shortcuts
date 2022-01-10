POWERMODE=$(pmset -g | grep lowpowermode | tr -dc '0-9')

if [ $POWERMODE == 0 ]
then
   sudo pmset -a lowpowermode 1
else
   sudo pmset -a lowpowermode 0
fi