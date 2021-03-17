//
//  CreateHypedEventView.swift
//  HypedList
//
//  Created by Mario Jackson on 17.03.21.
//

import SwiftUI

struct CreateHypedEventView: View {
    @StateObject var hypedEvent = HypedEvent();

    var body: some View {
        Form {
            Section {
                TextField("Family Vacation", text: $hypedEvent.title)
                    .autocapitalization(.words)
            }
            
            Section {
                DatePicker("Date", selection: $hypedEvent.date, displayedComponents: [.date, .hourAndMinute])
                    .datePickerStyle(GraphicalDatePickerStyle())
            }
            
            Section {
                ColorPicker("Color", selection: $hypedEvent.color)
            }
            
            Section {
                TextField("https://example.com", text: $hypedEvent.url)
                    .keyboardType(.URL)
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

struct CreateHypedEventView_Previews: PreviewProvider {
    static var previews: some View {
        CreateHypedEventView()
    }
}
