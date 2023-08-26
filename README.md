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
* Uses Async image for image loads
* Uses Lazy Grids
* No Cocoapods or 3rd party libraries needed
* Network Error handling in place
* URL caching set in AppDelegate for Async Image loads
* Rotation fixed to portrait
* Light and Dark mode colors - set in Assets
* Designed for iPhones only - more work to set up on iPads
 
## Screens 

- First screen: displays card image with sequenced card size 

- Second screen: displays details - remove html tags and displays image and text

 
## TODO

* XCUITest
* Coordinator design pattern + Combine to replace NavigationLink 
* replace random frame size to a sequence frame size
* MP icon to be loaded
* Launch screen
* Resizing of images on screen
* Further work needed on sizing to use on ipads
 
## Credits
 
- Ray Berry
