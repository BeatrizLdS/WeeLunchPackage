//
//  File.swift
//  
//
//  Created by Beatriz Leonel da Silva on 16/03/22.
//

import Foundation

func executeFirstNavegationMenu() {
    
    var control : Bool = true
    
    repeat {
        
        showHomeMenu()
        let answer = receiveAnswer()

        switch answer {
        case "1":
            let menuToCreate = Menu()
            createNewMenu(menu: menuToCreate)
        case "2":
            let menuToOpen = Menu()
            menuToOpen.openMenu()
        case "3":
            showHelpDocument()
        case "0":
            print("  !WeeLuch Finalizado!")
            control = false
        default:
            showErrorMesage(erro: "Entrada inválida")
        }
        
    } while control
}

func createNewMenu(menu : Menu) {
    
    var control : Bool = true
    
    repeat {
        
        showCreationOfMenu(menu: menu)
        let answer = receiveAnswer()

        switch answer {
        case "1":
            print(generateTitle(title: "Adicinar Carboidrato"), terminator: "")
            menu.carbohydrateList = menu.addFood(foodList: menu.carbohydrateList)
        case "2":
            print(generateTitle(title: "Adicinar Proteína Animal"), terminator: "")
            menu.animalProteinList = menu.addFood(foodList: menu.animalProteinList)
        case "3":
            print(generateTitle(title: "Adicinar Proteína Vegetal"), terminator: "")
            menu.vegetalProteinList = menu.addFood(foodList: menu.vegetalProteinList)
        case "4":
            print(generateTitle(title: "Adicinar Verduras e Legumes"), terminator: "")
            menu.vegetableList = menu.addFood(foodList: menu.vegetableList)
        case "5":
            print(generateTitle(title: "Adicinar Frutas"), terminator: "")
            menu.fruitList = menu.addFood(foodList: menu.fruitList)
        case "6":
            inspectFoodListMenu(menu : menu)
        case "7":
            menu.creatFileMenu()
            control = false
        case "8":
            showHelpDocument()
        case "0":
            control = false
        default:
            showErrorMesage(erro: "Entrada inválida")
        }
        
    } while control
}

func inspectFoodListMenu(menu : Menu) {
    
    var control : Bool = true
    
    repeat {
        
        showRemotionMenu(menu: menu)
        let answer = receiveAnswer()

        switch answer {
        case "1":
            menu.removeFood(foodType: "carbohydrate")
        case "2":
            menu.removeFood(foodType: "animalProtein")
        case "3":
            menu.removeFood(foodType: "vegetalProtein")
        case "4":
            menu.removeFood(foodType: "vegetable")
        case "5":
            menu.removeFood(foodType: "fruit")
        case "0":
            control = false
        default:
            showErrorMesage(erro: "Entrada inválida")
        }
        
    } while control
}
