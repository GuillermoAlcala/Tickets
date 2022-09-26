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
    @State private var showingWelcome = false
    
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVStack(alignment: .leading){
                    Text("El total es: \(Total)")
                    //    TextField("Cantidad de personas", text: ($CantidadPersonas))
                    //        .keyboardType(.numberPad)
                    //    Stepper("Cantidad de personas: \(stepper)", value: $stepper)
                    
                }.padding()
                
                VStack {
                    Toggle("Toggle label", isOn: $showingWelcome.animation(.spring()))
                    
                    if showingWelcome==true {
                        Text("Toggle prendido")
                            .font(.title)
                            .foregroundColor(.yellow)

                        }else{
                        Text("Toggle apagado")
                                .font(.title)
                                .foregroundColor(.cyan)

                    }
                }.padding()
            }
            .navigationTitle("Tips")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                    } label: {
                        Label("Add food", systemImage: "plus.circle")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }//toolbar
            
        }
    }
}
//
//struct TipsView_Previews: PreviewProvider {
//    static var previews: some View {
//        TipsView(Total:100, CantidadPersonas: "")
//    }
//}
