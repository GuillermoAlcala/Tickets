//
//  TipsView.swift
//  Tickets
//
//  Created by guillermo chacon alcala on 09/09/22.
//

import SwiftUI
struct TipsView: View {
    @ObservedObject   private var model=ViewModel() // modelo de la vista principal
    @ObservedObject   private var modelPersonalInformation=ViewModelPersonal() // modelo de los datos personales
    @ObservedObject   private var modelPayment=ViewModelPayment() // modelo del information_payment

    //@ObservedObject private var model=ViewModel() se comenta para utilizar el modelo de PersonalInformation

    @State private var username: String = ""
    @Environment (\.managedObjectContext) var contextPersonal
 //   @FocusState private var emailFieldIsFocused:Bool

    //    @State var Total:Int
    //    @State var CantidadPersonas:String
    //    @State private var  stepper: Int = 0
    //    @State private var showingWelcome = false
    
    var body: some View {
        NavigationView{
            // FORMULARIO DE PAGO
            Form{
                Section(header: Text("User payments")){
                    TextField("Name", text: $modelPersonalInformation.name)
                        .textInputAutocapitalization(.characters)
                    Picker("Information Payment", selection: $modelPayment.information_payment) {
                    // MARK: - CAMPOS
                        TextField("Card Number", text: $modelPayment.card_number)
                            .textInputAutocapitalization(.characters)
                        
                        DatePicker("Expiration",
                                   selection: $modelPayment.expiration_date,
                                   displayedComponents: [.date])
                        SecureField("Security Code", text: $modelPayment.security_code)
                        //agregar teclado númerico
                        
                        Toggle("Automatic pay", isOn: $model.available)
                            .tint(.teal)
//                        Text(username)
//                            .foregroundColor(emailFieldIsFocused ? .red : .blue)

                    } //: PICKER
                    
                } //: SECTION
                Section(header: Text("Personal Settings")){
                    TextField("City", text: $modelPersonalInformation.city)
                    TextField("Postal Code", text: $modelPersonalInformation.postal_code)
                    TextField("Adress", text: $modelPersonalInformation.adress)
                    TextField("Phone", text: $modelPersonalInformation.phone)
                        .keyboardType(.numberPad)
                    
                }
                
                Button(action: {
                    
                }){
                    Text("Guardar")
                        .fontWeight(.light)
                        .frame(width:UIScreen.main.bounds.width-90)
                }
            } //: FORM
            
            // EJEMPLO UTILIZANDO EL TOGGLE CON DOS TEXT
            
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
