//
//  DetailViewController.swift
//  TMDBExam
//
//  Created by Sergey Krasiuk on 06/12/2021.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var additionalData: UILabel!
    
    var movie: TMDBMovie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
    }
    
    private func setupUI() {
        
        let posterURL = URL(string: "https://image.tmdb.org/t/p/original\(self.movie.posterPath)")
        self.poster.kf.setImage(with: posterURL)
        self.titleLabel.text = self.movie.title
        self.descriptionLabel.text = self.movie.overview
        self.additionalData.text = "Popularity: \(self.movie.popularity), VoteAverage: \(self.movie.voteAverage), VoteCount: \(self.movie.voteCount)"
        
    }

    @IBAction func didTapAddToFavButton(_ sender: UIButton) {
    }
}
