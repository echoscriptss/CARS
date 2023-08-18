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
    @State var reloadList: Bool = false
    
    var body: some View {
        NavigationView{
            List{
                ForEach(objAllTasks.result?.results ?? [], id: \.wmi) { dataResult in
                    ZStack(alignment: .leading) {
                        CarView(carData: dataResult)
                        Button(action: {
                            selectedCell = dataResult
                            presentView = true
                        }) {
                        }
                        NavigationLink {
                            CarDetail(objCar: objAllTasks, selectedData: $selectedCell, fetchData: $FetchDataAgain, presentView: $presentView, reloadList: $reloadList)
                        } label: {
                        }
                    }
                }
            }
            .listStyle(.plain)
            .padding()
            .task {
                print(selectedCell)
                print(selectedCell.country ?? "")
                if FetchDataAgain{
                    await objAllTasks.getData()
                }
            }
            .navigationTitle("All Vehicles")
        }
        .navigationViewStyle(.stack)
    }
    
    func link(selectedCellData: Binding<Result>, data: Result) -> some View {
        NavigationLink {
            CarDetail(objCar: objAllTasks, selectedData: $selectedCell, fetchData: $FetchDataAgain, presentView: $presentView, reloadList: $reloadList)
        } label: {
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
