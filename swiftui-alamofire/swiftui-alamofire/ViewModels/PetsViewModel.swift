//
//  PetsViewModel.swift
//  swiftui-alamofire
//
//  Created by Sachin Daingade on 10/07/24.
//

import Foundation
import Combine

@MainActor
class  PetsViewModel: ObservableObject {
    @Published private(set) var arrOfProducts = [Pet]()
    private var cancellable = Set<AnyCancellable>()
    
    public enum Input {
        case getAllProducts
    }
    
    @Published public var input: Input?
    
    init() {
        $input.compactMap{$0}.sink {[unowned self] action in
            switch action {
            case .getAllProducts:
                getData()
            }
        }.store(in: &cancellable)
    }
    
    private func getData() {
        Task {
            NetworkService.getPetsData().compactMap{$0}.sink { response in
                switch response {
                case .finished:
                    debugPrint("success")
                case .failure(let error):
                    debugPrint("\(error.localizedDescription)")
                }
            } receiveValue: {[weak self] pets in
                self?.arrOfProducts = pets.pets
            }.store(in: &cancellable)
        }
    }
    
    deinit {
        cancellable.forEach{$0.cancel()}
    }
}
