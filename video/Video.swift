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
    let clips: [Clip]
}

extension Video: Decodable {
    private enum CodingKeys: String, CodingKey {
        case page = "page"
        case clips = "clips"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.page = try container.decode(Page.self, forKey: .page)
        self.clips = try container.decode([Clip].self, forKey: .clips)
    }
}

struct Page {
    let title: String
}

extension Page: Decodable {
    private enum CodingKeys: String, CodingKey {
        case title = "movie_title"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.title = try container.decode(String.self, forKey: .title)
    }
}

struct Clip {
    let versions: Versions
    let thumbURL: String
}

extension Clip: Decodable {
    private enum CodingKeys: String, CodingKey {
        case versions = "versions"
        case thumbURL = "thumb"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.versions = try container.decode(Versions.self, forKey: .versions)
        self.thumbURL = try container.decode(String.self, forKey: .thumbURL)
    }
}

struct Versions {
    let enus: Enus
}

extension Versions: Decodable {
    private enum CodingKeys: String, CodingKey {
        case enus = "enus"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.enus = try container.decode(Enus.self, forKey: .enus)
    }
}

struct Enus {
    let sizes: Sizes
}

extension Enus: Decodable {
    private enum CodingKeys: String, CodingKey {
        case sizes = "sizes"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.sizes = try container.decode(Sizes.self, forKey: .sizes)
    }
}

struct Sizes {
    let sd: SD
}

extension Sizes: Decodable {
    private enum CodingKeys: String, CodingKey {
        case sd = "sd"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.sd = try container.decode(SD.self, forKey: .sd)
    }
}

struct SD {
    let source: String
}

extension SD: Decodable {
    private enum CodingKeys: String, CodingKey {
        case source = "src"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.source = try container.decode(String.self, forKey: .source)
    }
}
