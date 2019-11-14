//
//  DetailsViewController.swift
//  video
//
//  Created by Fromage Charley on 14/11/2019.
//  Copyright © 2019 Voodoo Coding. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class DetailsViewController: UIViewController {
    @IBOutlet private weak var button: UIButton!

    public var video: Video?

    private let services = Services()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupButton()
    }

    private func setupButton() {
        button.setTitle(Strings.Details.playButtonTitle.capitalized, for: .normal)
    }

    @IBAction func playVideo(sender: UIButton) {
        if let video = video, video.clips.count > 0 {
            let clipURLString = video.clips[0].versions.enus.sizes.sd.source

            if let clipURL = URL(string: clipURLString) {
                playVideo(from: clipURL)
            }
        }
    }

    func playVideo(from url: URL) {
        let player = AVPlayer(url: url)
        let playerViewController = AVPlayerViewController()

        playerViewController.player = player

        present(playerViewController, animated: true) { [weak playerViewController] in
            playerViewController?.player?.play()
        }
    }
}
