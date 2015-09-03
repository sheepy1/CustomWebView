# CustomWebView

![效果图](https://github.com/sheepy1/CustomWebView/new/master/Logo/show.gif)

右下角的收藏按钮在手势向上时隐藏（飞出屏幕），手势向下时出现。

使用：
  *将WebViewCtrl.swift复制到项目中
  *新建一个类继承自WebViewCtrl，然后给`url`和`icon`分别赋值用以指定加载的网址和收藏按钮图标，
  重写`clicked`方法以指定点击按钮后的行为(参考CustomWebViewCtrl.swift)
  *如果是由另一个Controller跳转过来的，也可以在`prepareForSegue`中给`url`和`icon`赋值(参考HomeCtrl)
