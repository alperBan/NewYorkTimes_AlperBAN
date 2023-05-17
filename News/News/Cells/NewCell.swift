//
//  NewCell.swift
//  News
//
//  Created by Alper Ban on 16.05.2023.
//
import NewsAPI
import UIKit
import SDWebImage

class NewCell: UICollectionViewCell {
    @IBOutlet weak var newImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var author: UILabel!
    var url:String?
    var abstract:String?
    let d = UserDefaults.standard
    override func awakeFromNib() {
        super.awakeFromNib()
       
        
    }

 
    func configure(new: New) {
            title.text = new.title
            author.text = new.byline
            url = new.url
            abstract = new.abstract
            if let multimedia = new.multimedia.first, let urlString = multimedia.urll, let url = URL(string: urlString) {
                newImage.sd_setImage(with: url)
                
            }
        
        }
}
