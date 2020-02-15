FROM ubuntu:18.04

WORKDIR /steam

RUN apt-get update && apt-get install lib32gcc1 wget -y \
  && wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz \
  && tar -xvzf steamcmd_linux.tar.gz

RUN ./steamcmd.sh +login anonymous +force_install_dir /steam/ark +app_update 376030 validate +quit
# echo " \
#   login anonymous \
#   force_install_dir /steam/ark/ \
#   app_update 376030 validate \
#   quit \
#   " |

ENTRYPOINT [ "/steam/ark/ShooterGame/Binaries/Linux/ShooterGameServer" ]

# docker run -p 27015:27015 -it f66a 'TheIsland?listen?SessionName=aiueo?ServerPassword=ark?ServerAdminPassword=admin'

# docker built .
