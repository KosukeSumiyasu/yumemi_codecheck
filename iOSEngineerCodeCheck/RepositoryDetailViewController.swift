//
//  RepositoryDetailViewController.swift
//  iOSEngineerCodeCheck
//
//  Created by 史 翔新 on 2020/04/21.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

class RepositoryDetailViewController: UIViewController {

    //MARK: Properties
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var languageLabel: UILabel!
    @IBOutlet private weak var starsLabel: UILabel!
    @IBOutlet private weak var watchersLabel: UILabel!
    @IBOutlet private weak var forksLabel: UILabel!
    @IBOutlet private weak var issuesLabel: UILabel!

    var vc1: RepositoryTableViewController!
 
    //MARK: ViewCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let repositories = vc1.repositories[vc1.index]
        languageLabel.text = repositories.language
        starsLabel.text = repositories.starsCount.description
        watchersLabel.text = repositories.watchersCount.description
        forksLabel.text = repositories.forksCount.description
        issuesLabel.text = repositories.issuesCount.description
        getImage()

    }
}

//MARK: Private functions
extension RepositoryDetailViewController {
    private func getImage(){
        let repositories = vc1.repositories[vc1.index]
        titleLabel.text = repositories.fullName
        let owner = repositories.owner
        let imageURL = owner.imageUrl
        URLSession.shared.dataTask(with: URL(string: imageURL)!) { (data, response, error) in
            let image = UIImage(data: data!)!
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }.resume()
    }
}
