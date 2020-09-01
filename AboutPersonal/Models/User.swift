//
//  User.swift
//  AboutPersonal
//
//  Created by Fuhrer_SS on 30.08.2020.
//  Copyright © 2020 myself. All rights reserved.
//

struct User {
    var name: String
    var password: String
    
    static func getUserData() -> User {
        User(name: "User", password: "Password")
    }
}


