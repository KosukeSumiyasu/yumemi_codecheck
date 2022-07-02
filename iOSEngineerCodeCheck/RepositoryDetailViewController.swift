//
//  RepositoryDetailViewController.swift
//  iOSEngineerCodeCheck
//
//  Created by 史 翔新 on 2020/04/21.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

final class RepositoryDetailViewController: UIViewController {

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
        setupLayout()
        getImage()
    }
}

//MARK: Private functions
extension RepositoryDetailViewController {
    private func setupLayout() {
        let repository = vc1.repositories[vc1.index]
        languageLabel.text = repository.language
        starsLabel.text = repository.starsCount.description
        watchersLabel.text = repository.watchersCount.description
        forksLabel.text = repository.forksCount.description
        issuesLabel.text = repository.issuesCount.description
    }

    private func getImage(){
        let repository = vc1.repositories[vc1.index]
        titleLabel.text = repository.fullName
        let owner = repository.owner
        guard let imageURL = URL(string: owner.imageUrl) else { return }
        URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
            guard let data = data else { return }
            let image = UIImage(data: data)
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }.resume()
    }
}
