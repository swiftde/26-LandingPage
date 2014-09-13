//
//  ContentVC.swift
//  LandingPage-Tutorial
//
//  Created by Benjamin Herzog on 02.09.14.
//  Copyright (c) 2014 Benjamin Herzog. All rights reserved.
//

import UIKit

class ContentVC: UIViewController {
    
    var pageIndex: Int!
    var imageString: String?
    var titleString: String?

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if pageIndex != 4 {
            startButton.hidden = true
        }
        titleLabel.text = titleString!
        imageView.image = UIImage(named: imageString!)
    }
    @IBAction func startButtonPressed(sender: AnyObject) {
        NSUserDefaults.standardUserDefaults().setBool(true, forKey: "skipTutorial")
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as ViewController
        (UIApplication.sharedApplication().delegate as AppDelegate).window?.rootViewController = vc
    }

}











