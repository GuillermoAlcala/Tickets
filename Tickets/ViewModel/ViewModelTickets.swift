//
//  ViewModelTickets.swift
//  Tickets
//
//  Created by guillermo chacon alcala on 14/09/22.
//

import Foundation
import CoreData
import SwiftUI
import Combine

class ViewModel: ObservableObject{ // tiene tres protocolos: ObservedObject, StateObject, EnvironmentObject
    @Published  var order_number=""
    @Published var date=Date()
    @Published var available=false
    @Published var user=""
    @Published var remarks=""
    @Published var email=""
    //@Published var phone=""
    @Published var updateItem:Item!  // nombre de la entidad
    @Published var show=false       // para manejar el toggle
    
    // @Published para que las variables se reflejen en las vistas

    //MARK: - FUNCION PARA GUARDAR DATOS
    func saveData(context:NSManagedObjectContext){
        let newOrder=Item(context:context)
        newOrder.order_number=order_number
        newOrder.date=date
        newOrder.available=available
        newOrder.user=user
        newOrder.remarks=remarks
        //newOrder.phone = Int16(phone) ?? 0
        
        
        do {
            try
            context.save()
            print("Datos guardados")
            order_number=""
            date=Date()
            available=false
            user=""
            remarks=""
            email=""
            //phone=""
            show.toggle()

        } catch let error as NSError {
            print("Error al guarda datos", error.localizedDescription)
        }
    }
    // MARK: -- FUNCION PARA ELIMINAR LOS DATOS DEL LIST

    func deleteData(item:Item,context:NSManagedObjectContext){
        context.delete(item)
        do {
            
            try context.save()
            print("Datos eliminados correctamente")
        } catch let error as NSError {
            print("No se pudo eliminar datos", error.localizedDescription)
        }
        }
    
    // MARK: -- FUNCION PARA ENVIAR LOS DATOS HACÍA EL FORMULARIO
    func sendData(item:Item){
        updateItem=item
        remarks=item.remarks!
        //phone=String(item.phone)
        available=item.available
        user=item.user!
        order_number=item.order_number!
        date=item.date ?? Date()
        email=item.email ?? "Sin datos"
        show.toggle()
    }
    // MARK: -- FUNCION PARA EDITAR LOS DATOS DENTRO DEL FORMULARIO
    func editData(context:NSManagedObjectContext){
        updateItem.remarks=remarks
        //updateItem.phone=(Int16(phone)?
        updateItem.available=available
        updateItem.user=user
        updateItem.order_number=order_number
        updateItem.email=email
        updateItem.date=date

        
        do {
            try context.save()
            remarks=""
            //phone=""
            available=Bool()
            user=""
            order_number=""
            email=""
            date=Date()
            show.toggle()
            print("Data editados correctamente")
        } catch let error as NSError {
            print("No fue posible editar", error.localizedDescription)
        }

    }
    }


