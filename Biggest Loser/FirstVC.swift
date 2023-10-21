//
//  FirstVC.swift
//  Biggest Loser
//
//  Created by hutao on 2023/9/25.
//

import UIKit

class FirstVC: UIViewController {
    
    var image = ["walk1","yoga1","bike1","run1","swim1","hiking1"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func Button(_ sender: UIButton) {
        let vc = TrainViewController()
        print("\(image[(sender.tag)])")
        vc.imageName = image[(sender.tag)]
        vc.wordName = word1[(sender.tag )]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
