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
    var newValue: Result = Result(country: "", createdOn: "", dateAvailableToPublic: "", id: 0, name: "", updatedOn: "", vehicleType: "", wmi: "")
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
                    TextField(selectedData.country ?? "N/A", value: $selectedData.country, formatter: NumberFormatter())
                        .textFieldStyle(.roundedBorder)
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("Name: \(String(describing: selectedData.dateAvailableToPublic ?? ""))")
                        Text("Vehicle Type: \(String(describing: selectedData.vehicleType ?? ""))")
                        Text("WMI: \(String(describing: selectedData.wmi ?? ""))")
                    }
                    Button("Update") {
                        print(selectedData.country ?? "")
                        objCar.updateRecentData(updated: selectedData)
                        fetchData = false
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
        CarDetail(objCar: APIManager(), selectedData: .constant(Result(country: "", createdOn: "", dateAvailableToPublic: "", id: 0, name: "", updatedOn: "", vehicleType: "", wmi: "")), fetchData: .constant(true))
    }
}
