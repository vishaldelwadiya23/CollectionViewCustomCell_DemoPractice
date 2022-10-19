//
//  ViewController.swift
//  CollectionViewCustomCell_DemoPractice
//
//  Created by tmtech1 on 19/10/22.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    private var myCollectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.itemSize = CGSize(width: (view.frame.size.width/3)-4, height: (view.frame.size.width/3)-4)
            
        myCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        guard let collectionView = myCollectionView else { return }
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(myCollectionView!)

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        myCollectionView?.frame = view.bounds
    }
    
    // MARK: - collection view delegate and datasource methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
                
        cell.configure(with: "Custom - \(indexPath.row)")
        
        return cell
    }
}

