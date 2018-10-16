//
//  Controller.swift
//  Zan
//
//  Created by Alessandro Santos Pinto on 28/09/2018.
//  Copyright © 2018 Delarge. All rights reserved.
//

import Foundation

protocol Connection {
	func loadVideo(completion:@escaping(Video)->Void)
}

struct ConnectionController:Connection {
	private let service: ZanServiceAPI
	
	init(service: ZanServiceAPI = ZanServiceAPI()) {
		self.service = service
	}
	
	func loadVideo(completion: @escaping (Video) -> Void) {
		service.loadVideos(ServiceRouter.loadVideos) { (video) in
			completion(video)
		}
	}
}

