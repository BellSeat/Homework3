# HW 3 STATE MANAGEMENT
## 1.The various states that an app can enter on your platform of choice  
When the user or system requests a new scene for our app, UIKit creates it and puts it in the unattached state. User-requested scenes, for example battle game scene, move quickly to the foreground, where they appear onscreen. A system-requested scene typically moves to the background so that it can process an event. For example, the system might launch the scene in the background to process a location event. When the user dismisses your app’s UI, UIKit moves the associated scene to the background state and eventually to the suspended state. UIKit can disconnect a background or suspended scene at any time to reclaim its resources, returning that scene to the unattached state.

As a game program, there are also some extent states: 
+ applicationDidBecomeActive: - Restart any tasks paused (or not yet started) while inactive.
+ applicationWillResignActive: - Pause ongoing tasks, disable timers, and throttle down frame rates. Games should pause here.
+ applicationDidEnterBackground: - Save application data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
+ applicationWillEnterForeground: - Undo any changes you made in entering the background.


## 2.The various states that you must consider for your app, why you must consider it, and what must happen in each state.
