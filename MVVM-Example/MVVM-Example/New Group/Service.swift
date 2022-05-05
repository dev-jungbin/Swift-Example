//
//  Service.swift
//  MVVM-Example
//
//  Created by madilyn on 2022/05/05.
//

import Foundation

class Service {
    let repository = Repository()
    
    var currentModel = Model()
    
    func fetchData(onCompleted: @escaping (Model) -> Void) {
        
        // Entity -> Model
        
        repository.fetchData { [weak self] entity in
            var model = Model()
            entity.forEach {
                model.append(ModelElement(id: $0.id, userID: $0.userID, title: $0.title))
            }
            self?.currentModel = model
            
            onCompleted(model)
        }
    }
    
    func selectUser(userId: Int) {
        var model = Model()
        
        currentModel.forEach {
            if $0.userID == userId {
                model.append($0)
            }
        }
        
        currentModel = model
    }
}
