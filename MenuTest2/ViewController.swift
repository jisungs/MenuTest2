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
        menuCollection.selectItem(at: selectedIndexPath, animated: true, scrollPosition: .centeredVertically)
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction))
        leftSwipe.direction = .left
        self.view.addGestureRecognizer(leftSwipe)
        
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction))
        rightSwipe.direction = .right
        self.view.addGestureRecognizer(rightSwipe)
        
        indicatorView.backgroundColor = .white
        indicatorView.frame  = CGRect(x: menuCollection.bounds.minX, y: menuCollection.bounds.maxY - indicatorHeight, width: menuCollection.bounds.width, height: indicatorHeight)
        menuCollection.addSubview(indicatorView)
        
    }
    
    @objc func swipeAction(_ sender: UISwipeGestureRecognizer){
        if sender.direction == .left{
            if selectedIndex < menuTitles.count - 1 {
                selectedIndex += 1
            }
        } else {
            if selectedIndex > 0 {
                selectedIndex -= 1
            }
        }
    }


}

// MARK: -Tabel View Delegate

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = selectedArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

// MARK: - Collection View Delegate

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuTitles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: indexPath)
        
        return cell
    }
    
    
}
