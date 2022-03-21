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
            shell("Open helpdocument.txt")
        case "0":
            print("\n  Tchau Tchau!!")
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
            showAddFoodInterface(foodType: "Carboidrato")
            menu.carbohydrateList = menu.addFood(foodList: menu.carbohydrateList)
        case "2":
            showAddFoodInterface(foodType: "Proteína Animal")
            menu.animalProteinList = menu.addFood(foodList: menu.animalProteinList)
        case "3":
            showAddFoodInterface(foodType: "Proteína Vegetal")
            menu.vegetalProteinList = menu.addFood(foodList: menu.vegetalProteinList)
        case "4":
            showAddFoodInterface(foodType: "Verduras e Legumes")
            menu.vegetableList = menu.addFood(foodList: menu.vegetableList)
        case "5":
            showAddFoodInterface(foodType: "Frutas")
            menu.fruitList = menu.addFood(foodList: menu.fruitList)
        case "6":
            print("Liste todos os itens")
        case "7":
            print("Gere Cardápio")
        case "8":
            shell("Open helpdocument.txt")
        case "0":
            control = false
        default:
            showErrorMesage(erro: "Entrada inválida")
        }
        
    } while control
}

func showHomeMenu () {
    let homeMenu = """
    
      ---------------------------------------
                   🍴 WeeLunch 🍴
      ---------------------------------------
    
           1 - Iniciar novo cardápio
           2 - Abrir cardápio atual
           3 - Descrição dos alimentos
           0 - Sair
    
      ---------------------------------------
    """
    
    print(homeMenu)
}

func showCreationOfMenu (menu : Menu) {
    let homeMenu = """
    
      ---------------------------------------
      \(centerString(text: "🍴 Criação do cardápio: \(menu.menuName) 🍴", Totalsize: 39))
      ---------------------------------------
    
           1 - Adicionar Carboidrato
           2 - Adicionar Proteína Animal
           3 - Adicionar Proteína Vegetal
           4 - Adicionar Verdura ou Legumes
           5 - Adicionar Fruta
           6 - Listar Todos os Alimentos
           7 - Gerar Cardápio
           8 - Descrição dos alimentos
           0 - Voltar
    
      ---------------------------------------
    """
    
    print(homeMenu)
}

func showErrorMesage (erro: String) {
    let errorAnswerMessage = """
    
      ---------------------------------------
      \(centerString(text: "‼️ Erro: \(erro) ‼️", Totalsize: 40))
      ---------------------------------------
                  Pressione Enter
                  para continuar.
      ---------------------------------------
    """
    print(errorAnswerMessage)
    pressEnterToContinue()
}

func showAddFoodInterface(foodType: String){
    let title = """
    
      ---------------------------------------
        \(centerString(text: "Adicinar \(foodType)", Totalsize: 40))
      ---------------------------------------
    """
    print(title)
}

func receiveAnswer() -> String{
    let textPrint = "  comando:"
    
    var answer = ""
    
    print(textPrint, terminator: "")
    answer = readLine()!
    
    return answer
}

func centerString(text: String, Totalsize: Int) -> String {
    let sizeOfText = text.count + 2
    let sideSpace = (Totalsize - sizeOfText)/2
    var i = 0;
    var textResult = ""
    
    while (i < Totalsize) {
        if (i < sideSpace || i >= sideSpace + sizeOfText){
            textResult += " "
            i += 1
        }
        else {
            textResult += text
            i += sizeOfText
        }
    }
    return textResult
}

func pressEnterToContinue(){
    _ = readLine()
}
