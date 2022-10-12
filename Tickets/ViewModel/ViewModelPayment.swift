//
//  ViewModelPayment.swift
//  Tickets
//
//  Created by guillermo chacon alcala on 08/10/22.
//

import Foundation
import Combine
import CoreData


class ViewModelPayment:ObservableObject{
    @Published var idPayment=UUID()
    @Published var user_id=UUID()
    @Published var card_number=""
    @Published var security_code=""
    @Published var expiration_date=Date()
    @Published var creation_date=Date()
    @Published var information_payment=""

    func savePaymentData(){
        
    }

}


