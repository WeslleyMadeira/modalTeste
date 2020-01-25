//
//  Repository.swift
//  modalTeste
//
//  Created by Weslley Madeira on 24/01/20.
//  Copyright © 2020 Weslley Madeira. All rights reserved.
//

import Foundation


struct Repository: Codable {
    let id: Int
    let fullName: String
    let description: String
    let stargazersCount: Int
    let watchersCount: Int
    let url: URL
    let creatAt: String

    private enum CodingKeys: String, CodingKey {
        case id
        case fullName = "full_name"
        case description
        case stargazersCount = "stargazers_count"
        case url = "html_url"
        case watchersCount = "watchers_count"
        case creatAt = "created_at"
    }

}

struct RepositoriesResponse: Codable {
    let items: [Repository]
}

