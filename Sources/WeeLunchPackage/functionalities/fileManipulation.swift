//
//  File.swift
//  
//
//  Created by Beatriz Leonel da Silva on 22/03/22.
//

import Foundation

class FileManipulation {
    
    static func generateURL(fileName: String, fileType: String) -> URL
    {
        let documentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileURL = documentDirURL.appendingPathComponent(fileName.lowercased()).appendingPathExtension(fileType)
        
        return fileURL
    }
    
    static func checkExistentFile(url: URL) -> Bool{
        var existence = true
        
        if (!FileManager.default.fileExists(atPath:url.path) ) {
            existence = false
        }
        
        return existence

    }
    
    static func writeTextFile (text: String, url: URL) {
        do {
            try text.write(to: url, atomically: true, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            print("Not is possible to write in the file! Try again.")
            print(error)
        }
        
        blockWriting(url: url)
    }
    
    static func freeWriting(url: URL) {
        do{
            try FileManager.default.setAttributes([FileAttributeKey.immutable : false], ofItemAtPath: url.path)
        }
        catch{
            showErrorMesage(erro: "Edição não liberada")
        }
    }
    
    static func blockWriting(url: URL) {
        do{
            try FileManager.default.setAttributes([FileAttributeKey.immutable : true], ofItemAtPath: url.path)
        }
        catch{
            showErrorMesage(erro: "Cardápio não bloqueado")
        }
    }
    
}



