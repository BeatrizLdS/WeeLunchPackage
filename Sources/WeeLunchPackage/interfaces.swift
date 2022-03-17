//
//  File.swift
//  
//
//  Created by Beatriz Leonel da Silva on 16/03/22.
//

import Foundation

func executeFirstMenu() {
    
    var control : Bool = true
    
    repeat {
        
        showHomeMenu()
        let answer = receiveAnswer()

        switch answer {
        case "1":
            print("\n  Vai iniciar um novo cardápio!")
        case "2":
            print("\n  Vai mostrar o cardápio atual!")
        case "0":
            print("\n  Tchau Tchau!!")
            control = false
        default:
            showErrorMesage()
        }
        
    } while control
}

func receiveAnswer() -> String{
    let textPrint = "  Resposta:"
    
    var answer = ""
    
    print(textPrint, terminator: "")
    answer = readLine()!
    
    return answer
}

func showHomeMenu () {
    let homeMenu = """
    
      --------------------------------
               🍴 WeeLunch 🍴
      --------------------------------
    
         1 - Iniciar novo cardápio
         2 - Abrir cardápio atual
         0 - Sair
    
      --------------------------------
    """
    
    print(homeMenu)
}

func showErrorMesage () {
    let errorAnswerMessage = """
    
      --------------------------------
        ‼️ Erro: Entrada inválida ‼️
      --------------------------------
              Pressione Enter e
              digite novamente.
      --------------------------------
    """
    print(errorAnswerMessage)
}


