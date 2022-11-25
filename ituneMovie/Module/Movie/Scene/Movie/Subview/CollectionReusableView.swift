//
//  CollectionReusableView.swift
//  ituneMovie
//
//  Created by Giap on 25/11/2022.
//

import UIKit

class CollectionReusableView: UICollectionReusableView{
    static let identifier = "CollectionReusableView"
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder){
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
