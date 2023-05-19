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
    private var url: String = ""
    private var abstract: String = ""
     
    override func awakeFromNib() {
         super.awakeFromNib()
         let imageBorderWidth: CGFloat = 5
         let imageBorderColor = UIColor.systemGray5.cgColor
         newImage.layer.borderWidth = imageBorderWidth
         newImage.layer.borderColor = imageBorderColor
     }
     
    func configure(new: New) {
         title.text = new.title
         author.text = new.byline
         url = new.url ?? ""
         abstract = new.abstract ?? ""
         
         if let multimedia = new.multimedia.first, let urlString = multimedia.urll, let url = URL(string: urlString) {
             newImage.sd_setImage(with: url)
         }
     }
 }
