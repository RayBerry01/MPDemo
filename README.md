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

![alt text](https://user-images.githubusercontent.com/143112898/263619836-c9c51d2b-49cd-46c4-8bb1-5fd92cacf98e.png)

- Second screen: displays details - remove html tags and displays image and text
![alt text](https://user-images.githubusercontent.com/143112898/263619900-24b8fb71-b4d4-44a3-bdc0-84441d7b7d64.png)
 
## TODO

* XCUITest - to finish
* Coordinator design pattern + Combine to replace NavigationLink 
* Launch screen
* Further work needed on sizing to use on ipads
 
## Credits
 
- Ray Berry
