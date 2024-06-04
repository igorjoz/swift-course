//
//  ContentView.swift
//  igorjoz193257
//
//  Created by student on 14/05/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List(students) { student in
            StudentRow(student: student)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
