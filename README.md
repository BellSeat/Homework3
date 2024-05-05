# HW 3 STATE MANAGEMENT
## 1.The various states that an app can enter on your platform of choice  
When the user or system requests a new scene for our app, UIKit creates it and puts it in the unattached state. User-requested scenes, for example battle game scene, move quickly to the foreground, where they appear onscreen. A system-requested scene typically moves to the background so that it can process an event. For example, the system might launch the scene in the background to process a location event. When the user dismisses your app’s UI, UIKit moves the associated scene to the background state and eventually to the suspended state. UIKit can disconnect a background or suspended scene at any time to reclaim its resources, returning that scene to the unattached state.

As a game program, there are also some extent states: 
+ applicationDidBecomeActive: - Restart any tasks paused (or not yet started) while inactive.
+ applicationWillResignActive: - Pause ongoing tasks, disable timers, and throttle down frame rates. Games should pause here.
+ applicationDidEnterBackground: - Save application data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
+ applicationWillEnterForeground: - Undo any changes you made in entering the background.


## 2.The various states that you must consider for your app, why you must consider it, and what must happen in each state.

1. Foreground Active State: in this state, iOS would configure the user UI and prepare to interact with the user. The user profile and user settings should be correctly downloaded and rendered in the app. If there is not network or inaccurate user data, the foreground should presnt an error message till every data prepared

2. Foreground Inactive: There are two ways to turn into foreground inactive, from unattached and from foreground active. Even in the diagram, the first type foreground inactive looks parallel to the background state but it still waiting for the response from the background. If the foreground active moves into the foreground were inactive, our game should suddenly update the user's current data to the server with `.onDisappear`, and when the user awakes our game, the `.onAppear` will compare the user's local user setting data with the server-side user data. If the same, do nothing, else down user data. "Server first rule"

## 3. Code
Please review the Homework3 first then check my previous [HW2](https://github.com/BellSeat/CSS533HW2) it also have state management 
