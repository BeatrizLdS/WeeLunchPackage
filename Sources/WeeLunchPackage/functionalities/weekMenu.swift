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
    
    let weekdays = ["Segunda", "Terça", "Quarta", "Quinta", "Sexta", "Sábado", "Domingo"]
    
    var menuURL: URL
    {
        FileManipulation.generateURL(fileName: menuName, fileType: "txt")
    }
    
    init () {
        print("\n  Digite o nome do cardápio: ", terminator: "")
        menuName = readLine()!
    }
    
    //add available foods of week
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
    
    func getFoodName () -> String{
        print("\n  Nome do alimento: ", terminator: "")
        let food = readLine()
        return food!
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
    
    //functions to show all existing available foods
    func listAvailabeFoods(){
        showList(list: carbohydrateList, listType: "Carboidratos")
        showList(list: animalProteinList, listType: "Proteínas Animais")
        showList(list: vegetalProteinList, listType: "Proteínas Vegetais")
        showList(list: vegetableList, listType: "Verduras e Legumes")
        showList(list: fruitList, listType: "Frutas")
    }
    
    func showList(list: [String], listType: String) {
        if(list.isEmpty == false){
            print("\n  \(listType):")
            for i in stride(from: 0, to: (list.count - 1), by: 1){
                print("   ", list[i], ",", separator: "")
            }
            print("  ", list[list.count - 1], terminator: ".\n")
        }
    }

    //functions to remove food from list of available foods
    func removeFood (foodType: String) {
        let foodName = getFoodName()
        switch foodType{
        case "carbohydrate":
            carbohydrateList = removeFoodFrom(foodName: foodName, foodList: carbohydrateList)
        case "animalProtein":
            animalProteinList = removeFoodFrom(foodName: foodName, foodList: animalProteinList)
        case "vegetalProtein":
            vegetalProteinList = removeFoodFrom(foodName: foodName, foodList: vegetalProteinList)
        case "vegetable":
            vegetableList = removeFoodFrom(foodName: foodName, foodList: vegetableList)
        case "fruit":
            fruitList = removeFoodFrom(foodName: foodName, foodList: fruitList)
        default:
            print("Error: The desired operation is non-existent")
        }
    }
    
    func removeFoodFrom(foodName: String, foodList: [String]) -> [String]{
        var updatedList = foodList
        let foodIndex = checkIfItAlreadyExistsInTheList(evaluatedObject: foodName, list: updatedList)
        if (foodIndex >= 0){
            updatedList.remove(at: foodIndex)
            showSuccessMessage(successAtivitie: "Remoção")
        }
        else{
            showErrorMesage(erro: "Alimento inexistente")
        }
        return updatedList
    }
    
    //functions to generate week menu
    func creatFileMenu() {
        if (checkExistenceOfMenu()){
            FileManipulation.freeWriting(url: menuURL)
        }
        FileManipulation.writeTextFile(text: generateTextMenu(), url: menuURL)
        openMenu()
    }
    
    func checkExistenceOfMenu () -> Bool{
        return FileManipulation.checkExistentFile(url: menuURL)
    }
    
    func generateTextMenu () -> String{
        var dayFoods : [String] = ["", "", "", "", "", ""]
        var finalMenuText = generateTitle(title: "Cardápio da semana")

        for i in stride(from: 0, to: 7, by: 1){
            dayFoods = chooseLunchOfTheDay(lastDayLunch: dayFoods)
            
            var lunchDayText = ""
            lunchDayText.append("\n  \(weekdays[i]) :\n")
            lunchDayText.append(convertMenuListInText(menuList: dayFoods))
            finalMenuText.append(lunchDayText)
        }
        return finalMenuText
    }
    
    func chooseLunchOfTheDay(lastDayLunch: [String]) -> [String]{
        var dayLunch: [String] = ["","","","","",""]
        
        dayLunch[0] = chooseFoodWithNoRepetitionFrom(doNotRepeat: lastDayLunch[0], list: carbohydrateList)
        dayLunch[1] = chooseFoodWithNoRepetitionFrom(doNotRepeat: lastDayLunch[1], list: animalProteinList)
        dayLunch[2] = chooseFoodWithNoRepetitionFrom(doNotRepeat: lastDayLunch[2], list: vegetalProteinList)
        dayLunch[3] = chooseFoodWithNoRepetitionFrom(doNotRepeat: lastDayLunch[3], list: vegetableList)
        dayLunch[4] = chooseFoodWithNoRepetitionFrom(doNotRepeat: dayLunch[3], list: vegetableList)
        dayLunch[5] = chooseFoodWithNoRepetitionFrom(doNotRepeat: lastDayLunch[5], list: fruitList)
        
        return dayLunch
    }
    
    func convertMenuListInText (menuList: [String]) -> String{
        var text = ""
        for i in menuList{
            if (i != ""){
                text.append("   \(i)\n")
            }
        }
        return text
    }

    func chooseFoodWithNoRepetitionFrom(doNotRepeat: String, list: [String]) -> String{
        let listSize = list.count
        var food = ""
        if (listSize > 0){
            if (listSize == 1){
                food = list[0]
            }
            else{
                repeat {
                    food = list.randomElement() ?? ""
                } while (food == doNotRepeat)
            }
        }
        return food
    }
     
    //function to open the week menu
    func openMenu(){
        if (checkExistenceOfMenu()) {
            shell("open \(menuURL.path)")
        }else{
            showErrorMesage(erro: "Nenhum cardápio existente")
        }
    }

}
