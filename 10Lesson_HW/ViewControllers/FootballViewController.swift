//
//  FootballViewController.swift
//  10Lesson_HW
//
//  Created by Reek i on 07.07.2022.
//

import UIKit

class FootballViewController: UITableViewController {
    
    var footballs: [FootballModel] = []
    var standings: [Standing] = []
//    var irekDatas: [Irek] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchEPL()
//        tableView.rowHeight = 100
}
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        guard let standingsNum = footballs[0].ddata?.standings?.count else { return 0 }
        footballs.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TeamCell


//        let football = footballs[0]
//        let standings = football.data?.standings
//        let standing = standings?[indexPath.row]
//        if let stand = standing {
//            cell.configure(with: stand)
//        }

        if let standing = footballs.first?.ddata?.standings?[indexPath.row] {
            cell.configure(with: standing)
        }
        
//        let irekData = irekDatas[indexPath.row]
//        cell.configure(with: irekData)
        
        return cell
    }

    // MARK: - Networking
    func fetchEPL() {
        guard let url = URL(string: URLAdresses.footballURL.rawValue) else { return }

        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            do {
                self.footballs = try JSONDecoder().decode([FootballModel].self, from: data)
                if let standings = self.footballs.first?.ddata?.standings {
                    self.standings = standings
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let error {
                print("There is an error: \(error)")
            }
        }.resume()
    }
    
//    func fetchIrek() {
//        guard let url = URL(string: URLAdresses.footballURL.rawValue) else { return }
//
//        URLSession.shared.dataTask(with: url) { data, _, _ in
//            guard let data = data else { return }
//            do {
//                self.irekDatas = try JSONDecoder().decode([Irek].self, from: data)
//                DispatchQueue.main.async {
//                    self.tableView.reloadData()
//                }
//            } catch let error {
//                print(error)
//            }
//        }.resume()
//    }
}
