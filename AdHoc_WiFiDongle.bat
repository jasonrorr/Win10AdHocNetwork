rem Display outputs of the command prompt to the user
ECHO ON

rem Set the ad hoc network parameters and start the network
netsh wlan set hostednetwork mode=allow ssid=adhocnetwork key=adhocnetwork
netsh wlan start hostednetwork

pause
cls
exit