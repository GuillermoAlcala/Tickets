//
//  TotalOrdersView.swift
//  Tickets
//
//  Created by guillermo chacon alcala on 09/09/22.
//

import SwiftUI
struct TotalOrdersView: View {
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVStack(alignment:.leading){
                    Text("Total Orders")
                }.padding()
            }
            .navigationTitle("Total Orders")
        }
    }
}

struct TotalOrdersView_Previews: PreviewProvider {
    static var previews: some View {
        TotalOrdersView()
    }
}
