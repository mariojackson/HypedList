//
//  FormLabelView.swift
//  HypedList
//
//  Created by Mario Jackson on 17.03.21.
//

import SwiftUI

struct FormLabelView: View {
    var text: String
    var iconSystemName: String
    
    
    var body: some View {
        Label {
            Text(text)
        } icon: {
            Image(systemName: iconSystemName)
                .padding(5)
                .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                .foregroundColor(.black)
        }
    }
}

struct FormLabelView_Previews: PreviewProvider {
    static var previews: some View {
        FormLabelView(text: "Title", iconSystemName: "keyboard")
    }
}
