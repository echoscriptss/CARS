//
//  ContentView.swift
//  CARS
//
//  Created by Yogesh on 8/16/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var objAllTasks: APIManager = APIManager()
    @State private var selectedCell: Result = Result(country: "", createdOn: "", dateAvailableToPublic: "", id: 0, name: "", updatedOn: "", vehicleType: "", wmi: "")
    @State var FetchDataAgain: Bool = true
    @State var presentView: Bool = false

    var body: some View {
        NavigationView{
            List{
                ForEach(objAllTasks.result?.results ?? [], id: \.wmi) { dataResult in
                    ZStack(alignment: .leading) {
                        Button(action: {
                            selectedCell = dataResult
                            presentView = true
                        }) {
                            CarView(carData: dataResult)
                        }
                        //.background(link(selectedCellData: $selectedCell))
                    }
                }
            }
            .listStyle(.plain)
            .padding()
            .task {
                if FetchDataAgain{
                    await objAllTasks.getData()
                }
            }
            .navigationTitle("All Vehicles")
        }
        .sheet(isPresented: $presentView) {
            CarDetail(objCar: objAllTasks, selectedData: $selectedCell, fetchData: $FetchDataAgain)

        }
    }
    func link(selectedCellData: Binding<Result>) -> some View {
        NavigationLink {
            CarDetail(objCar: objAllTasks, selectedData: $selectedCell, fetchData: $FetchDataAgain)
        } label: {
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
