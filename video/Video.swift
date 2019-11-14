//
//  Video.swift
//  video
//
//  Created by Fromage Charley on 13/11/2019.
//  Copyright © 2019 Voodoo Coding. All rights reserved.
//

import Foundation

struct Video {
    let page: Page
//    let name: String
//    let logoURL: String
}

extension Video: Decodable {
    private enum CodingKeys: String, CodingKey {
        case page = "page"
//        case name = "strTeam"
//        case logoURL = "strTeamBadge"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.page = try container.decode(Page.self, forKey: .page)
    }
}

struct Page {
    let title: String
}

extension Page: Decodable {
    private enum CodingKeys: String, CodingKey {
        case title = "movie_title"
//        case name = "strTeam"
//        case logoURL = "strTeamBadge"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.title = try container.decode(String.self, forKey: .title)
    }
}
