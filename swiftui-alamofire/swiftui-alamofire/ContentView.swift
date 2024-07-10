//
//  ContentView.swift
//  swiftui-alamofire
//
//  Created by Sachin Daingade on 10/07/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = PetsViewModel()
    var body: some View {
        NavigationStack {
            List(viewModel.arrOfProducts) { product in
                ScrollView {
                    let viewModel = ProductViewModel(withProduct: product)
                    NavigationLink {
                        // ProductDetailView(product: product)
                    } label: {
                        ProductCell(productViewModel: viewModel)
                    }
                }
            }
            .onAppear(perform: {
                viewModel.input = .getAllProducts
            })
            .navigationTitle("Products")
        }
    }
}

#Preview {
    ContentView()
}
