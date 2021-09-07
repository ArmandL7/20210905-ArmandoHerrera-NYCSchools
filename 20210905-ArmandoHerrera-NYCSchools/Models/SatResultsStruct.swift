//
//  SatResultsStruct.swift
//  20210905-ArmandoHerrera-NYCSchools
//
//  Created by Armand on 05/09/21.
//

// Get Struct for data: // Example: https://data.cityofnewyork.us/resource/f9bf-2cp4.json
// Example: https://data.cityofnewyork.us/resource/f9bf-2cp4.json?dbn=21K728
// [{"dbn":"21K728","school_name":"LIBERATION DIPLOMA PLUS","num_of_sat_test_takers":"10","sat_critical_reading_avg_score":"411","sat_math_avg_score":"369","sat_writing_avg_score":"373"}]


import Foundation

struct SatResultsStruct: Decodable {
    var school_name: String
    var dbn:String
    var num_of_sat_test_takers : String
    var sat_critical_reading_avg_score : String
    var sat_math_avg_score : String
    var sat_writing_avg_score : String
}


