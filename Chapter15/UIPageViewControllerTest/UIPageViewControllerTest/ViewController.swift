//
//  ViewController.swift
//  UIPageViewControllerTest
//
//  Created by Chris Xiong on 2019/10/16.
//  Copyright © 2019 org.chris. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPageViewControllerDataSource, UIPageViewControllerDelegate  {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        createContentPages()
        // Do any additional setup after loading the view.
        pageController = UIPageViewController(
            transitionStyle: .pageCurl,
            navigationOrientation: .horizontal,
            options: nil)

        pageController?.delegate = self
        pageController?.dataSource = self

        let startingViewController: ContentViewController =
            viewControllerAtIndex(index: 0)!

        let viewControllers: NSArray = [startingViewController]
        pageController!.setViewControllers(viewControllers
                as? [UIViewController],
                                           direction: .forward,
            animated: false,
            completion: nil)

        self.addChild(pageController!)
        self.view.addSubview(self.pageController!.view)

        let pageViewRect = self.view.bounds
        pageController!.view.frame = pageViewRect
        pageController!.didMove(toParent: self)
    }
    

    func createContentPages() {

           var pageStrings = [String]()

           for i in 1...11
           {
               let contentString = "<html><head></head><body><br><h1>Chapter \(i)</h1><p>This is the page \(i) of content displayed using UIPageViewController in iOS 9.</p></body></html>"
               pageStrings.append(contentString)
           }
        pageContent = pageStrings as NSArray
       }

    var pageController: UIPageViewController?
    var pageContent = NSArray()

    
    func viewControllerAtIndex(index: Int) -> ContentViewController? {

        if (pageContent.count == 0) ||
        (index >= pageContent.count) {
            return nil
        }

        let storyBoard = UIStoryboard(name: "Main",
                                      bundle: Bundle.main)
        let dataViewController = storyBoard.instantiateViewController(withIdentifier: "contentView") as! ContentViewController

        dataViewController.dataObject = pageContent[index] as AnyObject
        return dataViewController
    }

    func indexOfViewController(viewController: ContentViewController) -> Int {

        if let dataObject: AnyObject = viewController.dataObject {
            return pageContent.index(of: dataObject)
        } else {
            return NSNotFound
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {

        var index = indexOfViewController(viewController: viewController
                    as! ContentViewController)

        if (index == 0) || (index == NSNotFound) {
            return nil
        }

        index -= 1
        return viewControllerAtIndex(index: index)
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {

        var index = indexOfViewController(viewController: viewController
        as! ContentViewController)

        if index == NSNotFound {
            return nil
        }

        index += 1
        if index == pageContent.count {
            return nil
        }
        return viewControllerAtIndex(index: index)
    }

}
