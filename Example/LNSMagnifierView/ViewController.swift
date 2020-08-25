//
//  ViewController.swift
//  LNSMagnifierView
//
//  Created by LinusLing on 08/25/2020.
//  Copyright (c) 2020 LinusLing. All rights reserved.
//

import UIKit
import LNSMagnifierView

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let nio = UIImage.init(named: "nio")!
        
        let imageV = UIImageView.init(frame: UIScreen.main.bounds)
        imageV.center = self.view.center
        imageV.image = nio
        imageV.contentMode = .scaleAspectFit
        self.view.addSubview(imageV)
        
        let magView = LNSMagnifierView.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100), viewToMagnify: imageV, offsetY: 0, needPlusSign: true)
        magView.size = 100
        magView.outlineColor = UIColor.white
        self.view.addSubview(magView)
        magView.center = self.view.center
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

