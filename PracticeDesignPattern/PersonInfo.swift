//
//  PersonInfo.swift
//  PracticeDesignPattern
//
//  Created by 임수현 on 2020/12/07.
//

import Foundation

// MARK: Model of MVC

class InfoManager {
    private var infos: [PersonInfo] = []
    
    func getInfos() -> [PersonInfo] {
        return self.infos
    }
    
    func addPersonInfo(name: String, age: Int) {
        let personInfo = PersonInfo(name: name, age: age)
        self.infos.append(personInfo)
    }
}

class PersonInfo {
    var name: String = ""
    var age: Int = 0
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
