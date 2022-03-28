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
                  Pressione Enter
                  para continuar.
      ---------------------------------------
    """
    print(errorAnswerMessage)
    pressEnterToContinue()
}

func showSuccessMessage (successAtivitie: String){
    let successMessage = """
      \(generateTitle(title: "✅ \(successAtivitie) realizada com sucesso ✅"))
                  Pressione Enter
                  para continuar.
      ---------------------------------------
    """
    print(successMessage)
    pressEnterToContinue()
}
