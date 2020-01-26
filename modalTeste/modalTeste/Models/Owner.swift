//
//  Owner.swift
//  modalTeste
//
//  Created by Weslley Madeira on 26/01/20.
//  Copyright © 2020 Weslley Madeira. All rights reserved.
//

import Foundation


struct Owner: Codable {
    
    let avatarImage: String?
    
    private enum CodingKeys: String, CodingKey {
           case avatarImage = "avatar_url"
         
    }
}
