//
//  VideoCell.swift
//  video
//
//  Created by Fromage Charley on 14/11/2019.
//  Copyright © 2019 Voodoo Coding. All rights reserved.
//

import UIKit

class VideoCell: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()

        selectionStyle = .none
    }

    func setup(with video: Video) {
        textLabel?.text = video.page.title
    }
}
