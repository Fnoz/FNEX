# FNRentalPullToRefresh
用Swift实现的Yalantis的Pull-to-Refresh.Rentals-iOS下拉刷新动画.

###基础使用Demo：

```
	func delayStopDrop() {
		dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(2 * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), { () -> Void in
			self.tableView.reloadData()
			self.tableView.easy_stopDropPull()
		})
	}
        
	let customDropView = FNRentalPullToRefreshHeaderView.init(frame: CGRectMake(0, -110, view.frame.size.width, 110))
	tableView.easy_addDropPull({ 
		NSLog("Run")
		delayStopDrop()
		}, customDropView: customDropView)
```

###效果：
![Animating](readme_images/animating.gif)

###来源：
OC原版是 [Yalantis](https://github.com/Yalantis) 的 [Pull-to-Refresh.Rentals-iOS](https://github.com/Yalantis/Pull-to-Refresh.Rentals-iOS)