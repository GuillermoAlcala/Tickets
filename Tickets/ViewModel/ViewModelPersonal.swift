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
    @Published var user_id=UUID()
    @Published var name=""
    @Published var postal_code=""
    @Published var adress=""
    @Published var city=""
    @Published var creation_date=Date()
    @Published var phone=""


func savePersonalData(contextPersonal: NSManagedObjectContext){
    let personal_information=Personal_Information(context: contextPersonal)
    personal_information.name=name
    personal_information.postal_code=postal_code
    personal_information.adress=adress
    personal_information.city=city
    personal_information.creation_date=creation_date
    personal_information.user_id=user_id
    personal_information.phone=phone

    do {
        try <#throwing expression#>
    } catch <#pattern#> {
        <#statements#>
    }
}
    
    
    func sendPersonalData(personal:NSManagedObjectContext){
        
        
    }
}
