//
//  CustomCollectionViewCell.swift
//  CollectionViewCustomCell_DemoPractice
//
//  Created by tmtech1 on 19/10/22.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CustomCollectionViewCell"
    
    private let imgView: UIImageView = {
    
        let imgView = UIImageView()
        imgView.image = UIImage(systemName: "house")
        imgView.clipsToBounds = true
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    private let label: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemRed
        
        contentView.addSubview(imgView)
        contentView.addSubview(label)
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        label.frame = CGRect(x: 5, y: contentView.frame.size.height - 50, width: contentView.frame.size.width - 10, height: 50)
        
        imgView.frame = CGRect(x: 5, y: 0, width: contentView.frame.size.width - 10, height: contentView.frame.size.height - 50)
    }
    
    public func configure(with labelText: String) {
        label.text = labelText
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        label.text = nil
    }
}
