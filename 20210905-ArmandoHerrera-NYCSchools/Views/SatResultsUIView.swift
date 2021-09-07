//
//  SatResultsUIView.swift
//  20210905-ArmandoHerrera-NYCSchools
//
//  Created by Armand on 05/09/21.
//

import SwiftUI

struct SatResultsUIView: View {
    var school: School

    @State private var satResults = [SatResultsStruct]()

    var body: some View {
            // Create a Dynamic list.

        Text("Detail Information.")
            .font(.headline)
            .padding(10)
        Text("Press to show detail information.")
            .font(.footnote)
            .foregroundColor(.blue)

        Form {
            List(satResults, id: \.dbn) { item in
                VStack(alignment: .leading) {
                    // Create one section.
                    Section  {
                        // Options to hide and show data.
                        DisclosureGroup(item.school_name) {
                            // Create Stack to every element in order to give a better presentation 
                            HStack {
                                Image(systemName: "number.circle")
                                    .foregroundColor(.red)
                                    .imageScale(.large)
                                Text("# Test Takers: ")
                                Text(item.num_of_sat_test_takers)
                                    .bold()
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                            }.padding(3)
                            HStack {
                                Image(systemName: "book.circle")
                                    .foregroundColor(.green)
                                    .imageScale(.large)
                                Text("Reading Avg Score: ")
                                Text(item.sat_critical_reading_avg_score)
                                    .bold()
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                            }.padding(3)
                            HStack {
                                Image(systemName: "plusminus.circle")
                                    .foregroundColor(.blue)
                                    .imageScale(.large)
                                Text("Math Avg Score: ")
                                Text(item.sat_math_avg_score)
                                    .bold()
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                            }.padding(3)
                            HStack {
                                Image(systemName: "pencil.circle")
                                    .foregroundColor(.purple)
                                    .imageScale(.large)
                                Text("Writing Avg Score: ")
                                Text(item.sat_writing_avg_score)
                                    .bold()
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                            }.padding(3)

                        }
                    }
                }
            }
        }.onAppear(perform: loadData)
            
    }
}

extension SatResultsUIView
{
    func loadData() {
//        Create the URL with the parm "dbn" of the school.
        let myURL = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json?"
        let myURLParm = myURL + "dbn=" + school.dbn
        guard let url = URL(string: myURLParm) else {
            return
        }
        
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            // Get Data from request.
            if let data = data {
                if let response_obj = try? JSONDecoder().decode([SatResultsStruct].self, from: data) {
                    
                    DispatchQueue.main.asyncAfter(deadline: .now()) {
                        self.satResults = response_obj
                    }
                }
            }
            
        }.resume()
    }
}

