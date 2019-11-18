//
//  VideoCell.swift
//  video
//
//  Created by Fromage Charley on 14/11/2019.
//  Copyright © 2019 Voodoo Coding. All rights reserved.
//

import UIKit

class VideoCell: UITableViewCell {
    @IBOutlet private weak var thumbImageView: UIImageView!
    @IBOutlet private weak var label: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        selectionStyle = .none
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        thumbImageView.image = nil
    }

    func setup(with video: Video) {
        label.text = video.page.title
        thumbImageView.setImageFromUrl(urlString: video.clips[0].thumbURL)
    }
}
