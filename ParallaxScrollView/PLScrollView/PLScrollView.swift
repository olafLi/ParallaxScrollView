//
//  PLScrollView.swift
//  ParallaxScrollView
//
//  Created by LiTengFei on 2018/4/8.
//  Copyright © 2018年 WinKind. All rights reserved.
//

import UIKit

class PLScrollView: UIScrollView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isScrollEnabled = true
        self.isPagingEnabled = true
        self.delegate = self
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
     * 是否开启动画偏移
     */
    var animated:Bool = true
    /*
     * 动画偏移量
     */
    var animatedOffset:CGFloat = 0.0
    /*
     *  参加滚动的view
     */
    var animateImages:[PLAnimateView] = []

    func setImages(_ images:[String]?) -> Void {

        guard let images = images else {
            return
        }

        self.contentSize = CGSize(width: CGFloat(images.count) * self.frame.width, height: self.frame.height)

        animateImages.removeAll()
        for view in self.subviews {
            view.removeFromSuperview()
        }

        var index = 0
        for image in images {
            let frame = CGRect(x: self.bounds.width * CGFloat(index), y: 0, width: self.bounds.width, height: self.bounds.height)
            let imageView = PLAnimateView(frame: frame)
            imageView.imageView.image = UIImage(named: image)
            imageView.tag = 100 + index

            self.addSubview(imageView)
            self.animateImages.append(imageView)
            index += 1
            print(self.contentSize)

        }

    }
}

extension PLScrollView : UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetX = scrollView.contentOffset.x

        var leftIndex = Int(offsetX / self.bounds.size.width)
        if leftIndex == self.animateImages.count - 1 {
            leftIndex = leftIndex - 1
        }
        let rightIndex = leftIndex + 1

        let leftView = self.animateImages[leftIndex]
        let rightView = self.animateImages[rightIndex]

        let SCREEN_WIDTH = self.frame.width;

        var leftContentX:CGFloat = 0
        var rightContentX:CGFloat = 0

        if self.animated {
            let leftOffset = SCREEN_WIDTH - self.animatedOffset
            leftContentX = leftOffset + (offsetX - CGFloat(rightIndex) * SCREEN_WIDTH) / SCREEN_WIDTH * leftOffset
            rightContentX = -leftOffset + (offsetX - CGFloat(leftIndex) * SCREEN_WIDTH) / SCREEN_WIDTH * leftOffset
        } else {
            leftContentX = offsetX - CGFloat(rightIndex) * SCREEN_WIDTH + SCREEN_WIDTH
            rightContentX = offsetX - CGFloat(leftIndex) * SCREEN_WIDTH - SCREEN_WIDTH
        }
        leftView.contentX = leftContentX
        rightView.contentX = rightContentX
    }
}
