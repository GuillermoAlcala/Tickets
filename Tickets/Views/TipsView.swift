//
//  TipsView.swift
//  Tickets
//
//  Created by guillermo chacon alcala on 09/09/22.
//

import SwiftUI

struct TipsView: View {
    @State var Total:Int
    @State var CantidadPersonas:String
    @State private var  stepper: Int = 0
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVStack(alignment: .leading){
                    Text("El total es: \(Total)")
                //    TextField("Cantidad de personas", text: ($CantidadPersonas))
                //        .keyboardType(.numberPad)
                //    Stepper("Cantidad de personas: \(stepper)", value: $stepper)
                   
                }.padding()
            }
        .navigationTitle("Tips")
        }
    }
}
//
//struct TipsView_Previews: PreviewProvider {
//    static var previews: some View {
//        TipsView(Total:100, CantidadPersonas: "")
//    }
//}
