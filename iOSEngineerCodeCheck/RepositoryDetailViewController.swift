//
//  RepositoryDetailViewController.swift
//  iOSEngineerCodeCheck
//
//  Created by 史 翔新 on 2020/04/21.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

class RepositoryDetailViewController: UIViewController {
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var languageLabel: UILabel!
    @IBOutlet private weak var starsLabel: UILabel!
    @IBOutlet private weak var watchersLabel: UILabel!
    @IBOutlet private weak var forksLabel: UILabel!
    @IBOutlet private weak var issuesLabel: UILabel!
    
    var vc1: RepositoryTableViewController!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let repositories = vc1.repositories[vc1.index]
        languageLabel.text = "Written in \(repositories["language"] as? String ?? "")"
        starsLabel.text = "\(repositories["stargazers_count"] as? Int ?? 0) stars"
        watchersLabel.text = "\(repositories["wachers_count"] as? Int ?? 0) watchers"
        forksLabel.text = "\(repositories["forks_count"] as? Int ?? 0) forks"
        issuesLabel.text = "\(repositories["open_issues_count"] as? Int ?? 0) open issues"
        getImage()
        
    }
    
    func getImage(){
        
        let repositories = vc1.repositories[vc1.index]
        
        titleLabel.text = repositories["full_name"] as? String
        
        if let owner = repositories["owner"] as? [String: Any] {
            if let imageURL = owner["avatar_url"] as? String {
                URLSession.shared.dataTask(with: URL(string: imageURL)!) { (data, response, error) in
                    let image = UIImage(data: data!)!
                    DispatchQueue.main.async {
                        self.imageView.image = image
                    }
                }.resume()
            }
        }
        
    }
    
}
