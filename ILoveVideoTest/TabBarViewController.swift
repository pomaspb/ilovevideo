//
//  TabBarViewController.swift
//  ILoveVideoTest
//
//  Created by Roman Petrov on 25/06/15.
//  Copyright (c) 2015 Kentor. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
    func tabBarController(tabBarController: UITabBarController, animationControllerForTransitionFromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let transitioningObject: TransitioningObject = TransitioningObject()
        transitioningObject.tabBarController = self
        return transitioningObject
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
}

class TransitioningObject: NSObject, UIViewControllerAnimatedTransitioning {
    private weak var tabBarController: TabBarViewController!
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        // Get the "from" and "to" views
        let fromViewController: UIViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        let fromView: UIView = fromViewController.view
        let toViewController: UIViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        let toView: UIView = toViewController.view
        
        transitionContext.containerView().addSubview(fromView)
        transitionContext.containerView().addSubview(toView)
        
        let fromViewControllerIndex = find(self.tabBarController.viewControllers! as! [UIViewController], fromViewController)
        let toViewControllerIndex = find(self.tabBarController.viewControllers! as! [UIViewController], toViewController)
        
        // 1 will slide left, -1 will slide right
        var directionInteger: CGFloat!
        if fromViewControllerIndex < toViewControllerIndex {
            directionInteger = 1
        } else {
            directionInteger = -1
        }
        
        //The "to" view with start "off screen" and slide left pushing the "from" view "off screen"
        toView.frame = CGRectMake(directionInteger * toView.frame.width, 0, toView.frame.width, toView.frame.height)
        let fromNewFrame = CGRectMake(-1 * directionInteger * fromView.frame.width, 0, fromView.frame.width, fromView.frame.height)
        
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: { () -> Void in
            toView.frame = fromView.frame
            fromView.frame = fromNewFrame
            }) { (Bool) -> Void in
                // update internal view - must always be called
                transitionContext.completeTransition(true)
        }
    }

    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.33
    }
}