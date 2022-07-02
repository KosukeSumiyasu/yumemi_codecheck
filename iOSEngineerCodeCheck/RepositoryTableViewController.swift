//
//  RepositoryTableViewController.swift
//  iOSEngineerCodeCheck
//
//  Created by 史 翔新 on 2020/04/20.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

class RepositoryTableViewController: UITableViewController {

    //MARK: Properties
    @IBOutlet private weak var searchBar: UISearchBar!

    var repositories: [Repository]=[]
    var task: URLSessionTask?
    var word: String!
    var url: String!
    var index: Int!

    //MARK: ViewCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }

    //MARK: Next Source
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Detail"{
            let destination = segue.destination as! RepositoryDetailViewController
            destination.vc1 = self
        }
    }
}

//MARK: UISearchBarDeleagate
extension RepositoryTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        task?.cancel()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        word = searchBar.text!
        if word.count != 0 {
            url = "https://api.github.com/search/repositories?q=\(word!)"
            task = URLSession.shared.dataTask(with: URL(string: url)!) { (data, res, err) in
                guard let data = data else { return }
                if let obj = try? JSONDecoder().decode(RepositoryList.self, from: data) {
                    self.repositories = obj.items
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
        task?.resume()
        }
    }
}

//MARK: TableView Datasource
extension RepositoryTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let repositories = repositories[indexPath.row]
        cell.textLabel?.text = repositories.fullName
        cell.detailTextLabel?.text = repositories.language
        cell.tag = indexPath.row
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
        performSegue(withIdentifier: "Detail", sender: self)
    }
}
