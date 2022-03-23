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
            print(showTitle(title: "Adicinar Carboidrato"), terminator: "")
            menu.carbohydrateList = menu.addFood(foodList: menu.carbohydrateList)
        case "2":
            print(showTitle(title: "Adicinar Proteína Animal"), terminator: "")
            menu.animalProteinList = menu.addFood(foodList: menu.animalProteinList)
        case "3":
            print(showTitle(title: "Adicinar Proteína Vegetal"), terminator: "")
            menu.vegetalProteinList = menu.addFood(foodList: menu.vegetalProteinList)
        case "4":
            print(showTitle(title: "Adicinar Verduras e Legumes"), terminator: "")
            menu.vegetableList = menu.addFood(foodList: menu.vegetableList)
        case "5":
            print(showTitle(title: "Adicinar Frutas"), terminator: "")
            menu.fruitList = menu.addFood(foodList: menu.fruitList)
        case "6":
            inspectFoodListMenu(menu : menu)
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

func showHomeMenu () {
    let homeMenu = """
      \(showTitle(title: "🍴 WeeLunch 🍴"))
    
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
      \(showTitle(title: "🍴 Criação do cardápio: \(menu.menuName) 🍴"))
    
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

func showRemotionMenu (menu : Menu) {
    
    print(showTitle(title: "🍴 Alimentos Listados 🍴"))
    menu.listAvailabeFoods()
    
    let homeMenu = """
    
      ---------------------------------------
           1 - Remover Carboidrato
           2 - Remover Proteína Animal
           3 - Remover Proteína Vegetal
           4 - Remover Verduras ou Legumes
           5 - Remover Fruta
           0 - Voltar
      ---------------------------------------
    """
    
    print(homeMenu)
}

func showErrorMesage (erro: String) {
    let errorAnswerMessage = """
      \(showTitle(title: "‼️ Erro: \(erro) ‼️"))
                  Pressione Enter
                  para continuar.
      ---------------------------------------
    """
    print(errorAnswerMessage)
    pressEnterToContinue()
}

func showSuccessMessage (successAtivitie: String){
    let successMessage = """
      \(showTitle(title: "✅ \(successAtivitie) realizada com sucesso ✅"))
                  Pressione Enter
                  para continuar.
      ---------------------------------------
    """
    print(successMessage)
    pressEnterToContinue()
}

func showTitle(title: String) -> String{
    let title = """
    
      ---------------------------------------
      \(centerString(text: "\(title)", Totalsize: 40))
      ---------------------------------------
    """
    return title
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
