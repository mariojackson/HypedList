//
//  CreateHypedEventView.swift
//  HypedList
//
//  Created by Mario Jackson on 17.03.21.
//

import SwiftUI

struct CreateHypedEventView: View {
    @StateObject var hypedEvent = HypedEvent();
    @State var showTime = false
    @State var showImagePicker = false
    
    var body: some View {
        Form {
            Section {
                TextField("Family Vacation", text: $hypedEvent.title)
                    .autocapitalization(.words)
            }
            
            Section {
                FormLabelView(text: "Event Date", iconSystemName: "calendar")
                
                DatePicker(
                    "Date",
                    selection: $hypedEvent.date,
                    displayedComponents: showTime ? [.date, .hourAndMinute] : [.date]
                )
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                Toggle(isOn: $showTime) {
                    FormLabelView(text: "Time", iconSystemName: "clock.fill")
                }
            }
            
            Section {
                if hypedEvent.image() == nil {
                    Button(action: {
                        showImagePicker = true
                    }) {
                        FormLabelView(text: "Pick an Image", iconSystemName: "photo.fill")
                    }
                } else {
                    Button(action: {
                        hypedEvent.imageData = nil
                    }) {
                        Text("Remove Image").foregroundColor(.red)
                    }.buttonStyle(BorderlessButtonStyle())
                    
                    Button(action: {
                        showImagePicker = true
                    }) {
                        hypedEvent.image()!
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    .buttonStyle(BorderlessButtonStyle())
                }
            }.sheet(isPresented: $showImagePicker) {
                ImagePicker(imageData: $hypedEvent.imageData)
            }
            
            Section {
                ColorPicker(selection: $hypedEvent.color) {
                    FormLabelView(text: "Color", iconSystemName: "eyedropper.halffull")
                }
            }
            
            Section {
                TextField("example.com", text: $hypedEvent.url)
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
