//
//  Repository.swift
//  MVVM-Example
//
//  Created by madilyn on 2022/05/05.
//

import Foundation

class Repository {
    func fetchData(onCompleted: @escaping (Entity) -> Void) {
        let url = "https://jsonplaceholder.typicode.com/todos"
        
        URLSession.shared.dataTask(with: URL(string: url)!) { data, _, _ in
            guard let data = data else { return }
            guard let model = try? JSONDecoder().decode(Entity.self, from: data) else { return }
            onCompleted(model)
        }.resume()
    }
}
