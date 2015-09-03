//
//  WebViewCtrl.swift
//  KeyHouse
//
//  Created by Sheepy on 15/9/2.
//  Copyright (c) 2015年 Sheepy. All rights reserved.
//

import UIKit

class WebViewCtrl: UIViewController, UIWebViewDelegate, UIScrollViewDelegate {
   
    var webView = UIWebView()
   
    var loadingView = UIActivityIndicatorView()
    
    var url: String! {
        didSet {
            loadUrl()
        }
    }
    
    var icon: String! {
        didSet {
            favoriteButton.setBackgroundImage(UIImage(named: icon), forState: .Normal)
        }
    }
    
    var viewWidth: CGFloat!
    var viewHeight: CGFloat!
    
    var oldY: CGFloat = 0
    var newY: CGFloat = 0
    var scrollDirection: ScrollDirection = .None
    
    let favoriteButton = UIButton()
    var favoriteBtnCenterY: CGFloat!

    override func viewDidLoad() {
        super.viewDidLoad()

        viewWidth = view.frame.width
        viewHeight = view.frame.height
        
        //初始化webview
        webView.frame = view.bounds
        webView.scrollView.bounces = false
        webView.scrollView.delegate = self
        //webView.backgroundColor = UIColor.greenColor()
        view.addSubview(webView)
        webView.delegate = self
        
        //初始化加载图标
        loadingView.frame = CGRectMake(viewWidth/2 - 25, viewHeight/2 - 25, 50, 50)
        loadingView.hidesWhenStopped = true
        loadingView.color = UIColor.grayColor()
        webView.addSubview(loadingView)
        
        //初始化收藏按钮
        favoriteButton.frame = CGRectMake(viewWidth * 4/5, viewHeight * 4/5, viewWidth/8, viewWidth/8)
        favoriteButton.addTarget(self, action: "clicked:", forControlEvents: .TouchUpInside)
        webView.addSubview(favoriteButton)
        favoriteBtnCenterY = favoriteButton.center.y
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        loadingView.startAnimating()
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError) {
        loadingView.stopAnimating()
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        loadingView.stopAnimating()
    }
    
    func loadUrl() {
        let url = NSURL(string: self.url)
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        //判断当前是向上还是向下滑动
        newY = scrollView.contentOffset.y
        if newY > oldY {
            scrollDirection = .Up
        } else if oldY > newY {
            scrollDirection = .Down
        }
        oldY = newY
        
        //向上滑动隐藏收藏按钮，想下滑动显示收藏按钮
        switch scrollDirection {
        case .Up:
            if favoriteButton.center.y > favoriteBtnCenterY {
                return
            }
            UIView.animateWithDuration(0.4) {
                self.favoriteButton.center.y = self.favoriteBtnCenterY + self.viewHeight/5
            }
            
        case .Down:
            if favoriteButton.center.y == favoriteBtnCenterY {
                return
            }
            UIView.animateWithDuration(0.4) {
                self.favoriteButton.center.y = self.favoriteBtnCenterY
            }
        default: break
        }

    }
    
    func clicked(sender: UIButton) {
        //Todo
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

enum ScrollDirection {
    case Up
    case Down
    case None
}
