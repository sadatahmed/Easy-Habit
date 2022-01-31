//
//  NewsViewController.swift
//  Easy Health
//
//  Created by BJIT on 26/1/22.
//

import UIKit
import Alamofire

class NewsViewController: UIViewController {
    
    @IBOutlet weak var collectionViewNews: UICollectionView!
    @IBOutlet weak var tableViewNews: UITableView!
    @IBOutlet weak var tableCellHeight: NSLayoutConstraint!
    @IBOutlet weak var supportView: UIView!
    
    
    
    var publishingNews: [NewsArticle] = []
    var publishingTableNews: [NewsArticle] = []
    var selectedNewsDetails: NewsArticle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let nibCell = UINib(nibName: "NewsCVCell", bundle: nil)
        collectionViewNews.register(nibCell, forCellWithReuseIdentifier: "newsCVCell")
        let tableCell = UINib(nibName: "NewsTVCell", bundle: nil)
        tableViewNews.register(tableCell, forCellReuseIdentifier: "newsTVCell")
        
        supportView.layer.cornerRadius = 80
        supportView.layer.maskedCorners = [ .layerMaxXMinYCorner]
        
        
        NewsFeed.shared.getTopStories { [self] result in
            switch result {
            case .success(let response):
                
                publishingNews = response
                publishingTableNews = response
                print(publishingNews)
                
                DispatchQueue.main.async {
                    self.tableViewNews.reloadData()
                    self.collectionViewNews.reloadData()
                }
                break
                
            case .failure(let error):
                print(error)
                break
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetails" {
            let destinationViewController = segue.destination as! DetailsNewsVC
            destinationViewController.detailNews = selectedNewsDetails
        }
    }
}


extension NewsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedNewsDetails = publishingNews[indexPath.row]
        performSegue(withIdentifier: "goToDetails", sender: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if publishingNews.count > 30 {
//            return 30
//        }else {
//            return publishingNews.count
//        }
        publishingNews.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionViewNews.dequeueReusableCell(withReuseIdentifier: "newsCVCell", for: indexPath) as! NewsCVCell
        let sliderCell = publishingNews[indexPath.row]
        
        cell.mainBGImage.image = UIImage(named: "userInfoBG")
        cell.newsHeadLine.text = sliderCell.title
        cell.authorName.text = sliderCell.author ?? "Anonymous"
        
        let imageURL  = sliderCell.urlToImage
        
        AF.request("\(imageURL!)").responseData { (response) in
            if response.error == nil
            {
                if let data = response.data {
                    cell.mainBGImage.image = UIImage(data: data)
                }
            }
        }
        
        return cell
    }
}


extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedNewsDetails = publishingTableNews[indexPath.row]
        performSegue(withIdentifier: "goToDetails", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return publishingTableNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let table = tableViewNews.dequeueReusableCell(withIdentifier: "newsTVCell", for: indexPath) as! NewsTVCell
        
        let cellHeight = Double(table.bounds.height)
        tableCellHeight.constant = CGFloat(Double(cellHeight * Double(publishingTableNews.count)))
        
        let tableCell = publishingTableNews[indexPath.row]
        table.newsImage.image = UIImage(named: "userInfoBG")
        table.newsFullHeadline.text = tableCell.title
        table.publishDate.text = tableCell.publishedAt
        table.writtenBy.text = tableCell.author ?? "Anonymous"
        
        let imageURL  = tableCell.urlToImage
        
        AF.request("\(imageURL!)").responseData { (response) in
            if response.error == nil
            {
                if let data = response.data {
                    table.newsImage.image = UIImage(data: data)
                }
            }
        }
        
        return table
    }
}


extension NewsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 326, height: 200)
    }
}
