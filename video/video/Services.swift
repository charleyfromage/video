//
//  Services.swift
//  video
//
//  Created by Fromage Charley on 13/11/2019.
//  Copyright © 2019 Voodoo Coding. All rights reserved.
//

import Foundation
import Alamofire

class Services: NSObject {
    let session: Session
    let evaluators = [Configuration.APIs.domain: DisabledEvaluator()]

    override init() {
        session = Session(serverTrustManager: ServerTrustManager(evaluators: evaluators))
    }

    func getVideosList(completion: @escaping ([Video], Error?) -> Void) {
        let urlString = String(format: "%@/%@", Configuration.APIs.apiBaseURL, Constants.APIs.movieEndPoint)

        session.request(urlString).responseJSON { response in
            #if DEBUG
            print("Result: \(response.result)")
            #endif

            guard let data = response.data, let entity: [Video] = try? JSONDecoder().decode([Video].self, from: data) else {
                #if DEBUG
                print("Error parsing \([Video].self)")
                #endif

                return
            }

            completion(entity, response.error)
        }
    }
}
