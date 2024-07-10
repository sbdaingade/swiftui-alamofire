//
//  Cell.swift
//  swiftui-alamofire
//
//  Created by Sachin Daingade on 10/07/24.
//

import Foundation
import SwiftUI

struct ProductCell: View {
    @StateObject var productViewModel: ProductViewModel

    var body: some View {
        
        HStack(alignment: .center) {

            AsyncImage(url: URL(string: productViewModel.urlString),content: asyncImageView)
                .frame(width:100, height:100)
                .background(Color.gray)
                .cornerRadius(10.0)
            VStack(alignment: .leading) {
                Text(productViewModel.title)
                    .multilineTextAlignment(.leading)
                    .lineLimit(1)
                    .font(.title3)
               
            }
        }
    }
    
    
    @ViewBuilder
    private func asyncImageView(for phase: AsyncImagePhase) -> some View {
        switch phase {
        case .empty:
            ProgressView.init("Loading..")
        case .success(let image):
            image.resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
        case .failure(let error):
            VStack(spacing:16) {
                Image(systemName: "xmark.octagon.fill")
                    .foregroundColor(.red)
                Text(error.localizedDescription)
                    .multilineTextAlignment(.center)
            }
            
        @unknown default:
            Text("unknown")
                .foregroundColor(.gray)
        }
    }
}
