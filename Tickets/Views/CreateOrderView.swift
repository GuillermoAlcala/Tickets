//
//  CreateOrderView.swift
//  Tickets
//
//  Created by guillermo chacon alcala on 09/09/22.
//

import SwiftUI
struct CreateOrderView: View {
    @Environment(\.managedObjectContext) var context
    @Environment(\.presentationMode) var back
    @ObservedObject var model=ViewModel()
//    @State private var remarks="Remarks: "
//    @State private var name=""
//    @State private var phone=""
//    @State private var email=""
//    @State var togglEstatus=false
//    @State var orderNumber = ""
//    @State var date=Date()
    var body: some View{
        NavigationView {
            VStack{
            //MARK: - FORM
            Form{
                Section(header: Text("Seetings")){
                    TextField("Order Number", text:$model.order_number)
                        .keyboardType(.numberPad)
                    TextField("User", text: $model.user)
//                    TextField("Phone", text: $model.phone)
//                        .keyboardType(.numberPad)
                    TextField("Email", text: $model.email)
                        .keyboardType(.emailAddress)
                        .textContentType(.emailAddress)
                        .submitLabel(.done)
                        .disableAutocorrection(true)
                        .foregroundColor(.red)
                    Toggle("Available", isOn: $model.available)
                        .tint(.teal)
                        .toggleStyle(.switch)
                }
                
                //MARK: - SECCIÓN DE NOTAS
                Section(header: Text("Remarks")){
                    TextEditor(text:$model.remarks)
                        .keyboardType(.alphabet)
                    DatePicker("Fecha",selection: $model.date)
                        .datePickerStyle(.automatic)
                }
                //MARK: -BOTON DE GUARDAR
                Button(action:{
                    //llamo al modelo y la función de guardar datos y le paso
                    //como parámetro el contexto

                    //Si el form tiene contenido -> Editar, en caso contrario: Guardar
                    if model.updateItem != nil{
                        model.editData(context: context)
                    }else{
                        model.saveData(context: context)
                    }
                        
                })
                {
                    Label(
                        title: {Text("Guardar").foregroundColor(.teal)},
                       icon: {Image(systemName: "signature").foregroundColor(.teal)}
                    )
                }
                //.frame(alignment: .center)
                .frame(width:UIScreen.main.bounds.width-90)
                //.background(.red)
                //.disabled(model.nota == ""    ? true : false)
                //.cornerRadius(10)
            } //: FORM
            
            
            //MARK: - NAVIGATION TITLE
            
            .navigationTitle("Create Orders")
//            //MARK: - TOOLBAR
                .toolbar{
                    Button(action: {
                        back.wrappedValue.dismiss()
                    }){
                        NavigationLink(destination: OrdersView(model: model)){}
                            Image(systemName:"xmark")
                            .foregroundColor(.red)
                    }
                }//toolbar
                
        }//NavigationView
    }
}





//            Form {
//                Section(header: Text("Alta de pedidos")) {
//
//                    Picker("Notify Me About", selection: $notifyMeAbout) {
//                        TextField("Holap",text: $directMessages)
//                        TextField("Ingrese el pedido en el picker", text: $pedido)
//                        //                     //       Text("Mentions").tag(NotifyMeAboutType.mentions)
//                        //                     //       Text("Anything").tag(NotifyMeAboutType.anything)
//                    }
//                    DatePicker("Ingresar fecha",selection:$fecha).datePickerStyle(.wheel)
//                    Toggle("Empandas", isOn: $playNotificationSounds).toggleStyle(.automatic)
//                    TextField("Ingrese el pedido", text: $pedido)
//                    Toggle("Lentejas", isOn: $doesClose)
//                        .toggleStyle(.switch)
//                    //                        Toggle("Send read receipts", isOn: $sendReadReceipts)
//                    Stepper("Cantidad \(stepper)", value: $stepper)
//
//                }
//                Section(header: Text("User Profiles")) {
//                    //                        Picker("Profile Image Size", selection: $profileImageSize) {
//                    //                            Text("Large").tag(ProfileImageSize.large)
//                    //                            Text("Medium").tag(ProfileImageSize.medium)
//                    //                            Text("Small").tag(ProfileImageSize.small)
//                    //                        }
//                    Button("Clear Image Cache") {}
//                }
//            }
//    @State var playNotificationSounds=false
//    @State var doesClose=false
//    //    @State var sendReadReceipts=false
//    @State var pedido:String="Alta"
//    @State var notifyMeAbout:String
//    //    @State var profileImageSize:String
//    @State var NotifyMeAboutType:String
//    @State var directMessages=""
//    @State var fecha = Date()
//    @State  private var stepper: Int = 0
//    @State private var isPresented=false



struct CreateOrderView_Previews: PreviewProvider {
    static var previews: some View {
        CreateOrderView(model: ViewModel())
    }
}
}
