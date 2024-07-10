//
//  ProductModel.swift
//  swiftui-alamofire
//
//  Created by Sachin Daingade on 10/07/24.
//

import Foundation
import Combine
public class ProductViewModel: ObservableObject, Identifiable {
    private var cancallables = Set<AnyCancellable>()
    @Published public var title: String
    @Published public var urlString: String
  
    private var product: Pet
    
    init(withProduct product: Pet) {
        self.product = product
        self.title = product.title
        self.urlString = product.imageURL
    }
    
    deinit {
        cancallables.forEach{$0.cancel()}
    }
}
