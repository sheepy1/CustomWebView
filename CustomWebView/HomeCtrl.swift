//
//  HomeCtrl.swift
//  CustomWebView
//
//  Created by Sheepy on 15/9/3.
//  Copyright (c) 2015年 Sheepy. All rights reserved.
//

import UIKit

class HomeCtrl: UIViewController {
    
    let url = "http://www.jianshu.com/p/f41bf33fac0b"
    let icon = "plus_icon"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let viewWidth = view.frame.width
        let viewHeight = view.frame.height
        
        let button = UIButton(frame: CGRectMake(viewWidth/2 - 30, viewHeight/2 - 15, 60, 30))
        button.setTitle("Turn", forState: .Normal)
        button.backgroundColor = UIColor.blackColor()
        button.layer.cornerRadius = 3
        button.addTarget(self, action: "clicked:", forControlEvents: .TouchUpInside)
        view.addSubview(button)
    }
    
    func clicked(sender: UIButton) {
        performSegueWithIdentifier("segue", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let navigationCtrl = segue.destinationViewController as? UINavigationController {
            let customWebViewCtrl = navigationCtrl.viewControllers.first as! CustomWebViewCtrl
            customWebViewCtrl.url = self.url
            customWebViewCtrl.icon = self.icon
        }
    }
    

}
