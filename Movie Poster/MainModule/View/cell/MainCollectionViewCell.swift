//
//  MainCollectionViewCell.swift
//  Movie Poster
//
//  Created by Дмитрий on 23.12.2020.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {

    static let identifier = "MainCollectionViewCell"
    
    @IBOutlet weak var movieNameLabel: UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUpCell(_ movie: Movie){
        movieNameLabel.text = movie.title
    }

}
