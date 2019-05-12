# HarryExtensions

[![CI Status](https://img.shields.io/travis/pewepw/HarryExtensions.svg?style=flat)](https://travis-ci.org/pewepw/HarryExtensions)
[![Version](https://img.shields.io/cocoapods/v/HarryExtensions.svg?style=flat)](https://cocoapods.org/pods/HarryExtensions)
[![License](https://img.shields.io/cocoapods/l/HarryExtensions.svg?style=flat)](https://cocoapods.org/pods/HarryExtensions)
[![Platform](https://img.shields.io/cocoapods/p/HarryExtensions.svg?style=flat)](https://cocoapods.org/pods/HarryExtensions)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

HarryExtensions is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'HarryExtensions'
```

## Basic Example

#### 1. Stack vertically and horizontally, with UIView anchors extension

```swift
let pointStackView = VerticalStackView(arrangedSubviews: [
                availableTitleLabel,
                pointLabel
            ])
addSubview(pointStackView)
pointStackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 10, left: 15, bottom: 0, right: 0), size: .init(width: 0, height: 40))
        
let profileStackView = HorizontalStackView(arrangedSubviews: [
      nameLabel,
      profileImage
    ], spacing: 10)
addSubview(profileStackView)
profileStackView.anchor(top: topAnchor, leading: pointStackView.trailingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 10, left: 15, bottom: 0, right: 15), size: .init(width: 0, height: 40))
```
![StackViewExample](https://user-images.githubusercontent.com/24606625/57584335-c532aa00-750c-11e9-9c71-3f087b232f34.jpeg)


## Author

Harry Ng, harryng.gj@gmail.com

## License

HarryExtensions is available under the MIT license. See the LICENSE file for more info.
