//
//  CitiesView.swift
//  Mixity
//
//  Created by Mohammad Muksith on 3/27/23.
//

import SwiftUI
import MapKit

struct CitiesView: View {
    @State private var sheet: Events? = nil
    @State var events: [Events] = []
    @State private var searchData = String()
    var searchResults: [Events] {
        if searchData.isEmpty {
            return events
        } else {
            return events.filter {
                $0.title.localizedCaseInsensitiveContains(searchData)
            }
        }
    }
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 20) {
                    ForEach(searchResults) { item in
                        VStack {
                            Button{
                                sheet = item
                            }
                        label:{
                            VStack{
                                cell(header: item.title, text: item.venue.city, text2: item.venue.name, color: Color(""))
                            }
                        }
                        .sheet(item: $sheet, content:{sheet in
                            VStack{
                                
                                    Text(sheet.title)
                                        .font(.largeTitle)
                                        .padding()
                                        .foregroundColor(Color("Color 4"))
                                
                                    AsyncImage(url: sheet.imageUrl, scale: 0.9)
                                        .clipShape(Circle())
                                        .padding()
                               
                                Text(sheet.venue.name)
                                        .font(.title)
                                        .padding()
                                        .foregroundColor(Color("Color 4"))
                          
                                Text(sheet.venue.address)
                                    .foregroundColor(Color("Color 4"))
                             
                                       
                                    
                                
                                
                           
                                
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color("Color 2"))
                        })
                        
                            
                        .font(.headline)
                        .padding(.vertical, 80)
                        .padding(.horizontal, 20)
                        .foregroundColor(.black)
                        .background(AsyncImage(url: item.imageUrl, scale: 0.5))
                        .cornerRadius(10)
                            
                            
                        }
                        
                    }
                    
                }
                
                .padding()
                
            }
            .background(Color("Color 2"))
            
        }
        
        
        .searchable(text: $searchData)
        .tint(Color("Color"))
        .onAppear {
            EventsModel{ events in
                self.events = events
            }
        }
        
    }
}
func cell(header: String, text: String, text2: String, color: Color) -> some View {
       HStack {
           VStack(alignment: .leading) {
               Text(header)
                   .foregroundColor(Color(.white))
                   .font(.title)
                   .shadow(radius: 1)
                   
               Text(text)
                   .foregroundColor(Color(.white))
                   .font(.body)
                   .shadow(radius: 1)
               Text(text2)
                   .font(.body)
                   .foregroundColor(Color(.white))
                   .shadow(radius: 1)
                   
           }
           Spacer()
       }
       .frame(maxWidth: .infinity)
       
       .background(color)
       .cornerRadius(10)
       .padding(0.5)
}


struct CitiesView_Previews: PreviewProvider {
    static var previews: some View {
        CitiesView()
    }
}

