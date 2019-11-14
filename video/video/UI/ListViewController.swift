//
//  ListViewController.swift
//  video
//
//  Created by Fromage Charley on 14/11/2019.
//  Copyright © 2019 Voodoo Coding. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewAnimation {
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            let nib = UINib(nibName: VideoCell.identifier, bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: VideoCell.identifier)
        }
    }

    private var videos = [Video]() {
        didSet {
            tableView.reloadData()
            show(tableView)
        }
    }

    private let services = Services()

    private var selectedVideoIndex: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        fetchVideos()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.Segues.pushToDetails {
            if let detailsViewController = segue.destination as? DetailsViewController {
                guard let selectedVideoIndex = selectedVideoIndex else { return }

                detailsViewController.video = videos[selectedVideoIndex]
            }
        }
    }

    private func setupTableView() {
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }

    private func fetchVideos() {
        services.getVideosList { [weak self] videos, error in
            self?.videos = videos
        }
    }
}

extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: VideoCell.identifier, for: indexPath) as? VideoCell else { return UITableViewCell() }

        let video = videos[indexPath.row]
        cell.setup(with: video)

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedVideoIndex = indexPath.row

        performSegue(withIdentifier: Constants.Segues.pushToDetails, sender: self)
    }
}
