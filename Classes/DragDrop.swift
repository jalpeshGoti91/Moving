//
//  DragDrop.swift
//  JPColleDragDropCell
//
//  Created by Jalpesh on 10/08/21.
//

import Foundation

@available(iOS 13.0, *)
public class JPcolleView : UICollectionView{
 
    var count : [String] = []
    
    fileprivate var snapshotIndexPath: IndexPath?
    fileprivate var snapshotPanPoint: CGPoint?
    fileprivate var snapshotView: UIView?
    
    public  func applyDragAndDrop(with ary : [String]){
        
        print("print")
        self.count = ary
        let gestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPressRecognized(_:)))
        gestureRecognizer.minimumPressDuration = 0.2
        self.addGestureRecognizer(gestureRecognizer)
    }
    
   @objc public func longPressRecognized(_ recognizer: UILongPressGestureRecognizer) {
        let location = recognizer.location(in: self)
        let indexPath = self.indexPathForItem(at: location)

        switch recognizer.state {
        case UIGestureRecognizer.State.began:
            guard let indexPath = indexPath else { return }

            let cell =  self.cellForItem(at: indexPath)
            snapshotView = cell!.snapshotView(afterScreenUpdates: true)
            self.addSubview(snapshotView!)
            cell?.contentView.alpha = 0.0

            UIView.animate(withDuration: 0.2, animations: {
                self.snapshotView?.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
                self.snapshotView?.alpha = 0.9
            })

            snapshotPanPoint = location
            snapshotIndexPath = indexPath

        case UIGestureRecognizer.State.changed:
            guard let snapshotPanPoint = snapshotPanPoint else { return }

            let translation = CGPoint(x: location.x - snapshotPanPoint.x, y: location.y - snapshotPanPoint.y)
            snapshotView?.center.x += translation.x
            snapshotView?.center.y += translation.y
            self.snapshotPanPoint = location

            guard let indexPath = indexPath else { return }

            count.swapAt(snapshotIndexPath?.item ?? 0, indexPath.item)
            self.moveItem(at: snapshotIndexPath!, to: indexPath)
            snapshotIndexPath = indexPath
        default:
            guard let snapshotIndexPath = snapshotIndexPath else { return }
            let cell =  self.cellForItem(at: snapshotIndexPath)
            UIView.animate(
                withDuration: 0.2,
                animations: {
                    self.snapshotView?.center = cell!.center
                    self.snapshotView?.transform = CGAffineTransform.identity
                    self.snapshotView?.alpha = 1.0
                },
                completion: { finished in
                    cell!.contentView.alpha = 1.0
                    self.snapshotView?.removeFromSuperview()
                    self.snapshotView = nil
                })
            self.snapshotIndexPath = nil
            self.snapshotPanPoint = nil
        }
    }
}
