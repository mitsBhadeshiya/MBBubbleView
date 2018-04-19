# MBBubbleView
Bubble View 

# How to use?

Add Normal collection view in your view controller and update collectionView layout with below code 


        var layout:MBCollectionViewLayout!
        layout = MBCollectionViewLayout()
        layout.ROWS = 20 // TOTAL ROW
        layout.COLS = 20 // TOTAL COLUMS
        layout.itemSize = 100 // COLLECTION CELL SIZE
        collectonList.collectionViewLayout = layout;


output:
       

![alt text](https://github.com/mitsBhadeshiya/MBBubbleView/blob/master/MBBubbleView/bubbleView.png)
