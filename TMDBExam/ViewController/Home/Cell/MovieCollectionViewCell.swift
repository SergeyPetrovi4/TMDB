//
//  MovieCollectionViewCell.swift
//  TMDBExam
//
//  Created by Sergey Krasiuk on 06/12/2021.
//

import UIKit
import Kingfisher

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var descr: UILabel!
    @IBOutlet weak var poster: UIImageView!
    
    func set(item: TMDBMovie) {
        
        let urlPoster = URL(string: "https://image.tmdb.org/t/p/w500\(item.posterPath)")
        self.poster.kf.setImage(with: urlPoster)
        
        self.title.text = item.title
        self.descr.text = item.overview
    }
}
