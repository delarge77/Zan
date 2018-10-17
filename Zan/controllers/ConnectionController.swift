//
//  Controller.swift
//  Zan
//
//  Created by Alessandro Santos Pinto on 28/09/2018.
//  Copyright © 2018 Delarge. All rights reserved.
//

import Foundation

protocol Connection {
	func loadVideoWith(category:String, completion:@escaping([Video])->Void)
	func loadCategories(completion:@escaping(([Categorie])->Void))
	func loadIdioms(completion:@escaping(([Idiom])->Void))
	func postVideo(video: Data, completion:@escaping((Bool)-> Void))
	func rateVideoWith(rate: String, completion:@escaping((String) -> Void))
	func registerUser(name:String, user:String, pass:String, idiom:String, completion:@escaping((Bool)-> Void))
}

struct ConnectionController: Connection {
	private let service: ZanServiceAPI
	
	init(service: ZanServiceAPI = ZanServiceAPI()) {
		self.service = service
	}
	
	func loadVideoWith(category:String, completion: @escaping ([Video]) -> Void) {
		service.loadVideo(ServiceRouter.loadVideo(userId: "1", idiom: "3", category: category)) { (video) in
			completion(video)
		}
	}
	
	func loadCategories(completion: @escaping (([Categorie]) -> Void)) {
		service.loadCategories(ServiceRouter.loadCategories) { (categories) in
			completion(categories)
		}
	}
	
	func loadIdioms(completion: @escaping (([Idiom]) -> Void)) {
		service.loadIdioms(ServiceRouter.loadIdioms) { (idioms) in
			completion(idioms)
		}
	}
	
	func postVideo(video: Data, completion: @escaping ((Bool) -> Void)) {
//		service.postVideo(ServiceRouter.postVideo(userId: "1", idiom: "1", category: "1", video: video)) { (video) in
//			completion(video)
//		}
		
		service.postVideo(url: video, video: ServiceRouter.postVideo(userId: "10", idiom: "1", category: "1")) { (msg) in
			completion(msg)
		}
		
//		let params = ["userId": "1", "idiom": "1", "category": "1", "video": video] as [String : Any]
//		service.sendVideo(url: video, params: params) { (msg) in
//
//		}
	}

	
	func rateVideoWith(rate: String, completion: @escaping ((String) -> Void)) {
		service.rateVideo(ServiceRouter.rateVideo(userId: "1", videoId: "1", rate: rate)) { (message) in
			completion(message)
		}
	}
	
	func registerUser(name: String, user: String, pass: String, idiom: String, completion: @escaping ((Bool) -> Void)) {
		service.registerUser(ServiceRouter.registerUser(name: name, user: user, pass: pass, idiom: idiom)) { (message) in
			completion(message)
		}
	}
}

