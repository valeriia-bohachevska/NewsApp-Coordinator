//
//  ViewController.swift
//  NewsApp
//
//  Created by Valeriaa Bohachevska on 30/05/2019.
//  Copyright © 2019 Valeriaa Bohachevska. All rights reserved.
//

import UIKit
import Kingfisher

class NewsVC: UIViewController, UITableViewDataSource, UITableViewDelegate, UITableViewDataSourcePrefetching, StoryboardLoadable {
    static private let nibID = "NewsCell"
    static private let constPrefetch = 5
    static private let defaultCellHeight: CGFloat = 150.0
    
    private var pageCount = 1
    private var isRequestSend = false
    private var isEndOfTheJSON = false
    private var refreshControl = UIRefreshControl()

    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        return dateFormatter
    }()
    private var newsDataModels = [NewsModel]()
    var newsService: NewsService?
    var onSelection: ((NewsModel) -> Void)?
    
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "News"
        
        // table view setup
        tableView.delegate = self
        tableView.dataSource = self
        tableView.prefetchDataSource = self
        tableView.register(UINib(nibName: NewsVC.nibID, bundle: nil), forCellReuseIdentifier: NewsCell.newsCellID)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = NewsVC.defaultCellHeight
        tableView.tableFooterView = UIView()
        
        // refresh control setup
        refreshControl.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
        tableView.addSubview(refreshControl)
        tableView.tableFooterView?.addSubview(refreshControl)
        
        // request inital data
        getNewsData()
    }
    
    @objc func refresh() {
        newsDataModels = []
        pageCount = 0
        tableView.reloadData()
        getNewsData()
    }
    
    func getNewsData() {
        if !isEndOfTheJSON && !isRequestSend {
            pageCount += 1
            isRequestSend = true
            newsService?.getNews(page: pageCount) { [weak self] (result) in
                switch result {
                case .success(let response):
                    self?.newsDataModels.append(contentsOf: response.articles)
                    self?.isRequestSend = false
                    self?.isEndOfTheJSON = response.totalResults == (self?.newsDataModels.count ?? 0)
                    self?.tableView.reloadData()
                    self?.refreshControl.endRefreshing()
                case .failure(_):
                    // error handling
                    break
                }
            }
        }
    }
    
    // MARK: - table view
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsDataModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.newsCellID, for: indexPath) as? NewsCell else {
            fatalError("Can’t deque the cell")
        }
        cell.titleNews.text = newsDataModels[indexPath.row].title
        cell.imageCell.kf.setImage(with: newsDataModels[indexPath.row].imageUrl)
        
        if let date = newsDataModels[indexPath.row].publishedAt {
            cell.dataNews.text = dateFormatter.string(from: date)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        onSelection?(newsDataModels[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            if indexPath.row >= newsDataModels.count - NewsVC.constPrefetch && !isRequestSend {
                getNewsData()
                break
            }
        }
    }
    
}
