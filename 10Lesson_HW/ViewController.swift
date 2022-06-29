//
//  ViewController.swift
//  10Lesson_HW
//
//  Created by Reek i on 23.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let imageURL = "https://random.dog/woof.json"

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dogImageVC = segue.destination as! DogImageViewController
        dogImageVC.imageURLString = imageURL
    }

    @IBAction func GetImageButtonTapped(_ sender: Any) {
    }
    
}

