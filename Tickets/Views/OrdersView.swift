//
//  OrdersView.swift
//  Tickets
//
//  Created by guillermo chacon alcala on 09/09/22.
//

import SwiftUI
import SwiftUI
import CoreData

struct OrdersView: View {
    //@ObservedObject var model:ViewModel
    @StateObject var model=ViewModel()
    @Environment(\.managedObjectContext) var context
    //@State private var show=false
    @FetchRequest(entity:Item.entity(),
                  sortDescriptors: [NSSortDescriptor.init(key: "date",ascending:false)],
                  animation:.spring()) var results:FetchedResults<Item>
    @State private var isPresented=false
    
    var body: some View {
        NavigationView{
            //ScrollView{
            //    LazyVStack(alignment: .leading){
            List{
                ForEach(results){ item in
                    LazyVStack(alignment:.leading){
                        Text("Orden : \(item.order_number ??  "Sin datos")")
                        Text(item.user ?? "Usuario invalido")
                        Text(item.email ?? "Sin datos de correo")
                      
                        if item.available==true{
                            Text("Pedido disponible")
                        } else{
                            Text("Pedido no disponible")
                        }
                        
                        //Text(item.phone)
                        // si jala Text("\(item.phone) sin telefono")
                        Text(item.date ?? Date(), style:.date)
                        Text(item.date ?? Date().addingTimeInterval(100), style:.timer)
                        Text(item.remarks ?? "Sin notas adicionales")
                    }.contextMenu(ContextMenu(menuItems: {
                        
                        // MARK: - IMPLEMENTAR NOTIFICACION DE BORRADO CON ALERT
                        Button(role:.destructive,action:{
                            model.deleteData(item: item, context:context)
                            print("ok")
                        })
                        {Label(title: {Text("Delete")},
                               icon: {Image(systemName:"trash")})}.tint(.red)
                        
                        // MARK: - IMPLEMENTAR NOTIFICACION DE EDITAR CON ALERT

                        Button(role:.cancel,
                               action: {model.sendData(item: item)})
                        {
                            Label(title: {Text("Edit")},
                                  icon: {Image(systemName: "pencil")})
                        }.tint(.indigo)
                        
                    }))
                    // MARK: - SWIPE PARA EDITAR
                        .swipeActions(edge:.leading, allowsFullSwipe: true){
                            VStack{
                                Button(action: {model.sendData(item: item)},
                                       label: {Label("Edit",systemImage: "pencil")})
                                .tint(.blue)
                            }
                        }//swipe
                    
                }//ForeEach
            }//List
            //    }//Lazy
            //      }//ScroolView
            .navigationTitle("Orders")
            .toolbar{
                Button(action:{
                    model.updateItem=nil
                    model.email=""
                    model.remarks=""
                    model.user=""
                    model.available=Bool()
                    model.order_number=""
                    //  $model.phone=""
                    model.show.toggle()
                })
                {
                    Image(systemName:"plus.circle")
                        .foregroundColor(.red)
                }
                
            }.sheet(isPresented: $model.show, content: {CreateOrderView(model:model)})
            
            
        }
    }
}



/*
 1.-
 EL TOGGLE DEBERÁ ACTIVARSE COMO DISPONIBLE, MIENTRAS TANTO DEBE QUEDAR INACTIVO -> OK
 
 2.- EN LA PANTALLA PRINCIPAL DEBERÁ MOSTRARSE EL NÚMERO DE ORDEN Y EL TIMER CON UN TIEMPO LÍMITE (CUENTA REGRESIVA)
 
 3.- CUANDO SE ACABE EL TIEMPO EL TOGGLE PASARÁ A INACTIVO.
 
 -
 CRUD
 -
 */
struct OrdersView_Previews: PreviewProvider {
    static var previews: some View {
        OrdersView(model: ViewModel())
    }
}
