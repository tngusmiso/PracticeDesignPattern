//
//  PersonInfo.swift
//  PracticeDesignPattern
//
//  Created by 임수현 on 2020/12/07.
//

import Foundation

// MARK: Model of MVC

protocol InfoManagerDelegate {
    func updatedInfos()
}

class InfoManager {
    var delegate: InfoManagerDelegate?
    private var infos = [PersonInfo]() {
        didSet {
            delegate?.updatedInfos()
        }
    }
    
    func getInfos() -> [PersonInfo] {
        return self.infos
    }
    
    func addPersonInfo(name: String, age: Int) {
        let personInfo = PersonInfo(name: name, age: age)
        self.infos.append(personInfo)
    }
}

struct PersonInfo {
    var name: String
    var age: Int
}
