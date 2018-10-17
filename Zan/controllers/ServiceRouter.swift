//
//  ServiceRouter.swift
//  Zan
//
//  Created by Alessandro dos Santos Pinto on 10/09/2018.
//  Copyright © 2018 Delarge. All rights reserved.
//

import Foundation
import Alamofire

enum ServiceRouter: URLRequestConvertible {
	
	case loadCategories
	case loadVideo(userId:String, idiom:String, category:String)
	case loadIdioms
	case postVideo(userId:String, idiom:String, category:String)
	case rateVideo(userId:String, videoId:String, rate:String)
	case registerUser(name:String, user:String, pass:String, idiom:String)
    
    var path: String {
        
        switch self {
		
		case .loadCategories:
			return APIEndpoints.loadCategories
		
        case .loadVideo:
            return APIEndpoints.loadVideo
			
		case .loadIdioms:
			return APIEndpoints.loadIdioms
			
		case .postVideo:
			return APIEndpoints.postVideo
		
		case .rateVideo:
			return APIEndpoints.rateVideo
			
		case .registerUser:
			return APIEndpoints.registerUser
        }
    }
    
	var parameters: [String: Any] {
		
        let params: [String: Any] = [:]

        switch self {
			
		case let .loadVideo(userId, idiom, category):
			return ["categoriaid": category, "idiomaid": idiom, "userid": userId]
		case let .postVideo(userId, idiom, category):
			return ["categoriaid": category, "idiomaid": idiom, "userid":userId]
		case let .rateVideo(userId, videoId, rate):
			return ["userid": userId, "videoid": videoId, "avaliar": rate]
		case let .registerUser(name, user, pass, idiom):
			return ["u_nome": name, "u_user": user, "u_pass": pass, "u_idioma": idiom]
        default:
            break
        }
        
        return params
    }
    
    var method: HTTPMethod {
        switch self {
			
		case .loadCategories, .loadIdioms:
			return .get
		case .loadVideo, .postVideo, .rateVideo, .registerUser:
			return .post
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        
        let url = try APIEndpoints.baseUrl.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
		urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
		
        urlRequest.httpMethod = method.rawValue
        urlRequest.timeoutInterval = 60.0
		
		switch self {
		case .loadCategories, .loadIdioms:
			return try URLEncoding.methodDependent.encode(urlRequest, with: parameters)
		default:
			return try JSONEncoding.default.encode(urlRequest, with: parameters)
		}
    }
}

struct APIEndpoints {
    static let baseUrl = "https://zan.net.br/zam/"
    static let loadVideo = "receberj.php"
	static let loadCategories = "api/catsj.php"
	static let loadIdioms = "api/idiomasj.php"
	static let postVideo = "upload.php"
	static let rateVideo = "avaliarj.php"
	static let registerUser = "adduserj.php"
}
