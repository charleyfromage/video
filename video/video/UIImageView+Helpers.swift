//
//  UIImageView+Helpers.swift
//  video
//
//  Created by Fromage Charley on 18/11/2019.
//  Copyright © 2019 Voodoo Coding. All rights reserved.
//

import UIKit

extension UIImageView {
    public func setImageFromUrl(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        DispatchQueue.global().async { [weak self] in
            guard let data = try? Data(contentsOf: url),
                  let image = UIImage(data: data)
            else { return }

            DispatchQueue.main.async { [weak self] in
                self?.image = image
            }
        }
    }
}
