// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let car = try? JSONDecoder().decode(Car.self, from: jsonData)

import Foundation

// MARK: - Car
class Car: Codable {
    var count: Int?
    var message, searchCriteria: String?
    var results: [Result]

    enum CodingKeys: String, CodingKey {
        case count = "Count"
        case message = "Message"
        case searchCriteria = "SearchCriteria"
        case results = "Results"
    }

    init(count: Int?, message: String?, searchCriteria: String?, results: [Result]) {
        self.count = count
        self.message = message
        self.searchCriteria = searchCriteria
        self.results = results
    }
}

// MARK: - Result
class Result: Codable {
    var country: String? = nil
    var createdOn: String? = nil, dateAvailableToPublic: String? = nil
    var id: Int? = nil
    var name: String? = nil
    var updatedOn: String? = nil
    var vehicleType: String? = nil, wmi: String? = nil

    enum CodingKeys: String, CodingKey {
        case country = "Country"
        case createdOn = "CreatedOn"
        case dateAvailableToPublic = "DateAvailableToPublic"
        case id = "Id"
        case name = "Name"
        case updatedOn = "UpdatedOn"
        case vehicleType = "VehicleType"
        case wmi = "WMI"
    }

    init(country: String?, createdOn: String?, dateAvailableToPublic: String?, id: Int?, name: String?, updatedOn: String?, vehicleType: String?, wmi: String?) {
        self.country = country
        self.createdOn = createdOn
        self.dateAvailableToPublic = dateAvailableToPublic
        self.id = id
        self.name = name
        self.updatedOn = updatedOn
        self.vehicleType = vehicleType
        self.wmi = wmi
    }
}
