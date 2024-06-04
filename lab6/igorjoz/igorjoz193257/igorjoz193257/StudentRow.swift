//
//  StudentRow.swift
//  igorjoz193257
//
//  Created by student on 14/05/2024.
//

import SwiftUI

struct StudentRow: View {
    
    var student: Student
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(student.firstName) \(student.lastName)")
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .multilineTextAlignment(.leading)
                .foregroundColor(.black)
            HStack {
                Text("\(student.indexNumber)")
                    .font(.subheadline)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
                Spacer()
                
                Text("\(student.points)")
                    .font(.subheadline)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }
        }
        .padding()
    }
}

struct StudentRow_Previews: PreviewProvider {
    static var previews: some View {
        StudentRow(student: students[0])
    }
}
