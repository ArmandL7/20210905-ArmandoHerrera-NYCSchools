//
//  SchoolStruct.swift
//  20210905-ArmandoHerrera-NYCSchools
//
//  Created by Armand on 05/09/21.
//

// Create Struct like the Service in: https://data.cityofnewyork.us/resource/s3k6-pzi2.json

import Foundation

struct School: Decodable {
    var school_name: String
    var dbn:String
}
