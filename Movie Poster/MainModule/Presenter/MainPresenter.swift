//
//  ViewController.swift
//  Movie Poster
//
//  Created by Дмитрий on 21.12.2020.
//

import UIKit

class MainPresenter: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
//    let movies = Movie(title: "Tile", description: "Description", poster: "Poster")
    
    @IBOutlet weak var collectionView: UICollectionView!
    
//    private var moviesNowPlaying = MovieListState()
    var movies: [Movie]?
    var error: NSError?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.movies = MovieListState.shared.movies
        MovieStore.shared.fetchMovies { [weak self]  (result) in
//                self?.isLoading = false
            DispatchQueue.main.async {
                switch result{
                case .success(let response):
                    self?.movies = response.results
                    self?.collectionView.reloadData()
                case .failure(let error):
                    self?.error = error as NSError
                
            }
            }
        }
//        collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: MainCollectionViewCell.identifier)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.identifier, for: indexPath) as? MainCollectionViewCell
        item?.setUpCell((movies?[indexPath.item])!)
//        item?.movieNameLabel.text = "123"
        item?.backgroundColor = .red
        return item!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Tap")
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//    }
    
}

