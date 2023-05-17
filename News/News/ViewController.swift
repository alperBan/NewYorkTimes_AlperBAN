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
    let d = UserDefaults.standard
    let service : PopularNewServiceProtocol = PopularNewService()
    private var news: [New] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchNews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tasarim:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let genislik = self.collectionView.frame.size.width
        tasarim.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        tasarim.itemSize = CGSize(width: (genislik-60)/2, height: (genislik)/1.75)
        tasarim.minimumInteritemSpacing = 5
        tasarim.minimumLineSpacing = 15
        
        print("inside viewdidload")
        collectionView!.collectionViewLayout = tasarim
        collectionView.register(cellType: NewCell.self)
   
    }
    
    fileprivate func fetchNews() {
        self.showLoading()
        service.fetchPopularNews { [weak self] response in
            guard let self else {return}
            self.hideLoading()
            switch response {
                case .success(let news):
                print("Alper: \(news)")
                self.news = news
                self.collectionView.reloadData()
            case .failure(let error):
                print("Alper: \(error)")
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
        
       
    }
    
}

