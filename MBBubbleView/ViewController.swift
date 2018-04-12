//
//  ViewController.swift
//  MBBubbleView
//
//  Created by Mitul Bhadeshiya on 12/04/18.
//  Copyright © 2018 Abc. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDataSource {

    
    @IBOutlet var collectonList:UICollectionView!
    var arrList:NSMutableArray!
    
    var layout:MBCollectionViewLayout!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        layout = MBCollectionViewLayout()
        layout.ROWS = 20 // TOTAL ROW
        layout.COLS = 20 // TOTAL COLUMS
        layout.itemSize = 100 // COLLECTION CELL SIZE
        
        collectonList.collectionViewLayout = layout;
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return arrList.count
        return 20 * 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BubbleViewCell", for: indexPath) as! BubbleViewCell
        
        cell.setSelectedCell(index: indexPath.row)
        
        return cell
    }



}

