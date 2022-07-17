//
//  ThronesTableViewController.swift
//  10Lesson_HW
//
//  Created by Reek i on 17.07.2022.
//

import UIKit
import Alamofire

class ThronesTableViewController: UITableViewController {
    
    var thrones: [GamesOfThrones] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 150
        fetchThrones()

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        thrones.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "thronesCell", for: indexPath) as! ThronesTableViewCell

        let games = thrones[indexPath.row]
        cell.configure(with: games)

        return cell
    }
 
    // MARK: - Networking
    
    func fetchThrones() {
//        guard let url = URL(string: URLAdresses.thronesURL.rawValue) else { return }
//
//        URLSession.shared.dataTask(with: url) { data, _, _ in
//            guard let data = data else { return }
//            do {
//                self.thrones = try JSONDecoder().decode([GamesOfThrones].self, from: data)
//
//                DispatchQueue.main.async {
//                    self.tableView.reloadData()
//                }
//            } catch let error {
//                print(error)
//            }
//        }.resume()
        
//        AF.request(URLAdresses.thronesURL.rawValue)
//            .responseDecodable(of: [GamesOfThrones].self) { responseData in
//                switch responseData.result {
//                case .success(let thrones):
//                    self.thrones = thrones
//                    DispatchQueue.main.async {
//                        self.tableView.reloadData()
//                    }
//                case .failure(let error):
//                    print(error)
//                }
//            }
        
        AF.request(URLAdresses.thronesURL.rawValue)
            .validate()
            .responseJSON { responseData in
//                guard let statusCode = responseData.response?.statusCode else { return }
//
//                print(statusCode)
//
//                if (200..<300).contains(statusCode) {
//                    guard let value = responseData.value else { return }
//                    print(value)
//                } else {
//                    guard let error = responseData.error else { return }
//                    print(error)
//                }
                
                switch responseData.result {
                case .success(let value):
//                    guard let thronesData = value as? [[String: Any]] else { return }
//
//                    for throneData in thronesData {
////                        let throne = GamesOfThrones(
////                            fullName: throneData["fullName"] as? String,
////                            title: throneData["title"] as? String,
////                            family: throneData["family"] as? String,
////                            imageUrl: throneData["imageUrl"] as? String
////                        )
//                        let throne = GamesOfThrones(throneData: throneData)
//
//                        self.thrones.append(throne)
//                    }
                    
                    self.thrones = GamesOfThrones.getThrones(from: value)
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                case .failure(let error):
                    print(error)
                }
            }
    }
}
