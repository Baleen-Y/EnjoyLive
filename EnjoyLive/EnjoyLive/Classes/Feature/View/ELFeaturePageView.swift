//
//  ELFeaturePageView.swift
//  EnjoyLive
//
//  Created by Baleen.Y on 1/24/17.
//  Copyright © 2017 Baleen.Y. All rights reserved.
//

import UIKit

/// 页面指示器的尺寸
fileprivate let pageIndicatorWH = 15

class ELFeaturePageView: UIView {

    // MARK: - 属性
    fileprivate var scrollView: UIScrollView?
    fileprivate var pageControl: UIPageControl?
    fileprivate var count: Int = 0
    var pictures: [UIImage] = [] {
        didSet {
            self.setNeedsLayout()
            self.count = pictures.count
        }
    }
    // MARK: - 重写系统方法
    override func layoutSubviews() {
        super.layoutSubviews()
        // 移除之前的图片
        if let subviews = scrollView?.subviews {
            for subview in subviews {
                subview.removeFromSuperview()
            }
        }
        
        // 设置尺寸
        let viewW = frame.size.width
        let viewH = frame.size.height
        
        scrollView?.frame = bounds
        scrollView?.contentSize = CGSize(width: CGFloat(count + 1) * viewW, height: 0)
        
        // 添加图片
        for i in 0..<count {
            let img = pictures[i]
            let imageView = UIImageView(image: img)
            scrollView?.addSubview(imageView)
            let imageX = viewW * CGFloat(i)
            imageView.frame = CGRect(x: imageX, y: 0, width: viewW, height: viewH)
        }
        // 设置页数
        pageControl?.numberOfPages = count
        let pageW = CGFloat(pageIndicatorWH * count)
        let pageH = CGFloat(pageIndicatorWH)
        let pageX = 0.5 * (viewW - pageW)
        let pageY = 0.95 * (viewH - pageH)
        pageControl?.frame = CGRect(x: pageX, y: pageY, width: pageW, height: pageH)

    }
    
    // MARK: - 类工厂方法
    /// 传入图片数组显示新特性图片播放
    ///
    /// - Parameter pictures: 图片数组
    /// - Returns: 新特性页面
    class func pageView(_ pictures: [UIImage]) -> ELFeaturePageView {
        
        let pageView = ELFeaturePageView()
        pageView.pictures = pictures
        pageView.setUI()
        return pageView
    }

}

// MARK: - 自定义方法
extension ELFeaturePageView {
    
    /// UI 控件初始化
    fileprivate func setUI() {
        
        /// scrollView 初始化
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentInset = UIEdgeInsets.zero
        scrollView.bounces = false
        scrollView.delegate = self
        addSubview(scrollView)
        self.scrollView = scrollView
        
        /// pageControl 初始化
        let pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = UIColor.red
        addSubview(pageControl)
        self.pageControl = pageControl
        
    }
    
}

// MARK: - 代理方法
fileprivate var isShowMain = false
extension ELFeaturePageView: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let viewW = frame.size.width
        let offsetX = scrollView.contentOffset.x
        let index = offsetX / viewW
        let countTemp = CGFloat(count - 1)
        // 超出最后一张
        if index > countTemp {
            let shift = offsetX - viewW * countTemp
            // 移动页面指示器
            pageControl?.center.x = 0.5 * (viewW - (pageControl?.frame.width)!) - shift
            // 判断是否已经创建
            if !isShowMain {
                isShowMain = true
                let tabBarVC = ELTabBarVC()
                UIApplication.shared.keyWindow?.rootViewController?.view.insertSubview(tabBarVC.view, at: 0)
            }
        }
        let page = Int(index + 0.5)
        pageControl?.currentPage = page
    }
    
    // 移动停止时在最后一个页面
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let viewW = frame.size.width
        let offsetX = scrollView.contentOffset.x
        let index = offsetX / viewW
        let countTemp = CGFloat(count - 1)
        if index > countTemp {
            let tabBarVC = ELTabBarVC()
            UIApplication.shared.keyWindow?.rootViewController  = tabBarVC
        }
    }
    
}
