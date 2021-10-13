//
//  ViewController.swift
//  Moving
//
//  Created by Jalpesh on 10/13/2021.
//  Copyright (c) 2021 Jalpesh. All rights reserved.
//

import UIKit
import Moving


@available(iOS 13.0, *)
class ViewController: UIViewController {
    
    @IBOutlet var collePhotoUpload : JPcolleView!
    
    let margin: CGFloat = 10
    
    var aryOfImage = ["1","2","3","4","5","6","3","4","5"]
   
    override func viewDidLoad() {
        super.viewDidLoad()
     
        self.collePhotoUpload.applyDragAndDrop(with: aryOfImage)
       
        self.collePhotoUpload.register(UINib(nibName: "uploadImageColleCell", bundle: nil), forCellWithReuseIdentifier: "uploadImageColleCell")
        
        collePhotoUpload?.dragDelegate = self as? UICollectionViewDragDelegate
        collePhotoUpload?.dropDelegate = self as? UICollectionViewDropDelegate
        collePhotoUpload.dragInteractionEnabled = true
        guard let collectionView = collePhotoUpload, let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        
        flowLayout.minimumInteritemSpacing = margin
        flowLayout.minimumLineSpacing = margin
        flowLayout.sectionInset = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
}

@available(iOS 13.0, *)
extension ViewController {
    fileprivate func cellForRow(at indexPath: IndexPath) -> uploadImageColleCell {
        return collePhotoUpload.cellForItem(at: indexPath) as! uploadImageColleCell
    }
}

@available(iOS 13.0, *)
extension ViewController : UICollectionViewDelegate , UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return aryOfImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "uploadImageColleCell", for: indexPath) as? uploadImageColleCell
        
        cell?.vwBase.layer.borderColor = UIColor.gray.cgColor
        cell?.vwBase.layer.cornerRadius = 8
        cell?.vwBase.layer.borderWidth = 1
 
        cell?.img.image = UIImage(named: self.aryOfImage[indexPath.row])
        return cell!
    }
    
//    @objc func removeImage(sender : UIButton){
//        print("remove image")
//        self.aryOfImage.remove(at: sender.tag)
//
//        self.collePhotoUpload.reloadData()
//    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let noOfCellsInRow = 3  //number of column you want
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))
        
        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
        return CGSize(width: size, height: size)
        
        //        return CGSize(width: self.collePhotoUpload.frame.size.width / 2 - 10 , height: self.collePhotoUpload.frame.size.width/2 - 10 )
    }
}
