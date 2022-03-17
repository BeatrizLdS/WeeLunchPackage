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
            //generateText()
        case "2":
            openMenu()
        case "0":
            print("\n  Tchau Tchau!!")
            control = false
        default:
            showErrorMesage(erro: "Entrada inválida")
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

func showErrorMesage (erro: String) {
    //print(centerString(text: "‼️ Erro: \(erro) ‼️", Totalsize: 38))
    
    
    let errorAnswerMessage = """
    
      ---------------------------------------
      \(centerString(text: "‼️ Erro: \(erro) ‼️", Totalsize: 40))
      ---------------------------------------
                  Pressione Enter
                  para continuar.
      ---------------------------------------
    
    """
    print(errorAnswerMessage)
}

//38

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
