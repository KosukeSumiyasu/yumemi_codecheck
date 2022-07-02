//
//  Repository.swift
//  iOSEngineerCodeCheck
//
//  Created by 住安宏介 on 2022/07/02.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import UIKit

struct Repository: Codable {
    
    //MARK: Properties
    let fullName: String
    let language: String
    let starsCount: Int
    let watchersCount: Int
    let forksCount: Int
    let issuesCount: Int
    let owner: Owner
    
    //MARK: CodingKeys
    enum CodingKeys: String, CodingKey {
        case fullName = "full_name"
        case language = "language"
        case starsCount = "stargazers_count"
        case watchersCount = "watchers_count"
        case forksCount = "forks_count"
        case issuesCount = "open_issues_count"
        case owner = "owner"
    }
}
