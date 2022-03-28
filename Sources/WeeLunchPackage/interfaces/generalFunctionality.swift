//
//  File.swift
//  
//
//  Created by Beatriz Leonel da Silva on 28/03/22.
//

import Foundation

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
