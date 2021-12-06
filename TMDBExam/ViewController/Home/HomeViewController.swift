//
//  HomeViewController.swift
//  TMDBExam
//
//  Created by Sergey Krasiuk on 06/12/2021.
//  
//

import UIKit
import WaterfallLayout

class HomeViewController: UIViewController, HomeViewProtocol, UICollectionViewDelegate, UICollectionViewDataSource, WaterfallViewDelegate  {
    
    @IBOutlet weak var moviesCollectionView: UICollectionView!
    
    private var presenter: HomePresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter = HomePresenter(for: self)
        self.setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.presenter.fetch()
    }
    
    // MARK: - UI
    
    private func setupUI() {
        
        let layout = WaterfallLayout()
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        layout.minimumColumnSpacing = 16
        layout.minimumVerticalItemSpacing = 16
        layout.columnCount = 2
        
        self.moviesCollectionView.collectionViewLayout = layout
        self.moviesCollectionView.delegate = self
        self.moviesCollectionView.dataSource = self
        
    }
    
    // MARK: - Actions
    
    // MARK: - Private
    
    // MARK: - HomeViewProtocol
    
    func update() {
        self.moviesCollectionView.reloadData()
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.presenter.movieList.results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MovieCollectionViewCell.self),
                                                            for: indexPath) as? MovieCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.set(item: self.presenter.movieList.results[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let detailsViewController = DetailViewController.instantiateFrom(storyboard: .main)
        detailsViewController.movie = self.presenter.movieList.results[indexPath.item]
        
        self.navigationController?.pushViewController(detailsViewController, animated: true)
    }
    
    // MARK: - WaterfallViewDelegate
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        heightForItemAtIndexPath indexPath: IndexPath) -> CGFloat {
        let height: CGFloat = [340, 310, 330].randomElement()!
        return height
    }
}
