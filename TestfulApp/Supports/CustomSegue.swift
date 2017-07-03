//
//  CustomSegue.swift
//  TestfulApp
//
//  Created by Evgeniy Tkachenko on 03.07.17.
//  Copyright © 2017 Big Dig. All rights reserved.
//

import UIKit
import Foundation

class CustomSegue: UIStoryboardSegue {
    
    override func perform() {
        let sourceVC = source
        let destinationVC = destination
        
        sourceVC.view.addSubview(destinationVC.view)
        
        destinationVC.view.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        
        UIView.animate(withDuration: 0.5, delay: 0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            destinationVC.view.transform = CGAffineTransform(scaleX: 1, y: 1)
        }) { (success) in
            destinationVC.view.removeFromSuperview()
            sourceVC.present(destinationVC, animated: false, completion: nil)
        }
    }
    
}
