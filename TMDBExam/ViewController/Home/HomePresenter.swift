//
//  HomePresenter.swift
//  TMDBExam
//
//  Created by Sergey Krasiuk on 06/12/2021.
//  
//

import Foundation

class HomePresenter: HomePresenterProtocol {
    
    weak var view: HomeViewProtocol?
    
    private var networkManager: NetworkServiceProtocol!
    var movieList: TMDBList = TMDBList(page: 0, results: [], totalPages: 0, totalResults: 0)
    
    
    init(`for` view: HomeViewProtocol, networkService: NetworkServiceProtocol = NetworkManager()) {
        self.view = view
        self.networkManager = networkService
    }
    
    // MARK: - Private
    
    func fetch() {
        
        self.networkManager.request(point: MoviesService.movies) { (result: Result<TMDBList, Failure>) in
            
            switch result {
            case .success(let list):

                self.movieList = list
                self.view?.update()
                debugPrint("[S]: \(list)")
                
            case .failure(let error):
                debugPrint("[F]: \(error.localizedDescription)")
            }
        }
    }
    
    // MARK: - HomePresenterProtocol
}
