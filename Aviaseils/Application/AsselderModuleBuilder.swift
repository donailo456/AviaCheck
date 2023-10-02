//
//  ModuleBuilder.swift
//  Aviaseils
//
//  Created by Danil Komarov on 25.07.2023.
//

import UIKit

protocol AsselderBuilderProtocol {
    func createMainModule(router: RouterProtocol) -> UIViewController
    func createAviaModule(router: RouterProtocol) -> UIViewController
}

class AsselderModuleBuilder: AsselderBuilderProtocol {
    func createMainModule(router: RouterProtocol) -> UIViewController {
        let view = MainViewController()
        let networkService = NetworkService()
        let presenter = MainPresenter(view: view, router: router, networkService: networkService)
        view.presenter = presenter
        return view
    }
    
    func createAviaModule(router: RouterProtocol) -> UIViewController {
        let view = AviaViewController()
        let networkService = NetworkService()
        let presenter = AviaPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }
    
}
