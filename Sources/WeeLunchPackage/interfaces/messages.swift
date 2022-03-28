//
//  File.swift
//  
//
//  Created by Beatriz Leonel da Silva on 28/03/22.
//

import Foundation

func showErrorMesage (erro: String) {
    let errorAnswerMessage = """
      \(generateTitle(title: "‼️ Erro: \(erro) ‼️"))
    """
    print(errorAnswerMessage)
    showPressEnterToContinue()
    pressEnterToContinue()
}

func showSuccessMessage (successAtivitie: String){
    let successMessage = """
      \(generateTitle(title: "✅ \(successAtivitie) realizada com sucesso ✅"))
    """
    print(successMessage)
    showPressEnterToContinue()
    pressEnterToContinue()
}
func showPressEnterToContinue(){
    let text = """
                  Pressione Enter
                  para continuar.
      ---------------------------------------
    """
    print(text)
}
