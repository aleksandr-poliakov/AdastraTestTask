//
//  MainCoordinator.swift
//  AdastraTestTask
//
//  Created by Aleksandr on 19.09.2022.
//

import UIKit

final class MainCoordinator: Coordinator {
    private var navigationController: UINavigationController
    
    var window: UIWindow?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let networkManager = HTTPManager()
        let viewController = CatUIComposer.composeWith(manager: networkManager)
        navigationController = UINavigationController(rootViewController: viewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
    
