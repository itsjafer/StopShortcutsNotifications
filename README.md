# StopShortcutNotifications

This tweak, written in Objective-C, stops the 'Shortcuts' app from sending any and all notifications. Why? Because the shortcuts app sends extremely annoying notifications everytime an automation runs.

## Examples

In this example, I've created an automation that searches google for the word 'hi' everytime the activity app is launched.
![before tweak](before.gif)
We see that the notification has to run and THEN our automation proceeds.

![after tweak](after.gif)
The automation runs immediately and unprompted. So much cleaner and faster!

## How it works

We hook on to the Notification Dispatcher class -- specifically the `postNotificationWithRequest` method. This method is called by every notification that needs to get posted and so we hook onto it and make sure we return nothing from it if the 'Shortcuts' app calls it.

## Copyright

GNU GENERAL PUBLIC LICENSE (feel free to use the code, just keep it open source)

