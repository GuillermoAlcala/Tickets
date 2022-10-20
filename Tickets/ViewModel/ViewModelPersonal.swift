//
//  ViewModelPersonalInformation.swift
//  Tickets
//
//  Created by guillermo chacon alcala on 03/10/22.
//

import Foundation
import CoreData
import Combine
import SwiftUI

class ViewModelPersonal: ObservableObject {
    //@Published var user_id=UUID()
    //@Published var id=UUID()
    @Published var name=""
    @Published var postal_code=""
    @Published var adress=""
    @Published var city=""
    @Published var creation_date=Date()
    @Published var phone=""
    @Published var show=false
    @Published var updateItem:Personal_Information!
    
    //MARK: - FUNCION PARA GUARDAR DATOS PERSONALES
    
    func savePersonalData(contextPersonal: NSManagedObjectContext){ // se agrega la entindad Item para relacionarla
        let personal_information=Personal_Information(context: contextPersonal)
        
        //personal_information.id=UUID()
        personal_information.name=name
        personal_information.postal_code=postal_code
        personal_information.adress=adress
        personal_information.city=city
        personal_information.creation_date=creation_date
        //personal_information.user_id=user_id
        personal_information.phone=phone
        // personal_information.id=item.id // relación entre la entidad personal_information e Item
        
        //     item.mutableSetValue(forKey: "relationToPersonal").add(personal_information)
        
        do {
            try contextPersonal.save()
            personal_information.name=""
            personal_information.phone=""
            personal_information.adress=""
            personal_information.postal_code=""
            personal_information.city=""
            personal_information.creation_date=Date()
            show.toggle()
            
        } catch let error as NSError {
            print("Error al guardar datos", error.localizedDescription)
        }
    }
    
    //MARK: - FUNCION PARA ENVIAR DATOS PERSONALES
    func sendPersonalInformation(p_SendPersonsalInformation:Personal_Information){
        updateItem =     p_SendPersonsalInformation
        name =           p_SendPersonsalInformation.name!
        phone =          p_SendPersonsalInformation.phone!
        adress =         p_SendPersonsalInformation.adress!
        postal_code =    p_SendPersonsalInformation.postal_code!
        city =           p_SendPersonsalInformation.city!
        creation_date =  p_SendPersonsalInformation.creation_date!
        show.toggle()
    }
    
    //MARK: - FUNCION PARA ELIMINAR DATOS PERSONALES
    func deletePersonalData(personal: Personal_Information, personal_context:NSManagedObjectContext){
        personal_context.delete(personal)
        
        do {
            try
            personal_context.save()
        } catch let error as NSError {
            print("Error al eliminar", error.localizedDescription)
        }
        
    }
    //MARK: - FUNCION PARA EDITAR DATOS PERSONALES
    
    func editPersonal_information(contextPersonal:NSManagedObjectContext){
        updateItem.name
        updateItem.phone
        updateItem.adress
        updateItem.postal_code
        updateItem.city
        updateItem.creation_date
        
        do {
            try
            contextPersonal.save()
            name=""
            phone=""
            adress=""
            postal_code=""
            city=""
            creation_date=Date()
            print("Data editados correctamente")
            show.toggle()
        } catch let error as NSError {
            print("No fue posible editar", error.localizedDescription)

        }
    }
}
