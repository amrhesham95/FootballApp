//
//  Network.swift
//  FootballApp
//
//  Created by Amr Hesham on 11/22/20.
//  Copyright © 2020 jets. All rights reserved.
//

import Foundation

class Network {
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
        
    func getAllLeagues(completion:@escaping (StorageLeagues) -> Void) {
        let url  = URL(string: NetworkConstants.allLeaguesURL)
        guard let comptetionsUrl = url else {return}
        
        var request = URLRequest(url: comptetionsUrl)
            dataTask =
                defaultSession.dataTask(with: request) { [weak self] data, response, error in
                    defer {
                        self?.dataTask = nil
                    }
                    if let error = error {
                        print(error)
                    } else if
                        let data = data,
                        let response = response as? HTTPURLResponse,
                        response.statusCode == 200 {
                        // 6
                        do {
                            let leagues = try JSONDecoder().decode(Leagues.self, from: data)
                            completion(leagues.storageLeagues)
                        }catch {
                                print(error)
                        }
                    }
            }
            dataTask?.resume()
        }
    
    
    func getAllTeams(with id:Int, completion:@escaping (StorageTeamsResponse) -> Void) {
        let url  = URL(string: NetworkConstants.getAllTeamsURL(id: id))
                guard let comptetionsUrl = url else {return}
                
                var request = URLRequest(url: comptetionsUrl)
        request.setValue(NetworkConstants.apiKey, forHTTPHeaderField: NetworkConstants.headerKey)
                    // 4
                    dataTask =
                        defaultSession.dataTask(with: request) { [weak self] data, response, error in
                            defer {
                                self?.dataTask = nil
                            }
                             if let error = error {
                                print(error)
                            } else if
                                let data = data {
                                do {
                                    let teamsResponse = try JSONDecoder().decode(TeamsResponse.self, from: data)
                                    
                                    completion(teamsResponse.storageTeamsResponse)
                                    
                                }catch {
                                    print(error)
                                }
                            }
        }
                    dataTask?.resume()
                }
    }


private extension Network {
    enum NetworkConstants {
        static let allLeaguesURL = "http://api.football-data.org/v2/competitions"
        
        static func getAllTeamsURL(id: Int) -> String {
            return "\(allLeaguesURL)/\(id)/teams"
        }	
        
        static let apiKey = "ec775bfe0f1f4b44bd94227cb623f809"
        static let headerKey = "X-Auth-Token"
        
    }
}
