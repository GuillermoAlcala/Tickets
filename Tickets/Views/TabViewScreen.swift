//
//  TabView.swift
//  Tickets
//
//  Created by guillermo chacon alcala on 09/09/22.
//

import SwiftUI

struct TabViewScreen: View {
//    @ObservedObject  var item:Item
    var body: some View {
        
        TabView(){
            OrdersView().tabItem(){
                Label("Orders",systemImage: "cart")
            }
            PersonalView().tabItem(){
                Label("Personal", systemImage:"shekelsign.square")
            }
            TotalOrdersView().tabItem(){
                Label("Totals",systemImage:"sum")
            }
        }.accentColor(Color(hue: 0.583, saturation: 0.501, brightness: 0.696))

        
    }
}

//
//struct TabViewScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        TabViewScreen(item: item)
//    }
//}
