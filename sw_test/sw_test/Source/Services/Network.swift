//
//  Network.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 07.02.2024.
//

import Foundation
import Alamofire

final class Network: NetworkProtocol {

    static var shared = Network()
    static var token = ""
    private let baseUrl = "http://147.78.66.203:3210"

    func login(login: String, password: String, completion: @escaping(Result<TokenModel, Error>) -> ()) {
        let requestURL = "\(baseUrl)/auth/login"
        AF.request(
            requestURL,
            method: .post,
            parameters: ["login": login, "password": password],
            encoding: JSONEncoding.default
        ).responseDecodable(of: TokenModel.self) { data in
            guard let result = data.value else {
                completion(.failure(CustomError(message: "token nil data")))
                return
            }
            Network.token = result.token
            completion(.success(result))
        }
    }

    func getCafes(completion: @escaping(Result<[LocationsModel], Error>) -> ()) {
        let headers: HTTPHeaders = [.authorization(bearerToken: Network.token)]
        let requestURL = "\(baseUrl)/locations"
        AF.request(
            requestURL,
            method: .get,
            headers: headers
        ).responseDecodable(of: [LocationsModel].self) { data in
            guard let result = data.value else {
                completion(.failure(CustomError(message: "cafe nil data")))
                return
            }
            completion(.success(result))
        }
    }

    func getMenu(idCafe: Int, completion: @escaping(Result<[MenuModel], Error>) -> ()) {
        let headers: HTTPHeaders = [.authorization(bearerToken: Network.token)]
        let requestURL = "\(baseUrl)/location/\(idCafe)/menu"
        AF.request(
            requestURL,
            method: .get,
            headers: headers
        ).responseDecodable(of:[MenuModel].self) { data in
            guard let result = data.value else {
                completion(.failure(CustomError(message: "menu nil data")))
                return
            }
            completion(.success(result))
        }
    }
}
