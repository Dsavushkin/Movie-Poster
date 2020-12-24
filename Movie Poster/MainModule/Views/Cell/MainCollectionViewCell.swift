//
//  MainCollectionViewCell.swift
//  Movie Poster
//
//  Created by Дмитрий on 23.12.2020.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {

    static let identifier = "MainCollectionViewCell"
    var imageLoader = ImageLoader()
    
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    //    override init(frame: CGRect) {
//        super.init(frame: frame)
//        contentView.backgroundColor = .red
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundView?.backgroundColor = .red
    }
    
    func setUpCell(_ movie: Movie){
        movieNameLabel.text = movie.title
        imageLoader.loadImage(with: movie.backdropUrl)
        posterImage.image =  self.imageLoader.image
        ratingLabel.text = "Rating \(movie.voteAverage)"
    }

}
