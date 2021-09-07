//
//  ContentView.swift
//  20210905-ArmandoHerrera-NYCSchools
//
//  Created by Armand on 05/09/21.
//

import SwiftUI

struct ContentView: View {
    @State private var schoolData = [School]()
    
    var body: some View {
        NavigationView{
//            Create list after data load.
            List(schoolData, id: \.dbn) { item in
                NavigationLink(destination: SatResultsUIView(school: item)) {
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "building.2.fill")
                                .foregroundColor(.blue)
                                .imageScale(.large)
                            Text(item.school_name)
                                .font(.headline)
                        }

                        Text("Dbn: \(item.dbn)")
                            .font(.footnote)
                    }
                    
                }.navigationBarTitle("School List")
                
            }.onAppear(perform: loadData)} // When appear inmediatly go to loadData
    }
}

extension ContentView
{
    func loadData() {
        
        guard let url = URL(string: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json") else {
            return
        }
        
//        Prepare request to get data
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let data = data {
                if let response_obj = try? JSONDecoder().decode([School].self, from: data) {
                    
//                    Use of Async to get data from service
                    DispatchQueue.main.async {
                        self.schoolData = response_obj
                    }
                }
            }
            
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
