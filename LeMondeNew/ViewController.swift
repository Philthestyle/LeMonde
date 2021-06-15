//
//  ViewController.swift
//  LeMondeNew
//
//  Created by Faustin Veyssiere on 15/06/2021.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    // Data
    var dailyNews: DailyNews?
    
    @IBOutlet weak var articlesCollectionView: UICollectionView!
    
    //MARK: - WillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        
        NetworkManager.getDailyNews { dailyNewsFromNetwork in
            
            self.dailyNews = dailyNewsFromNetwork
            self.articlesCollectionView.reloadData()
            
        }
        
    }

    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if self.dailyNews?.elements == nil { return 0 }
        return dailyNews?.elements?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "articleCellID", for: indexPath) as? ArticleCollectionViewCell {
            
            cell.data = self.dailyNews?.elements?[indexPath.row] ?? Article(titre: "missing title", key: "key")
            
            return cell
        }
        
        return UICollectionViewCell()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    
    

}

