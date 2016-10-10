//
//  HellaDetailViewController.swift
//  HellaCollectionCells
//
//  Created by Anthony on 10/10/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class HellaDetailViewController: UIViewController {

    @IBOutlet weak var hellaDetailViewLabel: UILabel!
    
    var hellaString: String?
    var hellaBackground: String?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let hellaString = hellaString {
            hellaDetailViewLabel.text = hellaString
            
            switch hellaBackground! {
            
            case "purple":
                self.view.backgroundColor = UIColor.purple
                print("segue purp fired")
            default:
                self.view.backgroundColor = UIColor.yellow
                print("segue yellow fired")
            
            }
            print("hellaDetailViewCont fired!")
        }
    }
}
