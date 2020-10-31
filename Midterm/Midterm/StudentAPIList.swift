//
//  StudentAPIList.swift
//  Midterm
//
//  Created by Charan Ramachandran on 4/2/20.
//  Copyright © 2020 Charan. All rights reserved.
//

import Foundation

//{"0":"emuel",
//    "stu_name":"emuel",
//    "1":"aldridge",
//    "last_name":"aldridge",
//    "2":"emuel.com",
//    "domain":"emuel.com",
//    "3":"9:05",
//    "section":"9:05",
//    "4":"I am the teacher ",
//    "fact":"I am the teacher ",
//    "5":"1",
//    "counter":"1"}

struct StudentAPIList : Decodable {
    var results: [StudentListEntry]
}

struct StudentListEntry : Decodable {
    var stu_name: String
    var last_name: String
    var domain: String
    var fact: String
}
