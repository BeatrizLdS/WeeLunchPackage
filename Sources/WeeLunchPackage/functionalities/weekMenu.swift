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
    
    var menuURL: URL
    {
        FileManipulation.generateURL(fileName: menuName, fileType: "txt")
    }
    
    init () {
        print("")
        print("  Digite o nome do cardápio: ", terminator: "")
        menuName = readLine()!
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
     
    func openMenu(){
        if (checkExistenceOfMenu()) {
            shell("open \(menuURL.path)")
        }else{
            showErrorMesage(erro: "Nenhum cardápio existente")
        }
    }
    
    func checkExistenceOfMenu () -> Bool{
        return FileManipulation.checkExistentFile(url: menuURL)
    }
    
    func creatMenu() {
        if (checkExistenceOfMenu()){
            FileManipulation.freeWriting(url: menuURL)
        }
        FileManipulation.writeTextFile(url: menuURL)
    }
    
    
    
}








