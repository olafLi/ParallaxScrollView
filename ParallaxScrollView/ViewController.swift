//
//  ViewController.swift
//  ParallaxScrollView
//
//  Created by LiTengFei on 2018/4/8.
//  Copyright © 2018年 WinKind. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let scrollView = PLScrollView(frame: self.view.bounds)
        self.view.addSubview(scrollView)
        scrollView.setImages(["750","back","p750-1334"])
        scrollView.animatedOffset = 50
        scrollView.animated = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

