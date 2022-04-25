//
//  book.swift
//  wwdc playground
//
//  Created by Marina Cristina Marques dos santos on 24/04/22.
//

import SwiftUI

struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    var text: String
    init(text: String) {
        self.text = text
    }
    var body: some View {
        Text(text)
        .onTapGesture(perform: {
            dismiss()
        })
        .font(.title)
        .padding()
    }
    
}
