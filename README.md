# BufferSlider

[![CI Status](http://img.shields.io/travis/raxcat/BufferSlider.svg?style=flat)](https://travis-ci.org/raxcat/BufferSlider)
[![Version](https://img.shields.io/cocoapods/v/BufferSlider.svg?style=flat)](http://cocoapods.org/pods/BufferSlider)
[![License](https://img.shields.io/cocoapods/l/BufferSlider.svg?style=flat)](http://cocoapods.org/pods/BufferSlider)
[![Platform](https://img.shields.io/cocoapods/p/BufferSlider.svg?style=flat)](http://cocoapods.org/pods/BufferSlider)
[![Swift 2.0+](https://img.shields.io/badge/Swift-2.0-orange.svg?style=flat)](https://developer.apple.com/swift/)
[![Xcode 7.0+](https://img.shields.io/badge/Xcode-7.0+-blue.svg?style=flat)](https://developer.apple.com/swift/)


<img src="https://raw.githubusercontent.com/raxcat/BufferSlider/master/screenshot2.png">

- Easily use
- Easily customize
- Drop-In replacement
- Supports **Objective-C** and **Swift**
- *@IBDesignable* class *BufferSlider*
  - *@IBInspectable* property *bufferStartValue* (*Swift.Double*)
    - 0.0 ~ 1.0 
  - *@IBInspectable* property *bufferEndValue* (*Swift.Double*)
    - 0.1 ~ 1.0 
  - *@IBInspectable* property *borderColor* (*UIKit.UIColor*)
  - *@IBInspectable* property *baseColor* (*UIKit.UIColor*)
  - *@IBInspectable* property *bufferColor* (*UIKit.UIColor*)
  - *@IBInspectable* property *progressColor* (*UIKit.UIColor*)
  - *@IBInspectable* property *borderWidth* (*Swift.Double*)
  - *@IBInspectable* property *sliderHeight* (*Swift.Double*)
  - property *sliderPosition* (*Swift.Enum:Int*)
  - *@IBInspectable* property *sliderPositionAdaptor* (*Swift.Int*) for InterfaceBuilder
  - *@IBInspectable* property *roundedSlider* (*Swift.Bool*)

## Usage
To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

>= 0.1.6 (Preparing, not released yet)
= *iOS SDK 10.0* and later
- Swift3
- Xcode 8.0+

0.1.5
- *iOS SDK 8.0 ~ 9.0* 
- Swift2
- Xcode 7.0

## Installation

BufferSlider is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "BufferSlider"
```

## Author

- Raxcat liu, raxcat@gmail.com (Personal account)
- Brian Liu, brianliu@actions-micro.com (Company account)

Feel free to contact me or send any PR.

## License

BufferSlider is available under the MIT license. See the LICENSE file for more info.
