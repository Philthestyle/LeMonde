//
//  ArticleCollectionViewCell.swift
//  LeMondeNew
//
//  Created by Faustin Veyssiere on 15/06/2021.
//

import UIKit
import CocoaLumberjack

class ArticleCollectionViewCell: UICollectionViewCell {
    // MARK: - Variables
    // Private variables
    // *************************************************************

    @IBOutlet weak var articleTitleLabel: UILabel!
    
    // Public variables
    // **************************************************************
    var data: Article? {
        didSet {
            if data == nil {
                return
            } else {
                guard let article = data else { DDLogError("Need more informations"); return }
                articleTitleLabel.text = article.titre
            }
        }
    }
    
    
    // MARK: - Getter & Setter methods
    // **************************************************************
    
    // MARK: - Constructors
    // **************************************************************
    
    // MARK: - Init behaviors
    // **************************************************************
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Public methods
    // **************************************************************
    
    override func prepareForReuse() {
        super.prepareForReuse()
        data = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }

}
