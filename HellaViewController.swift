//
//  ViewController.swift
//  HellaCollectionCells
//
//  Created by Flatiron School on 10/6/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class HellaViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionViewOutlet: UICollectionView!
    //    var noc: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewOutlet.delegate = self
        collectionViewOutlet.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1000
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "basicCell", for: indexPath)
        let fib = indexPath.item
        
        if fibanacci(fib: fib) {
            cell.backgroundColor = UIColor.purple
            print(indexPath.item)
            return cell
            
        }
        cell.backgroundColor = UIColor.yellow
        return cell
        
    }
    
    
    func fibanacci(fib: Int) -> Bool{
        if sqrt(Double((5 * fib * fib) + 4)).remainder(dividingBy: 1) == 0 || sqrt(Double((5 * fib * fib) - 4)).remainder(dividingBy: 1) == 0 {
            return true
        } else {
            return false
            }
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepare begins")
        
        if segue.identifier != "collectionSegue" {return}
        print("id fired")
        
        if let dest = segue.destination as? HellaDetailViewController,
            let indexPathAt = collectionViewOutlet.indexPathsForSelectedItems?.first {
            print(indexPathAt[1])
            dest.hellaString = ("Index square number \(String(indexPathAt[1]))")
            
            switch fibanacci(fib: indexPathAt[1]) {
                
            case true:
                dest.hellaBackground = "purple"
                print("dat purp")
                
            default:
                dest.hellaBackground = "yellow"
                print("dat yellow")
            }
        }
    }
}
