//
//  Router.swift
//  Aviaseils
//
//  Created by Danil Komarov on 04.08.2023.
//

import UIKit

protocol RouterMain {
    var navigationController: UINavigationController? { get set }
    var assemblyBuilder: AsselderBuilderProtocol? { get set }
}

protocol RouterProtocol: RouterMain {
    func initialViewController()
    func showDetail()
}

class Router: RouterProtocol {
    var navigationController: UINavigationController?
    var assemblyBuilder: AsselderBuilderProtocol?
    
    init(navigationController: UINavigationController, assemblyBuilder: AsselderBuilderProtocol){
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
    
    func initialViewController() {
        if let navigationController = navigationController {
            guard let mainViewController = assemblyBuilder?.createMainModule(router: self) else { return }
            navigationController.viewControllers = [mainViewController]
        }
    }
    func showDetail() {
        if let navigationController = navigationController {
            guard let aviaViewController = assemblyBuilder?.createAviaModule(router: self) else { return }
            navigationController.pushViewController(aviaViewController, animated: true)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
        }
    }
}
