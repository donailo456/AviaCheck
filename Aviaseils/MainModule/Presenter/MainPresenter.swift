//
//  MainPresenter.swift
//  Aviaseils
//
//  Created by Danil Komarov on 25.07.2023.
//

import Foundation
import UIKit

protocol MainViewProtocol: class {
    func success()
    func failure(error: Error)
}

protocol MainViewPresenterProtocol: class {
    init(view: MainViewProtocol, router: RouterProtocol, networkService: NetworkServiceProtocol)
    func tapOnTheComment()
    func dateFormatter(picker: UIDatePicker) -> String
}

class MainPresenter: MainViewPresenterProtocol {
    weak var view: MainViewProtocol?
    var router: RouterProtocol?
    var networkService: NetworkServiceProtocol!
    
    required init(view: MainViewProtocol, router: RouterProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.router = router
        self.networkService = networkService
    }
    
    func tapOnTheComment() {
        router?.showDetail()
    }
    func dateFormatter(picker: UIDatePicker) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let data = formatter.string(from: picker.date)
        return data
    }
    
}
                    
                                  
                                  
                                
