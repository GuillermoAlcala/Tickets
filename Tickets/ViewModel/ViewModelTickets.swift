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

    //MARK:- FUNCION PARA GUARDAR DATOS
    func saveData(context:NSManagedObjectContext){
        let newOrder=Item(context:context)
        newOrder.order_number=order_number
        newOrder.date=date
        newOrder.available=available
        newOrder.user=user
        newOrder.remarks=remarks
        //newOrder.phone=phone
        
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
    
    func deleteData(item:Item,context:NSManagedObjectContext){
        context.delete(item)
        do {
            
            try context.save()
            print("Datos eliminados correctamente")
        } catch let error as NSError {
            print("No se pudo eliminar datos", error.localizedDescription)
        }
        }
    }


