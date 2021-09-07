//
//  SatResults.swift
//  20210905-ArmandoHerrera-NYCSchools
//
//  Created by Armand on 05/09/21.
//

import SwiftUI

struct SatResults: View {
    var school: School
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            Text(school.school_name)
                .font(.headline)
            Text(school.dbn)
                .font(.footnote)
        }
    }
}


