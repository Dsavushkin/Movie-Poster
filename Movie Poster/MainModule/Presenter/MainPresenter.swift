//
//  ViewController.swift
//  Movie Poster
//
//  Created by Дмитрий on 21.12.2020.
//

import UIKit

class MainPresenter: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let movies = Movie(title: "Tile", description: "Description", poster: "Poster")
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: MainCollectionViewCell.identifier)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.identifier, for: indexPath) as? MainCollectionViewCell
        item?.setUpCell(movies)
        return item!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Tap")
    }
    
}

