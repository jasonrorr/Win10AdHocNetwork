rem Display outputs of the command prompt to the user
ECHO ON

rem Disable the default Wi-Fi network adapter so that the Wi-Fi dongle will be the default to start the hosted network
netsh interface set interface name="Wi-Fi" admin=DISABLED

rem Set the ad hoc network parameters and start the network
netsh wlan set hostednetwork mode=allow ssid=adhocnetwork key=adhocnetwork
netsh wlan start hostednetwork

rem Re-enable the default wireless interface so that wireless internet access is still available
netsh interface set interface name="Wi-Fi" admin=ENABLED

cls
exit