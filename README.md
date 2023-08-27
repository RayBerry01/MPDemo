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
* Network Error handling in place in NetworkService
* Basic XCTests in place using MockService
* URL caching set in AppDelegate for Async Image loads
* Rotation fixed to portrait
* Light and Dark mode colors - set in Assets
* Designed for iPhones only - more work to set up on iPads - ran out of time
* XCUITests started using BDD/GWT syntax
 
## Screens 

- First screen: displays card image with sequenced card size 

- Second screen: displays details - remove html tags and displays image and text

 
## TODO

* XCUITest - to finish
* Coordinator design pattern + Combine to replace NavigationLink 
* Icon to be loaded in Assets
* Launch screen
* Further work needed on sizing to use on ipads
 
## Credits
 
- Ray Berry
