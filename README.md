# Moving

[![CI Status](https://img.shields.io/travis/Jalpesh/Moving.svg?style=flat)](https://travis-ci.org/Jalpesh/Moving)
[![Version](https://img.shields.io/cocoapods/v/Moving.svg?style=flat)](https://cocoapods.org/pods/Moving)
[![License](https://img.shields.io/cocoapods/l/Moving.svg?style=flat)](https://cocoapods.org/pods/Moving)
[![Platform](https://img.shields.io/cocoapods/p/Moving.svg?style=flat)](https://cocoapods.org/pods/Moving)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

Swift 5.0 with compatible iOS 13.0+

## Installation

Moving is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Moving'
```
Features
---
* Drag and Drop
* Re-order CollectionView Cell

If you'd like to test the included demo project before including it in your own work, then download or clone the repository. CocoaPods will download the demo project into a folder and open it in Xcode. Magic.😀 🥳 👍🏻

How to use it
---
1. Import framework to your ViewController file _JPColleDragDropCell_

```Swift
import Moving
```

2. It’s very simple. Drag a UICollectionview into your Storyboard/nib and set its class to JPcolleView – that's it.
    Don't forgot the IBOutlet connection.
    
 ```Swift
 @IBOutlet var collePhotoUpload : JPcolleView!
 ```
 
3. Set the delegate methods to the collection view 

```Swift
 collePhotoUpload?.dragDelegate = self as? UICollectionViewDragDelegate
 collePhotoUpload?.dropDelegate = self as? UICollectionViewDropDelegate
 collePhotoUpload.dragInteractionEnabled = true
```

4. Hope you have set the class and connect the IBOutlet. 
    After that Set the gesture recognition of each with using _.applyGesture_. See below for more understanding.
    
```Swift
 self.collePhotoUpload.applyDragAndDrop(with: [Your array])
 ```
5. 👉🏻 🔥 Don't forget to change Collectionview automatic size : Xcode -> Size Inspector -> Estimate size set automatic to **None**  👈🏻


## Author

Jalpesh, gotijalpesh91@gmail.com

## License

Moving is available under the MIT license. See the LICENSE file for more info.
