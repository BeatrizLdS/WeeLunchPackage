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
        
        if ( checkIfItAlreadyExistsInTheList(evaluatedObject: food, list: foodList) >= 0) {
            showErrorMesage(erro: "Alimento já existe")
        }
        else {
            returnList.append(food)
            showSuccessMessage(successAtivitie: "Adição")
        }
        
        return returnList
    }
    
    func removeFood (foodType: Int) {
        let foodName = getFoodName()
        var foodIndex = -1
        
        if (foodType == 1){
            foodIndex = checkIfItAlreadyExistsInTheList(evaluatedObject: foodName, list: carbohydrateList)
            if (foodIndex >= 0){
                carbohydrateList.remove(at: foodIndex)
            }
        } else if (foodType == 2){
            foodIndex = checkIfItAlreadyExistsInTheList(evaluatedObject: foodName, list: animalProteinList)
            if (foodIndex >= 0){
                animalProteinList.remove(at: foodIndex)
            }
        } else if (foodType == 3){
            foodIndex = checkIfItAlreadyExistsInTheList(evaluatedObject: foodName, list: vegetalProteinList)
            if (foodIndex >= 0){
                vegetalProteinList.remove(at: foodIndex)
            }
        } else if (foodType == 4){
            foodIndex = checkIfItAlreadyExistsInTheList(evaluatedObject: foodName, list: vegetableList)
            if (foodIndex >= 0){
                vegetableList.remove(at: foodIndex)
            }
        } else {
            foodIndex = checkIfItAlreadyExistsInTheList(evaluatedObject: foodName, list: fruitList)
            if (foodIndex >= 0){
                fruitList.remove(at: foodIndex)
            }
        }
        
        if (foodIndex < 0){
            showErrorMesage(erro: "Alimento não existe")
        } else {
            showSuccessMessage(successAtivitie: "Remoção")
        }
        
    }
    
    func checkIfItAlreadyExistsInTheList(evaluatedObject: String, list: [String]) -> Int{
        
        var control = -1
        var index = 0
        
        while (control == -1 && index < list.count){
            if(list[index].uppercased() == evaluatedObject.uppercased()) {
                control = index
            }
            index += 1
        }
        
        return control
    }
    
    func listAvailabeFoods(){
        showList(list: carbohydrateList, listType: "Carboidratos")
        showList(list: animalProteinList, listType: "Proteínas Animais")
        showList(list: vegetalProteinList, listType: "Proteínas Vegetais")
        showList(list: vegetableList, listType: "Verduras e Legumes")
        showList(list: fruitList, listType: "Frutas")
    }
    
    func showList(list: [String], listType: String) {
        if(list.isEmpty == false){
            let body = """
            
              \(listType):
                
            """
            print(body, terminator: "")
            for i in stride(from: 0, to: (list.count - 1), by: 1){
                print(list[i], terminator: ", ")
            }
            print(list[list.count - 1], terminator: ".\n")
        }
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








