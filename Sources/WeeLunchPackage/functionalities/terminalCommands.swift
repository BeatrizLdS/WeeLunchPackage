//
//  File.swift
//  
//
//  Created by Beatriz Leonel da Silva on 16/03/22.
//

import Foundation


func shell(_ command: String) {
    let task = Process()
    task.launchPath = "/bin/zsh/"
    task.arguments = ["-c", command]

    let pipe = Pipe()
    task.standardOutput = pipe
    task.launch()

    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    let output = String(data: data, encoding: .utf8) ?? ""
    print(output)
}

