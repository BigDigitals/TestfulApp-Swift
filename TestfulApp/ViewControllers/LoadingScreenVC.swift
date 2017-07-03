//
//  LoadingScreenVC.swift
//  TestfulApp
//
//  Created by Evgeniy Tkachenko on 03.07.17.
//  Copyright © 2017 Big Dig. All rights reserved.
//

import UIKit

class LoadingScreenVC: UIViewController {

    @IBOutlet weak var vwLoadingLine1: UIView!
    @IBOutlet weak var vwLoadingLine2: UIView!
    @IBOutlet weak var vwLoadingLine3: UIView!
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startLoadingAnimation(seconds: 0.5)
    }
    
    // MARK: - Animation
    
    func startLoadingAnimation(seconds: TimeInterval) {
        paintingLoadingLine1()
        perform(#selector(paintingLoadingLine2), with: nil, afterDelay: seconds)
        perform(#selector(paintingLoadingLine3), with: nil, afterDelay: seconds * 2)
        perform(#selector(presentListClients), with: nil, afterDelay: seconds * 3)
    }
    
    func paintingLoadingLine1() {
        UIView.animate(withDuration: 0.1, animations: {
            self.vwLoadingLine1.backgroundColor = UIColor.orange
            self.vwLoadingLine2.backgroundColor = UIColor.white
            self.vwLoadingLine3.backgroundColor = UIColor.white
        })
    }
    
    func paintingLoadingLine2() {
        UIView.animate(withDuration: 0.1, animations: {
            self.vwLoadingLine1.backgroundColor = UIColor.white
            self.vwLoadingLine2.backgroundColor = UIColor.orange
            self.vwLoadingLine3.backgroundColor = UIColor.white
        })
    }
    
    func paintingLoadingLine3() {
        
        UIView.animate(withDuration: 0.1, animations: {
            self.vwLoadingLine1.backgroundColor = UIColor.white
            self.vwLoadingLine2.backgroundColor = UIColor.white
            self.vwLoadingLine3.backgroundColor = UIColor.orange
        })
    }
    
    // MARK: - New View Controller
    
    func presentListClients() {
        performSegue(withIdentifier: "showListClients", sender: self)
    }

}

