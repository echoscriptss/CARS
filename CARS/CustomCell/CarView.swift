//
//  CarView.swift
//  CARS
//
//  Created by Yogesh on 8/16/23.
//

import SwiftUI

struct CarView: View {
    var carData: Result
    
    var body: some View {
        VStack(alignment: .leading){
            Text(carData.country ?? "N/A")
            Text(carData.createdOn ?? "N/A")
            Text(carData.dateAvailableToPublic ?? "N/A")
            Text(carData.name ?? "N/A")
            Text(carData.updatedOn ?? "N/A")
            Text(carData.vehicleType ?? "N/A")
            Text(carData.wmi ?? "N/A")
        }
    }
}

//struct CarView_Previews: PreviewProvider {
//    static var previews: some View {
//        CarView()
//    }
//}
