# EasyPull
Let pull-to-refresh Easy for any UIScrollView in Swift

You have the flexibility to set custom view with fantastic animation.(可以灵活的设置自定义效果，实现期望的动画)

---

## Usage

(see sample Xcode project in `/Demo`)

### Adding Drop Pull to Refresh (添加下拉刷新)

Only support Manual Mode(仅支持手动模式)

```Swift
 tableView.easy_addDropPull({
     // prepend data to dataSource, insert cells at top of table view
     // call tableView.easy_stopDropPull() when done
 })
```

Note: You can trigger drop-excuting directly using this method. (用下面这个方法，你可以直接触发下拉刷新操作)

```Swift
 func easy_triggerDropExcuting()
```


### Adding Up Pull to Refresh and Load more (添加上拉加载)

Manual Mode(手动模式)

```Swift
 tableView.easy_addUpPullManual({
     // prepend data to dataSource, insert cells at bottom of table view
     // call tableView.easy_stopUpPull() when done
 })
```

Automatic Mode(自动模式)

```Swift
 tableView.easy_addUpPullAutomatic({
     // prepend data to dataSource, insert cells at bottom of table view
     // call tableView.easy_stopUpPull() when done
 })
```

Note: You can enable/unable Up-Pull using this method. Suitable for scenes without more data (用下面这个方法，你可以启用/禁止上拉加载，适用于**没有更多数据**的场景)

```Swift
 func enableUpExcuting()
 func unableUpExcuting()
```

### Customization

The pull-to-refresh view can be customized using the following methods:

```Swift
 func easy_addDropPull(action: (() ->Void), customDropView: EasyViewManual? = nil)
 func easy_addUpPullManual(action: (() ->Void), customUpView: EasyViewManual? = nil)
 func easy_addUpPullAutomatic(action: (() ->Void), customUpView: EasyViewAutomatic? = nil)
```

**NOTE:** Your custom views must implement the `EasyViewManual` protocol when you prefer the Manual mode 

Or implement the `EasyViewAutomatic` protocol when you prefer the Automatic mode.

(如果需要手动模式，你的自定义view必须实现EasyViewManual协议。如果需要自动模式，你的自定义view则必须实现EasyViewAutomatic协议。)

(see sample Xcode project in `/Demo/MyCusyomView.swift` or `/Demo/EasyPull/DefaultView.swift`)

## Installation

### CocoaPods

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

pod 'EasyPull', '~> 1.1.2'
```

### Source files

Alternatively you can directly add the `/EasyPull/EasyPull` source files to your project.

## License

This code is distributed under the terms and conditions of the [MIT license](LICENSE).