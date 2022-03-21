//
//  File.swift
//  
//
//  Created by Beatriz Leonel da Silva on 17/03/22.
//

import Foundation

class Menu {
    
    var menuName : String = ""
    
    var carbohydrateList : [String] = []
    var animalProteinList : [String] = []
    var vegetalProteinList : [String] = []
    var vegetableList : [String] = []
    var fruitList : [String] = []
    
    init () {
        print("")
        print("  Digite o nome do cardápio: ", terminator: "")
        menuName = readLine()!
    }
    
    var menuURL: URL
    {
        let documentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileURL = documentDirURL.appendingPathComponent(menuName.lowercased()).appendingPathExtension("txt")
        
        return fileURL
    }
    
    func addFood(foodList: [String]) -> [String]{
        let food = getFoodName()
        var returnList = foodList
        
        if ( checkIfItAlreadyExistsInTheList(evaluatedObject: food, list: foodList) ) {
            showErrorMesage(erro: "Alimento já existe")
        }
        else {
            returnList.append(food)
        }
        
        return returnList
    }
    
    func checkIfItAlreadyExistsInTheList(evaluatedObject: String, list: [String]) -> Bool{
        
        var control = false
        var index = 0
        
        while (control == false && index < list.count){
            if(list[index].uppercased() == evaluatedObject.uppercased()) {
                control = true
            }
            index += 1
        }
        
        return control
    }
    
    func getFoodName () -> String{
        print("\n  Nome do alimento: ", terminator: "")
        let food = readLine()
        return food!
    }
    
    func writeTextFile () {
        let writeString = "Essa é a String que vai ser escrita no documento!"
        
        do {
            try writeString.write(to: menuURL, atomically: true, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            print("Não foi possível escrever no arquivo! Tente novamente.")
            print(error)
        }
        blockWriting()
    }
     
    func openMenu(){
        if (checkExistenceOfMenu()) {
            shell("open \(menuURL.path)")
        }else{
            showErrorMesage(erro: "Nenhum cardápio existente")
        }
    }
    
    func checkExistenceOfMenu () -> Bool{
        var existence = true
        
        if (!FileManager.default.fileExists(atPath:"/Users/beatrizleoneldasilva/Documents/Menu.txt") ) {
            existence = false
        }
        
        return existence
    }
    
    func creatMenu() {
        if (checkExistenceOfMenu()){
            freeWriting()
            writeTextFile()
        }
        else {
            writeTextFile()
        }
    }
    
    func freeWriting() {
        do{
            try FileManager.default.setAttributes([FileAttributeKey.immutable : false], ofItemAtPath: menuURL.path)
        }
        catch{
            showErrorMesage(erro: "Cardápio não desbloqueado")
        }
    }
    
    func blockWriting() {
        do{
            try FileManager.default.setAttributes([FileAttributeKey.immutable : true], ofItemAtPath: menuURL.path)
        }
        catch{
            showErrorMesage(erro: "Cardápio não bloqueado")
        }
    }
    
}








