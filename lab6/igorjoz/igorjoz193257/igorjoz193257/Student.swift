//
//  Student.swift
//  igorjoz193257
//
//  Created by student on 14/05/2024.
//

import Foundation

struct Student: Hashable, Codable, Identifiable {
    let id: Int
    let firstName: String
    let lastName: String
    let indexNumber: String
    let points: String
}

var students:[Student] = [Student(id: 0, firstName: "Igor", lastName: "Józefowicz", indexNumber: "193257", points: "95"),
                          Student(id: 1, firstName: "Karol", lastName: "Arnold", indexNumber: "123456", points: "20"),
                          Student(id: 2, firstName: "Artur", lastName: "Ars", indexNumber: "123456", points: "17"),
                          Student(id: 3, firstName: "Kazimierz", lastName: "Gołąb", indexNumber: "123456", points: "42"),]
