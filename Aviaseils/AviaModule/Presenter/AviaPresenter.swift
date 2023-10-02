//
//  AviaPresenter.swift
//  Aviaseils
//
//  Created by Danil Komarov on 02.08.2023.
//

import Foundation

protocol AviaViewProtocol: class {
    func success()
    func failure(error: Error)
}

protocol AviaViewPresenterProtocol: class {
    init(view: AviaViewProtocol, networkService: NetworkServiceProtocol)
    func getComments()
    var comments: [Datum]? { get set }
}

class AviaPresenter: AviaViewPresenterProtocol {
    weak var view: AviaViewProtocol?
    let networkService: NetworkServiceProtocol!
    var comments: [Datum]?
    
    required init(view: AviaViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        getComments()
    }
    
    func getComments() {
        networkService.getComments(origin: Info.shared.origin ?? "", destination: Info.shared.destanation ?? "", departAt: Info.shared.departAt ?? "", returnAt: Info.shared.returnAt ?? "") { [weak self] result in
            guard let self = self else {return}
            DispatchQueue.main.async {
                switch result {
                case .success(let comments):
                    self.comments = comments
                    print("comments: \(comments)")
                    self.view?.success()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
    
    
}
