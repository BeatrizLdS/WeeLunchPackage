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
            var menuToCreate = Menu()
            createNewMenu(menu: menuToCreate)
        case "2":
            var menuToOpen = Menu()
            menuToOpen.openMenu()
        case "0":
            print("\n  Tchau Tchau!!")
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
           0 - Sair
    
      ---------------------------------------
    """
    
    print(homeMenu)
}

func createNewMenu(menu : Menu) {
    
    var control : Bool = true
    
    repeat {
        
        showCreationOfMenu()
        let answer = receiveAnswer()

        switch answer {
        case "1":
            print("Adicione Carboidrato")
        case "2":
            print("Adicione proteína animal")
        case "3":
            print("Adicione proteína vegetal")
        case "4":
            print("Adicione verduras e legumes")
        case "5":
            print("Adicione fruta")
        case "6":
            print("Liste todos os itens")
        case "7":
            print("Gere Cardápio")
        case "8":
            print("Mostre Ajuda")
        case "0":
            print("Volte para menu principal")
            control = false
        default:
            showErrorMesage(erro: "Entrada inválida")
        }
        
    } while control
}

func showCreationOfMenu (menu : Menu) {
    let homeMenu = """
    
      ---------------------------------------
      \(centerString(text: "🍴 Criação do cardápio \(menu.menuName)", Totalsize: 39))
      ---------------------------------------
    
           1 - Adicionar Carboidrato
           2 - Adicionar Proteína Animal
           3 - Adicionar Proteína Vegetal
           4 - Adicionar Verdura ou Legumes
           5 - Adicionar Fruta
           6 - Listar Todos os Alimentos
           7 - Gerar Cardápio
           8 - Ajuda
           0 - Sair
    
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

func receiveAnswer() -> String{
    let textPrint = "  Resposta:"
    
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
