//
//  TipsView.swift
//  Tickets
//
//  Created by guillermo chacon alcala on 09/09/22.
//

import SwiftUI
struct TipsView: View {
    @ObservedObject private var model=ViewModel()
    //    @State var Total:Int
    //    @State var CantidadPersonas:String
    //    @State private var  stepper: Int = 0
    //    @State private var showingWelcome = false
    
    var body: some View {
        NavigationView{
            // FORMULARIO DE PAGO
            Form{
                Section(header: Text("User payments")){
                    TextField("Name", text: $model.user)
                    Picker("Information Payment", selection: $model.user) {
                    // MARK: - CAMPOS
                        TextField("Card Number", text: $model.user)
                        DatePicker("Expiration",
                                   selection: $model.date,
                                   displayedComponents: [.date])
                        TextField("Security Code", text: $model.user)
                        Toggle("Automatic pay", isOn: $model.available)
                            .tint(.teal)
                    } //: PICKER
                    
                } //: SECTION
                Section(header: Text("Personal Settings")){
                    TextField("City", text: $model.user)
                    TextField("Postal Code", text: $model.user)
                    TextField("Adress", text: $model.user)
                    TextField("Phone", text: $model.user)
                      //  .keyboardType(.numberPad)
                    
                }
                
                Button(action: {
                    
                }){
                    Text("Guardar")
                        .fontWeight(.light)
                        .frame(width:UIScreen.main.bounds.width-90)
                }
            } //: FORM
            
            
            //            ScrollView{
            //                LazyVStack(alignment: .leading){
            //                    Text("El total es: \(Total)")
            //                    //    TextField("Cantidad de personas", text: ($CantidadPersonas))
            //                    //        .keyboardType(.numberPad)
            //                    //    Stepper("Cantidad de personas: \(stepper)", value: $stepper)
            //
            //                }.padding()
            //
            //                VStack {
            //                    Toggle("Toggle label", isOn: $showingWelcome.animation(.spring()))
            //
            //                    if showingWelcome==true {
            //                        Text("Toggle prendido")
            //                            .font(.title)
            //                            .foregroundColor(.yellow)
            //
            //                        }else{
            //                        Text("Toggle apagado")
            //                                .font(.title)
            //                                .foregroundColor(.cyan)
            //
            //                    }
            //                }.padding()
            .navigationTitle("Tips")
        }
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


struct TipsView_Previews: PreviewProvider {
    static var previews: some View {
        TipsView()
    }
}


class MacAddressFormatter: Formatter {
    override func string(for obj: Any?) -> String? {
        if let string = obj as? String {
            return formattedAddress(mac: string)
        }
        return nil
    }
    
    override func getObjectValue(_ obj: AutoreleasingUnsafeMutablePointer<AnyObject?>?, for string: String, errorDescription error: AutoreleasingUnsafeMutablePointer<NSString?>?) -> Bool {
        obj?.pointee = string as AnyObject?
        return true
    }
    
    func formattedAddress(mac: String?) -> String? {
        guard let number = mac else { return nil }
        let mask = "###-###-####"
        var result = ""
        var index = number.startIndex
        for ch in mask where index < number.endIndex {
            if ch == "#" {
                result.append(number[index])
                index = number.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }
}
