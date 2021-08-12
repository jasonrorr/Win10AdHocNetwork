# Win10AdHocNetwork

Ad-Hoc or local hosted networks were/are a popular way to connect devices wirelessly without a network router. However, in more recent updates and operating systems particularly Windows 10, support for hosted networks has been rolled back and even removed from newer network adapters.

Microsoft has announced that Wi-Fi card manufacturers should no longer support the hostednetwork protocol, and that newer cards and firmware updates should use the newer Wi-Fi Direct APIs for creating wireless access points.

---

However, some of us just want to do it the tried-and-true way, without having to learn a new API or wait for more mainstream support.

The main value of this project is contained in the README, where I will describe how to set Windows 10 up to automatically create a local hosted network on your computer at log-in.

Included in this project are two batch files, one for just simply creating the Ad-Hoc network if hosted networks are supported on your wireless adapter, and another for automatically creating an Ad-Hoc network with a [WiFi USB Adapter Dongle that supports Ad-Hoc networking](http://a.co/d/cAoH7CS "External Link: Amazon Shopping Edimax Nano Wi-Fi USB Adapter").

## Getting Started

You will need to do a few checks before determining if hosted networking is supported by your computer. Open up a command prompt window by pressing **WIN+R** and entering *cmd.exe*, by pressing **WIN+X** and selecting the Command Prompt from the Windows Power User menu, or by whatever other means you prefer to get to the Windows Command Processor.

In the Command Prompt window, enter the following command to check if your network adapter driver supports ad-hoc or hosted networking:
```
netsh wlan show drivers
```
In the output of the command, look for the line *Hosted network supported :* If it says "Yes", then your network adapter supports ad-hoc networking and you're good to go. 

**Image Placeholder**

If it says "No", there are many different schools of thought to get around this, but the easiest I've found is purchasing a separate WiFi adapter dongle that supports hosted networks and using that. Other potential solutions include:
- If this worked before updating Windows 10, you can try [downgrading your drivers](https://answers.microsoft.com/en-us/windows/forum/windows_10-networking/hosted-network-supported-no-after-upgrading-to/eebe7952-31d7-487a-bbee-ef52fa035c68 "External Link: Microsoft Answers Forum") to a previous version
- You can also try the opposite and [upgrade your network adapter driver](https://support.microsoft.com/en-us/help/4028443/windows-10-update-drivers "External Link: Microsoft Support") to the newest version and see if it changes anything.
- If all you're looking for is a way to share internet connection between your computer/laptop and a mobile device such as a phone or tablet, you can just use the built-in [Mobile Hotspot](https://support.microsoft.com/en-us/help/4027762/windows-use-your-pc-as-a-mobile-hotspot "External Link: Microsoft Support") feature in Windows 10 to bridge your internet connection to your device.

## Prerequisites

- A network adapter that supports ad-hoc networking (see above).
- Administrator privileges/login

## Set-Up

#### Download Batch Files
Download either **AdHoc.bat** or **AdHoc_WiFiDongle.bat** depending on which one matches your computer's set up and save it in a location where it won't be accidentally moved or deleted.

#### Customize Ad-Hoc Network
Open the Batch file in a text editor (I use Notepad++) and modify the ssid= and key= values to whatever you want your hosted network's name and password to be. 
*Note: The Key needs to be longer than 8 characters long or an error will be thrown and the creation of the network will fail*

#### Create a Task in the Windows Task Scheduler
1. Press **Win+R** and type in "taskschd.msc" into the command line. Press **Enter** to open the Windows Task Scheduler.
2. In the **Actions** pane on the right-hand side of the Task Scheduler window, select **Create Task...** to launch the Create Task window.
3. In the **General** tab of the Create Task window:
   1. Name your new task. (I used "CreateAdHoc")
   2. Select the radio button to **Run whether user is logged on or not**.
   3. Check the box to **Run with highest privileges**.
4. In the Triggers tab:
   1. Select **New...**
      1. Select **At log on** in the "Begin the task" drop-down.
      2. Click **OK**.
5. In the **Actions** tab:
   1. Select **New...**
      1. Make sure **Start a program** is selected in the "Action" drop-down.
      2. Click **Browse...** next to "Program/script".
      3. Navigate to where you saved **AdHoc.bat**, select the file, and click **Open**.
      4. Click **OK** to exit the New Action window.
6. Set any additional parameters in the Conditions and Settings tabs.
7. Click OK to create the task. You will be prompted to enter the Admin credentials before the task is saved.

If everything works out like it's supposed to, you will see a new network in the **Network and Sharing Center** with the SSID you configured earlier.

**Image Placeholder**

## Authors

* **Jason Orr** - *Initial work* - [jasonrorr](https://github.com/jasonrorr)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
