//
//  HomeContract.swift
//  TMDBExam
//
//  Created by Sergey Krasiuk on 06/12/2021.
//  
//

import Foundation

protocol HomeViewProtocol: AnyObject {
    func update()
}

protocol HomePresenterProtocol {
    var movieList: TMDBList { get set }
    
    func fetch()
}
