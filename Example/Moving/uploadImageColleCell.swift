//
//  uploadImageColleCell.swift
//
//  Created by Jalpesh on 24/09/20.
//  Copyright © 2020 Jalpesh. All rights reserved.
//

import UIKit

class uploadImageColleCell: UICollectionViewCell {

    @IBOutlet var img : UIImageView!
    @IBOutlet var vwBase : UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func snapshotView(afterScreenUpdates afterUpdates: Bool) -> UIView? { // for reorder cell
      let snapshot = super.snapshotView(afterScreenUpdates: afterUpdates)

      snapshot?.layer.masksToBounds = false
      snapshot?.layer.shadowOffset = CGSize(width: -5.0, height: 0.0)
      snapshot?.layer.shadowRadius = 5.0
      snapshot?.layer.shadowOpacity = 0.4
      snapshot?.center = center
      
      return snapshot
    }
}
