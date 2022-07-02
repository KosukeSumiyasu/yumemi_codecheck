//
//  Owner.swift
//  iOSEngineerCodeCheck
//
//  Created by 住安宏介 on 2022/07/02.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import UIKit

struct Owner: Codable {
    
    //MARK: Properties
    let imageUrl: String

    //MARK: CodingKeys
    enum CodingKeys: String, CodingKey {
        case imageUrl = "avatar_url"
    }
}
