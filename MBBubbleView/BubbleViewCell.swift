//
//  BubbleViewCell.swift
//  Moozy
//
//  Created by Mitul Bhadeshiya on 11/04/18.
//  Copyright © 2018 Abc. All rights reserved.
//

import UIKit

class BubbleViewCell: UICollectionViewCell {
    
    @IBOutlet var img_image: UIImageView!
    @IBOutlet var lbl_name: UILabel!
    @IBOutlet var img_Bg: UIImageView!
    
    func setbubbleData(dic:NSDictionary)  {
    
        img_image.layer.borderColor = UIColor.lightGray.cgColor
        img_image.layer.borderWidth = 0.5
        img_image.layer.cornerRadius = 38.0
        img_Bg.layer.cornerRadius = 40.0
        
        img_Bg.clipsToBounds = true
        img_image.clipsToBounds = true
    }
    
    func setSelectedCell(index:Int) {
        
        //For New Center Cell
        let layer = CAGradientLayer()
        layer.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        let color1 = UIColor(red: (250.0/255.0), green: (217.0/255.0), blue: (97.0/255.0), alpha: 1.0)
        let color2 = UIColor(red: (247.0/255.0), green: (107.0/255.0), blue: (28.0/255.0), alpha: 1.0)
        layer.colors = [color1.cgColor,color2.cgColor]
        layer.cornerRadius = 40.0
        img_Bg?.layer.addSublayer(layer)
        lbl_name.textColor = UIColor(red: (249.0/255.0), green: (99.0/255.0), blue: (78.0/255.0), alpha: 1.0)
        
        lbl_name.text = String(index)
       
        img_image.layer.cornerRadius = 38.0
        img_image.clipsToBounds = true
    }
    
    func setNormalCell() {
        
        let layer = CAGradientLayer()
        layer.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        let color1 = UIColor(red: (213.0/255.0), green: (213.0/255.0), blue: (213.0/255.0), alpha: 1.0)
        let color2 = UIColor(red: (134.0/255.0), green: (134.0/255.0), blue: (134.0/255.0), alpha: 1.0)
        layer.colors = [color1.cgColor,color2.cgColor]
        
        layer.cornerRadius = 40.0
        
        img_Bg?.layer.addSublayer(layer)
        img_Bg.layer.cornerRadius = 40.0
        
        lbl_name.textColor = UIColor.black
    }

}
