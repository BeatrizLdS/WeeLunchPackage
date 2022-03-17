//
//  File.swift
//  
//
//  Created by Beatriz Leonel da Silva on 17/03/22.
//

import Foundation


func openMenu(){
    if (checkExistenceOfMenu()) {
        shell("open /Users/beatrizleoneldasilva/Documents/Menu.txt")
    }else{
        showErrorMesage(erro: "Nenhum cardápio existente")
    }
}

func checkExistenceOfMenu () -> Bool{
    var existence = true
    
    if (!FileManager.default.fileExists(atPath:"/Users/beatrizleoneldasilva/Documents/Menu.txt") ) {
        existence = false
    }
    
    return existence
}

func creatMenu() {
    if (checkExistenceOfMenu()){
        freeWriting()
        writeTextFile()
    }
    else {
        writeTextFile()
    }
}

func freeWriting() {
    do{
        try FileManager.default.setAttributes([FileAttributeKey.immutable : false], ofItemAtPath: "/Users/beatrizleoneldasilva/Documents/Menu.txt")
    }
    catch{
        showErrorMesage(erro: "Cardápio não desbloqueado")
    }
}

func blockWriting() {
    do{
        try FileManager.default.setAttributes([FileAttributeKey.immutable : false], ofItemAtPath: "/Users/beatrizleoneldasilva/Documents/Menu.txt")
    }
    catch{
        showErrorMesage(erro: "Cardápio não bloqueado")
    }
}

func writeTextFile () {
    
    let fileName = "Menu"
    let documentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    let fileURL = documentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")

    let writeString = "Essa é a String que vai ser escrita no documento!"

    do {
        try writeString.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
    } catch let error as NSError {
        print("Não foi possível escrever no arquivo! Tente novamente.")
        print(error)
    }

    blockWriting()
}
