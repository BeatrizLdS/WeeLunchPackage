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
           3 - Descrição dos cardápios
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

func showHelpDocument(){
    let helpdocument = """
    
      WeeLunch - Ajuda
     
      Carboidratos:
      A função energética é a principal função dos nutrientes classificados como
      carboidratos.
      Eles devem compor cerca de 25% de uma refeição.
      Exemplo de carboidratos: Arroz, massas, batata, mandioquinha etc.

      Proteínas vegetais e animais:
      As proteínas estão presentes em todos os processos biológicos e são
      substâncias que exercem diversas funções no organismo.
      Proteínas de origem animal e vegetal devem compor juntas aproximadamente 25%
      de uma refeição.
      Exemplo de proteínas vegetais: feijão, grão de bico, lentilha, ervilha etc.
      Exemplo de proteínas animais: frango, peixe, carne e ovos.

      Verduras e legumes:
      Representam os alimentos mais repletos de vitaminas, minerais e fibras. São
      importantes para o funcionamento adequado do organismo e do sistema
      imunológico. Devem estar presentes em 50% de uma refeição.
      Exemplo de verduras e legume: Alface, brócolis, cenoura, rúcula, chuchu,
      tomate etc.

      Frutas:
      As frutas são alimentos essenciais em qualquer alimentação. Entretanto, é
      válido ressaltar que elas devem ser ingeridas como sobremesas ao final
      de uma refeição e de preferência devem ser escolhidas frutas ricas em
      vitamina C.
      Exemplos de frutas ricas em vitamina C: Acerola, kiwis, goiaba, lichia,
      morango, laranja etc.

    """
    
    print(helpdocument)
    print("  ---------------------------------------")
    showPressEnterToContinue()
    pressEnterToContinue()
}
