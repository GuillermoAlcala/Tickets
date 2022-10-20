//
//  PersonalView.swift
//  Tickets
//
//  Created by guillermo chacon alcala on 16/10/22.
//

import SwiftUI
struct PersonalView: View {
    @StateObject var model=ViewModelPersonal()
    @Environment(\.managedObjectContext) var ContextPersonal

    @FetchRequest(entity:Personal_Information.entity(),
                  sortDescriptors: [NSSortDescriptor.init(key: "creation_date",ascending:false)],
                  animation:.spring()) var Personalresults:FetchedResults<Personal_Information>
    var body: some View {
        NavigationView{
            List{
                ForEach(Personalresults){ personal_list in
                    LazyVStack(alignment:.leading){
                        Text("Name: \(personal_list.name!)")
                        Text("Phone: \(personal_list.phone!)")
                        Text("Adress: \(personal_list.adress!)")
                        Text("City: \(personal_list.city!)")
                        Text("Postal Code: \(personal_list.postal_code!)")
                        
                        // MARK: ELIMINAR REGISTRO
                    }.swipeActions(edge: .trailing, allowsFullSwipe: true, content: {
                        Button(role: .destructive,
                               action: {model.deletePersonalData(personal: personal_list, personal_context: ContextPersonal)},
                               label: {Label("Delete",systemImage: "trash")}
                        )
                    })
                    // MARK:
                }
            }
            //.contextMenu(menuItems: {
            //})
            
            .toolbar{
                Button(action: {
                    model.show.toggle()
                },
                       label: {Image(systemName:"plus.circle")})
                .tint(.red)
                
            }.sheet(isPresented: $model.show, content: {
                TipsView(modelPersonalInformation:model)
            })
            .navigationTitle("Personal")
        }//Navigation Title
    }
}
struct PersonalView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalView()
    }
}
