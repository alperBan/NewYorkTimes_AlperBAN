//
//  DetailsViewController.swift
//  News
//
//  Created by Alper Ban on 16.05.2023.
//
import SafariServices
import UIKit
import NewsAPI

class DetailsViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bigIMG: UIImageView!
    @IBOutlet weak var abstract: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    var urll = ""
    var img: [Multimedia] = []
    var details = ""
    var byline = ""
    var tittle = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageBorderWidth: CGFloat = 5
        let imageBorderColor = UIColor.systemGray5.cgColor
        view.layer.borderWidth = imageBorderWidth
        view.layer.borderColor = imageBorderColor
        
        if let url = img.first?.urll {
            bigIMG.sd_setImage(with: URL(string: "\(url)"))
        }
        abstract.text = details
        author.text = byline
        titleLabel.text = tittle
    }
  
    
    
    @IBAction func safariBttn(_ sender: Any) {
        guard let url = URL(string: urll) else { return }
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true, completion: nil)
        }
    }


