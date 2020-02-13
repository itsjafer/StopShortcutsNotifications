# StopShortcutNotifications

This tweak, written in Objective-C, stops the 'Shortcuts' app from sending any and all notifications. Why? Because the shortcuts app sends extremely annoying notifications everytime an automation runs.

## How it works

We hook on to the Notification Dispatcher class -- specifically the `postNotificationWithRequest` method. This method is called by every notification that needs to get posted and so we hook onto it and make sure we return nothing from it if the 'Shortcuts' app calls it.

