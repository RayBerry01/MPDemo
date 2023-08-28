#  MPDemo

Demo extracting info from the following API  
        https://moonpig.github.io/tech-test-frontend/search.json
 
## Contents
 
- [Requirements](#requirements)
- [Usage](#usage)
- [Credits](#credits)
 
 
## Requirements
 
- iOS 16.1 or later
- Xcode 14.0 or later
- Swift 5.0 or later
 
 
## Usage
 
* Retrieves API information using Async Await in SwiftUI
* Uses MVVM approach
* Uses Async image for image loads - URL caching set in AppDelegate
* Uses Lazy Grids - kept image sizes to content fit - as otherwise they looked stretched
* No Cocoapods or 3rd party libraries needed
* Network Error handling in place in NetworkService
* Basic XCTests in place using MockService
* Rotation fixed to portrait
* Light and Dark mode colors - set in Assets
* Designed for iPhones only - more work to set up on iPads - ran out of time
* XCUITests started using BDD/GWT syntax - ran out of time
* Icon loaded in Assets
 
## Screens 

- First screen: displays card image with sequenced card size 

/var/folders/b5/1l5rcf3j4_5cw3bp245vbmy5cm6cq1/T/simulator_screenshot_BE71752C-CAD5-45FF-8032-ECEC74D452E5.png

- Second screen: displays details - remove html tags and displays image and text
/var/folders/b5/1l5rcf3j4_5cw3bp245vbmy5cm6cq1/T/simulator_screenshot_69D34487-DCA3-4D66-8D30-A1FD1D88C4E1.png
 
## TODO

* XCUITest - to finish
* Coordinator design pattern + Combine to replace NavigationLink 
* Launch screen
* Further work needed on sizing to use on ipads
 
## Credits
 
- Ray Berry
