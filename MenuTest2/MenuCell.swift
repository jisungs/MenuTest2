//
//  MenuCell.swift
//  MenuTest2
//
//  Created by Hae kyeom Kim on 2020/01/16.
//  Copyright © 2020 Hae kyeom Kim. All rights reserved.
//

import UIKit

class MenuCell: UICollectionViewCell {
    
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        label.alpha = 0.6
    }
    
    func setupCell(text: String){
        label.text = text
    }
    
    override var isSelected: Bool{
        didSet{
            label.alpha = isSelected ? 1.0 : 0.6
        }
    }
}
