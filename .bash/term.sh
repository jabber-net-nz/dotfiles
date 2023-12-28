export HN=`hostname -s`;

# if we are in a screen session, then we need to setup starship 
# to use normal colours
if [ " $STY" == " " ]; then
  echo -n ""
  #export TERM=xterm-256color
else
  export STARSHIP_CONFIG=~/.config/starship-screen.toml
fi


