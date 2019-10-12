SwiftyCast
========

[![License MIT](https://img.shields.io/cocoapods/l/SwiftyCast.svg)](https://cocoapods.org/pods/SwiftyCast)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/SwiftyCast.svg)](https://cocoapods.org/pods/SwiftyCast) 
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage) 
[![Platform](https://img.shields.io/cocoapods/p/SwiftyCast.svg)](https://cocoapods.org/pods/SwiftyCast)
[![Build](https://travis-ci.com/SomeRandomiOSDev/SwiftyCast.svg?branch=master)](https://travis-ci.com/SomeRandomiOSDev/SwiftyCast)
[![Code Coverage](https://codecov.io/gh/SomeRandomiOSDev/SwiftyCast/branch/master/graph/badge.svg)](https://codecov.io/gh/SomeRandomiOSDev/SwiftyCast)
[![Codacy](https://api.codacy.com/project/badge/Grade/8ad52c117e4a46d9aa4699d22fc0bf49)](https://app.codacy.com/app/SomeRandomiOSDev/SwiftyCast?utm_source=github.com&utm_medium=referral&utm_content=SomeRandomiOSDev/SwiftyCast&utm_campaign=Badge_Grade_Dashboard)

**SwiftyCast** is a lightweight framework for easily casting objects to an from `UnsafeRawPointer` types for iOS, macOS, tvOS, and watchOS.

Installation
--------

**SwiftyCast** is available through [CocoaPods](https://cocoapods.org), [Carthage](https://github.com/Carthage/Carthage) and the [Swift Package Manager](https://swift.org/package-manager/). 

To install via CocoaPods, simply add the following line to your Podfile:

```ruby
pod 'SwiftyCast'
```

To install via Carthage, simply add the following line to your Cartfile:

```ruby
github "SomeRandomiOSDev/SwiftyCast"
```

To install via the Swift Package Manager add the following line to your `Package.swift` file's `dependencies`:

```swift
.package(url: "https://github.com/SomeRandomiOSDev/SwiftyCast.git", from: "1.0.0")
```

Usage
--------

First import **SwiftyCast** at the top of your Swift file:

```swift
import SwiftyCast
```

After importing, the use is as simple as calling one of four functions:

```swift
// For casting to or from a raw pointer
unsafeBridgingCast(_:) 

// For casting to a raw pointer while incrementing the retain count of the object
unsafeBridgingRetain(_:)

// For casting from a raw pointer while decrementing the retain count of the object
unsafeBridgingRetain(_:)

// For casting to or from a raw pointer but only in the context of a callback block
withUnsafeBridgingRetain(_:body:)
```

Contributing
--------

If you have need for a specific feature or you encounter a bug, please open an issue. If you extend the functionality of **SwiftyCast** yourself or you feel like fixing a bug yourself, please submit a pull request.

Author
--------

Joseph Newton, somerandomiosdev@gmail.com 

License
--------

**SwiftyCast** is available under the MIT license. See the `LICENSE` file for more info.
