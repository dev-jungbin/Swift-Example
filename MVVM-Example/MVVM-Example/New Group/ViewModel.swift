//
//  ViewModel.swift
//  MVVM-Example
//
//  Created by madilyn on 2022/05/05.
//

import Foundation

class ViewModel {
    var onUpdated: () -> Void = {}
    
    // 화면에 보여져야 할 값
    var currentToDoModel = Model() {
        didSet {
            onUpdated()
        }
    }
    
    let service = Service()
    
    func reload() {
        
        // Model -> ViewModel
        service.fetchData { [weak self] model in
            guard let self = self else { return }
            self.currentToDoModel = model
        }
    }
    
    func selectUser(userID: Int) {
        service.selectUser(userId: userID)
        currentToDoModel = service.currentModel
    }
}
