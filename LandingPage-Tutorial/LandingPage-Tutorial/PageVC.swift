//
//  PageVC.swift
//  LandingPage-Tutorial
//
//  Created by Benjamin Herzog on 02.09.14.
//  Copyright (c) 2014 Benjamin Herzog. All rights reserved.
//

import UIKit

class PageVC: UIViewController, UIPageViewControllerDataSource {

    var pageViewController = UIPageViewController()
    var pageImages = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blackColor()
        
        for i in 1...5 {
            pageImages.append("page\(i).png")
        }
        pageViewController = storyboard?.instantiateViewControllerWithIdentifier("PageViewController") as UIPageViewController
        pageViewController.dataSource = self
        
        let viewController = [viewControllerAtIndex(0)!]
        pageViewController.setViewControllers(viewController, direction: .Forward, animated: false, completion: nil)
        
        addChildViewController(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMoveToParentViewController(self)
    }
    
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let index = (viewController as ContentVC).pageIndex
        if index == 0 {
            return nil
        }
        return viewControllerAtIndex(index - 1)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let index = (viewController as ContentVC).pageIndex
        if index + 1 == pageImages.count {
            return nil
        }
        return viewControllerAtIndex(index + 1)
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController!) -> Int {
        return 0
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController!) -> Int {
        return pageImages.count
    }
    
    func viewControllerAtIndex(index: Int) -> ContentVC? {
        if pageImages.count == 0 || index >= pageImages.count {
            return nil
        }
        
        let contentVC = storyboard?.instantiateViewControllerWithIdentifier("ContentVC") as ContentVC
        contentVC.imageString = pageImages[index]
        contentVC.titleString = pageImages[index]
        contentVC.pageIndex = index
        
        return contentVC
    }
}























