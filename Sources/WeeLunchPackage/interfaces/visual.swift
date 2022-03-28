//
//  File.swift
//  
//
//  Created by Beatriz Leonel da Silva on 28/03/22.
//

import Foundation

func showHomeMenu () {
    let homeMenu = """
      \(generateTitle(title: "🍴 WeeLunch 🍴"))
    
           1 - Iniciar novo cardápio
           2 - Abrir cardápio existente
           3 - Descrição dos alimentos
           0 - Sair do aplicativo
    
      ---------------------------------------
    """
    
    print(homeMenu)
}

func showCreationOfMenu (menu : Menu) {
    let homeMenu = """
      \(generateTitle(title: "🍴 Criação do cardápio: \(menu.menuName) 🍴"))
    
           1 - Adicionar Carboidrato
           2 - Adicionar Proteína Animal
           3 - Adicionar Proteína Vegetal
           4 - Adicionar Verdura ou Legumes
           5 - Adicionar Fruta
           6 - Listar Todos os Alimentos
           7 - Gerar Cardápio
           8 - Descrição dos cardápios
           0 - Voltar
    
      ---------------------------------------
    """
    
    print(homeMenu)
}

func showRemotionMenu (menu : Menu) {
    
    print(generateTitle(title: "🍴 Alimentos Listados 🍴"))
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

func generateTitle(title: String) -> String{
    let title = """
    
      ---------------------------------------
      \(centerString(text: "\(title)", Totalsize: 40))
      ---------------------------------------
    """
    return title
}
