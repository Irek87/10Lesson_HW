//
//  ThronesTableViewCell.swift
//  10Lesson_HW
//
//  Created by Reek i on 17.07.2022.
//

import UIKit

class ThronesTableViewCell: UITableViewCell {

    @IBOutlet var imageLabel: UIImageView!
    @IBOutlet var fullNameLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var familyLabel: UILabel!
    
    func configure(with person: GamesOfThrones) {
        fullNameLabel.text = "Full Name: \(person.fullName ?? "")"
        titleLabel.text = "Title: \(person.title ?? "")"
        familyLabel.text = "Family: \(person.family ?? "")"
        
        DispatchQueue.global().async {
            guard let stringURL = person.imageUrl else { return }
            guard let imageUrl = URL(string: stringURL) else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            
            DispatchQueue.main.async {
                self.imageLabel.image = UIImage(data: imageData)
            }
        }
    }

}
