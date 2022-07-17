//
//  DogImageViewController.swift
//  10Lesson_HW
//
//  Created by Reek i on 23.06.2022.
//

import UIKit

class DogImageViewController: UIViewController {

    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
//    var imageURLString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        fetchImage()
    }
}
 
extension DogImageViewController {
    private func fetchImage() {
        guard let url = URL(string: URLAdresses.dogJSONURL.rawValue) else { return }

        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            do {
                let dog = try JSONDecoder().decode(DogModel.self, from: data)
                guard let stringURL = dog.url, let imageURL = URL(string: stringURL) else { return }
                guard let imageData = try? Data(contentsOf: imageURL) else { return }
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: imageData)
                    self.activityIndicator.stopAnimating()
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
}
