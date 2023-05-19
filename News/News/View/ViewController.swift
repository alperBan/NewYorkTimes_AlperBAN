//
//  ViewController.swift
//  News
//
//  Created by Alper Ban on 15.05.2023.
//

import UIKit
import NewsAPI

final class ViewController: UIViewController, LoadingShowable {
    @IBOutlet weak var collectionView: UICollectionView!
    let service: PopularNewServiceProtocol = PopularNewService()
    private var news: [New] = []
    var abstract1: String = ""
    var url1: String = ""
    var author1: String = ""
    var tittle1: String = ""
    var image1: [Multimedia] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchNews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionViewLayout()
        collectionView.register(cellType: NewCell.self)
        configureTitleView()
    }
    
    fileprivate func configureCollectionViewLayout() {
        let design = UICollectionViewFlowLayout()
        let value = self.collectionView.frame.size.width
        design.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        design.itemSize = CGSize(width: (value-80)/2, height: (value)/1.75)
        design.minimumInteritemSpacing = 5
        design.minimumLineSpacing = 15
        let cellBorderWidth: CGFloat = 3
        let cellBorderColor = UIColor.systemGray5.cgColor
        collectionView.layer.borderColor = cellBorderColor
        collectionView.layer.borderWidth = cellBorderWidth
        collectionView.collectionViewLayout = design
    }
    
    fileprivate func configureTitleView() {
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
        let titleLabel = UILabel()
        titleLabel.text = "The New York Times"
        titleLabel.font = UIFont(name: "Times New Roman", size: 30)
        titleLabel.sizeToFit()
        titleLabel.center = titleView.center
        titleView.tintColor = .lightGray
        titleView.addSubview(titleLabel)
        titleView.backgroundColor = .systemGray5
        navigationItem.titleView = titleView
    }
    
    fileprivate func fetchNews() {
        self.showLoading()
        service.fetchPopularNews { [weak self] response in
            guard let self = self else { return }
            self.hideLoading()
            switch response {
            case .success(let news):
                print("\(news)")
                self.news = news
                self.collectionView.reloadData()
            case .failure(let error):
                print("\(error)")
            }
        }
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return news.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeCell(cellType: NewCell.self, indexPath: indexPath)
        let new = self.news[indexPath.row]
        cell.configure(new: new)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        author1 = news[indexPath.row].byline ?? ""
        tittle1 = news[indexPath.row].title ?? ""
        abstract1 = news[indexPath.row].abstract ?? ""
        image1 = news[indexPath.row].multimedia
        url1 = news[indexPath.row].url ?? ""
        self.performSegue(withIdentifier: "showDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.urll = url1
            destinationVC.details = abstract1
            destinationVC.byline = author1
            destinationVC.tittle = tittle1
            destinationVC.img = image1
        }
    }
}


