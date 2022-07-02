//
//  RepositoryList.swift
//  iOSEngineerCodeCheck
//
//  Created by 住安宏介 on 2022/07/02.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

struct RepositoryList: Codable {
    
    //MARK: Properties
    let items: [Repository]
    
    //MARK: CodingKeys
    enum CodingKeys: String, CodingKey {
        case items = "items"
    }
}
