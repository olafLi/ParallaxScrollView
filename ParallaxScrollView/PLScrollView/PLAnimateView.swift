//
//  PLAnimateView.swift
//  ParallaxScrollView
//
//  Created by LiTengFei on 2018/4/8.
//  Copyright © 2018年 WinKind. All rights reserved.
//

import UIKit

class PLAnimateView: UIView {

    public var imageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.clipsToBounds = true
        self.imageView.frame = CGRect(origin: CGPoint.zero, size: frame.size)
        self.addSubview(self.imageView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var contentX:CGFloat = 0 {
        didSet {
            self.imageView.frame = CGRect(x: contentX, y: 0, width: self.frame.width, height: self.frame.height)
        }
    }
}
