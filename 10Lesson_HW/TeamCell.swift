//
//  TeamCell.swift
//  10Lesson_HW
//
//  Created by Reek i on 09.07.2022.
//

import UIKit

class TeamCell: UITableViewCell {

//    @IBOutlet var teamImage: UIImageView!
//    @IBOutlet var rankLabel: UILabel!
//    @IBOutlet var teamNameLabel: UILabel!
    
    @IBOutlet var abbrLabel: UILabel!
    @IBOutlet var rukovodLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var wwwLabel: UILabel!
    
    func configure(with irekData: Irek) {
        abbrLabel.text = irekData.abbr
        rukovodLabel.text = irekData.rukovod
        emailLabel.text = irekData.email
        wwwLabel.text = irekData.www
        
//        textLabel?.text = "\(standing.status ?? nil)"
//        rankLabel.text = "Rank: \(standing.note?.rank ?? 0)"
//        teamNameLabel.text = standing.team?.name
        
//        guard let logos = standing.team?.logos else { return }
//        guard let stringURL = logos[0].href else { return }
//        guard let imageUrl = URL(string: stringURL) else { return }
//        guard let imageData = try? Data(contentsOf: imageUrl) else { return }
//
//        DispatchQueue.main.async {
//            self.teamImage.image = UIImage(data: imageData)
//        }
    }
}
