# cordova-plugin-ios-faceid
A cordova plugin for iOS face identification and touch identification.

## Installation
`cordova plugin add cordova-plugin-ios-faceid`

## Usage
### CID.checkAuth()
`CID.checkAuth(reason, successCallback, errorCallback)`

* `reason` the reason why your app wants to use authentication with biometrics
* `successCallback` the callback when authentication successful
* `errorCallback` the callback when the function not work

> This method works for both face and touch identification. If your device is iPhone X/XS/XR/XS Max, it will invoke face identification. If not, then touch identification.

## Demo
Ionic demo: [https://github.com/Cheney925/ionic-for-cordova-plugin-ios-faceid](https://github.com/Cheney925/ionic-for-cordova-plugin-ios-faceid)

