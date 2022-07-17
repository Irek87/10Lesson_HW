//
//  ViewController.swift
//  10Lesson_HW
//
//  Created by Reek i on 23.06.2022.
//

import UIKit

enum URLAdresses: String {
    case dogJSONURL = "https://random.dog/woof.json"
//    case footballURL = "https://api-football-standings.azharimm.site/leagues/eng.1/standings?season=2021&sort=asc"
    case footballURL = "https://myjson.dit.upm.es/api/bins/74xr"
}

class ViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showEPL" {
            let footballVC = segue.destination as! FootballViewController
//            footballVC.fetchEPL()
            footballVC.fetchIrek()
        } else if segue.identifier == "showDogImage" {
            let dogImageVC = segue.destination as! DogImageViewController
            dogImageVC.imageURLString = URLAdresses.dogJSONURL.rawValue
        } else { return }
    }

    @IBAction func GetImageButtonTapped(_ sender: Any) {
    }
    
    @IBAction func ToSeeEPLButtonTapped(_ sender: Any) {
        guard let url = URL(string: URLAdresses.footballURL.rawValue) else { return }
        URLSession.shared.dataTask(with: url) { data, _, _ in
//            if let error = error {
//                print(error)
//            }
            
//            if let response = response {
//                print(response)
//            }
            
            guard let data = data else { return }
            do {
                let irekData = try JSONDecoder().decode(Irek.self, from: data)
                print(irekData)
            } catch let error {
                print(error)
            }
        }.resume()
    }
}

