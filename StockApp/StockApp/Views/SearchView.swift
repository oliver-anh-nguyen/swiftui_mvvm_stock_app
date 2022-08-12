//
//  SearchView.swift
//  StockApp
//
//  Created by AnhNguyen on 11/08/2022.
//

import SwiftUI

struct SearchView: View {
    @Binding var searchTerm: String
    var body: some View {
        
        HStack {
            Spacer()
            Image(systemName: "magnifynggclass")
            
            TextField("Search", text: self.$searchTerm)
                .foregroundColor(Color.primary)
                .padding(10)
            Spacer()
        }.foregroundColor(.secondary)
            .background(Color(
                .secondarySystemBackground))
            .cornerRadius(10)
            .padding(10)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(searchTerm: .constant(""))
    }
}
