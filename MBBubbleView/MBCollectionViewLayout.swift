//
//  MBCollectionViewLayout.swift
//  MBBubbleView
//
//  Created by Mitul Bhadeshiya on 12/04/18.
//  Copyright © 2018 Abc. All rights reserved.
//

import UIKit

let interimSpace: CGFloat = 0.0  //1

class MBCollectionViewLayout: UICollectionViewLayout {

    let screenHeight:CGFloat = UIScreen.main.bounds.size.height
    let screenWidth:CGFloat = UIScreen.main.bounds.size.width
    
    @IBInspectable public var COLS: Int = 0;
    @IBInspectable public var ROWS: Int = 0;
    @IBInspectable public var itemSize: CGFloat = 100;
    
    // 4
    var cellCount: Int {
        return COLS * ROWS
    }
    
    // 5
    var cViewSize: CGSize {
        return self.collectionView!.frame.size
    }
    
    // 3
    var center: CGPoint {
        return CGPoint(x: (self.cViewSize.width) / 2.0, y: (self.cViewSize.height) / 2.0)
    }
    
    // 6
    var a: CGFloat {
        return 3 * self.cViewSize.width
    }
    
    // 7
    var b: CGFloat {
        return 3 * self.cViewSize.height
    }
    
    // 8
    let c: CGFloat = 20
    
    
    public override var collectionViewContentSize: CGSize {
        return CGSize(width: itemSize * CGFloat(COLS) + screenWidth, height: itemSize * CGFloat(ROWS) + screenHeight)
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        var attributes = [AnyObject]()
        for i in 0 ..< cellCount {
            //let indexPath = NSIndexPath(forItem: i, inSection: 0)
            let indexPath = IndexPath(item: i, section: 0)
            attributes.append(self.layoutAttributesForItem(at: indexPath)!)
        }
        return attributes as? [UICollectionViewLayoutAttributes]
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        
        let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        
        let oIndex = indexPath.item % COLS // 1
        let vIndex = (indexPath.item - oIndex) / COLS // 2
        
        var x = CGFloat(oIndex) * itemSize // 3
        var y = CGFloat(vIndex) * itemSize // 4
        
        if vIndex % 2 != 0 { // 5
            x += itemSize / 2.0
        }
        
        attributes.center = CGPoint(x: x, y: y) // 6
        
        let offset = self.collectionView!.contentOffset // 7
        x -= (self.center.x + CGFloat(offset.x)) // 8
        y -= (self.center.y + CGFloat(offset.y)) // 9
        
        x = -x*x/(a*a) // 10
        y = -y*y/(b*b) // 11
        var z = c * (x+y) + 1.0 // 12
        z = z < 0.0 ? 0.0 : z // 13
        
        attributes.transform = CGAffineTransform(scaleX: z, y: z)
        attributes.size = CGSize(width:itemSize, height: itemSize)
        return attributes
    }
}
