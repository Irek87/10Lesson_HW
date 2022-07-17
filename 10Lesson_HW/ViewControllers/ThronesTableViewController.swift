//
//  ThronesTableViewController.swift
//  10Lesson_HW
//
//  Created by Reek i on 17.07.2022.
//

import UIKit

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
        guard let url = URL(string: URLAdresses.thronesURL.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            do {
                self.thrones = try JSONDecoder().decode([GamesOfThrones].self, from: data)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
}
