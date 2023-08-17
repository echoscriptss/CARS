//
//  CarsAPI.swift
//  CARS
//
//  Created by Yogesh on 8/16/23.
//

import Foundation
import SwiftUI

class APIManager: ObservableObject {
    @Published var result: Car?
    @Published var all: [Result] = []
    func getCarsList() async throws {
        if let url = URL(string: "https://vpic.nhtsa.dot.gov/api/vehicles/GetWMIsForManufacturer/987?format=json") {
            let urlrequest = URLRequest(url: url, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: .infinity)
            let (data, response) = try await URLSession.shared.data(for: urlrequest)            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { return }
            do {
                // Decode data to object
                let jsonDecoder = JSONDecoder()
                let cars = try jsonDecoder.decode(Car.self, from: data)
                 DispatchQueue.main.async { [weak self] in
//                    self?.result = cars
                     self?.all = cars.results
                }
            }
            catch {
            }
        }
    }
    
    func getData() async {
        do{
            try await getCarsList()
        } catch {
            print(error)
        }
    }
    
    func updateRecentData(updated: Result) {
        print(updated.wmi ?? "")
        print(updated.country ?? "")
        if let index = all.firstIndex(where: {$0.wmi == updated.wmi}){
            all[index].country = updated.country
        }
    }
}
extension Binding {
     func toUnwrapped<T>(defaultValue: T) -> Binding<T> where Value == Optional<T>  {
        Binding<T>(get: { self.wrappedValue ?? defaultValue }, set: { self.wrappedValue = $0 })
    }
}
