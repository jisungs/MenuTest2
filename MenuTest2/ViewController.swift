//
//  ViewController.swift
//  MenuTest2
//
//  Created by Hae kyeom Kim on 2020/01/16.
//  Copyright © 2020 Hae kyeom Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var menuCollection: UICollectionView!
    @IBOutlet weak var contriesTable: UITableView!
    
    // MARK: - proerties
    
    let contriesArray = [["Chaina","Japan", "Korea"],
                         ["Egypt","Sudan","South Africa"],
                         ["Spain","Netherlands", "France"]]
    var selectedArray = [String]()
    var selectedIndex = 0
    var selectedIndexPath = IndexPath(item: 0, section: 0)
    let menuTitles = ["Asia", "Africa", "Europe"]
    var indicatorView = UIView()
    let indicatorHeight : CGFloat = 3
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectedArray = contriesArray[selectedIndex]
    }


}

