//
//  ViewController.swift
//  BufferSlider
//
//  Created by Brian Liu on 02/22/2016.
//  Copyright (c) 2016 Brian Liu. All rights reserved.
//

import UIKit
import BufferSlider
class ViewController: UIViewController {

    @IBOutlet weak var slider: BufferSlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            self?.slider.value += 0.2
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

