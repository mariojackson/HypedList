//
//  HypedEvent.swift
//  HypedList
//
//  Created by Mario Jackson on 17.03.21.
//

import Foundation
import SwiftUI

class HypedEvent: ObservableObject {
    var date = Date()
    var title = ""
    var url = ""
    var color = Color.yellow
    var imageData: Data?
}
