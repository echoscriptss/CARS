//
//  CarDetail.swift
//  CARS
//
//  Created by Yogesh on 8/16/23.
//

import SwiftUI

struct CarDetail: View {
    @ObservedObject var objCar: APIManager
    @Binding var selectedData: Result
    @Binding var fetchData: Bool
    @Binding var presentView: Bool
    @Binding var reloadList: Bool
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            List {
                VStack(alignment: .leading){
                    HStack{
                        Text("Created On: \(String(describing: selectedData.createdOn ?? ""))")
                            .font(.footnote)
                        Spacer()
                        Text("Date available to public: \(String(describing: selectedData.dateAvailableToPublic ?? ""))")
                            .font(.footnote)
                    }
                    Text(selectedData.country ?? "Country")
                    TextEditor(text: $selectedData.country.toUnwrapped(defaultValue: ""))
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("Name: \(String(describing: selectedData.dateAvailableToPublic ?? ""))")
                        Text("Vehicle Type: \(String(describing: selectedData.vehicleType ?? ""))")
                        Text("WMI: \(String(describing: selectedData.wmi ?? ""))")
                    }
                    Button("Update") {
                        print(selectedData.country ?? "")
                        if objCar.updateRecentData(updated: selectedData) {
                            reloadList = true
                            fetchData = false
//                            presentView = false
                            dismiss()

                        }
                    }.foregroundColor(.white)
                        .buttonStyle(.borderedProminent)
                }
            }
            .listStyle(.sidebar)
        }
        .navigationTitle("Details")
    }
}


struct CarDetail_Previews: PreviewProvider {
    static var previews: some View {
        CarDetail(objCar: APIManager(), selectedData: .constant(Result(country: "", createdOn: "", dateAvailableToPublic: "", id: 0, name: "", updatedOn: "", vehicleType: "", wmi: "")), fetchData: .constant(true), presentView: .constant(false), reloadList: .constant(false))
    }
}
