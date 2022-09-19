//
//  CatUIComposer.swift
//  AdastraTestTask
//
//  Created by Aleksandr on 19.09.2022.
//

import Foundation

final class CatUIComposer {
    private init() {}

    static func composeWith(manager: HTTPManagerProtocol) -> MainViewController {
        let viewModel = MainViewModel(networkManager: manager)
        let mainViewController = MainViewController(viewModel: viewModel)
        return mainViewController
    }
}
