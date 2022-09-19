//
//  MainViewModel.swift
//  AdastraTestTask
//
//  Created by Aleksandr on 19.09.2022.
//

import Foundation

final class MainViewModel {
    private var networkManager: HTTPManagerProtocol?
    private var cats: [Cat] = []
    typealias Observer<T> = (T) -> Void
    
    var dataIsLoaded: Observer<Bool>?
    
    init(networkManager: HTTPManagerProtocol) {
        self.networkManager = networkManager
    }
    
    func fetchData() {
        guard
            let url = URL(string: "https://cat-fact.herokuapp.com/facts/random?amount=10")
        else {
            return
        }
        
        networkManager?.get(url: url, completionBlock: { [weak self] result in
            guard self != nil else { return }
            
            switch result {
            case .success(let data):
                self?.cats = CatItemsMapper.map(data)
                self?.dataIsLoaded?(true)
            case .failure:
                self?.dataIsLoaded?(false)
            }
        })
    }
    
    func numberOfItems() -> Int {
        cats.count
    }
    
    func indexPathPerItem(index: Int) -> Cat {
        cats[index]
    }
}
