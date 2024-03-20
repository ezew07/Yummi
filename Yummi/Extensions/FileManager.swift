//
//  FileManager.swift
//  Yummi
//
//  Created by Eze, William (IRG) on 20/03/2024.
//

import Foundation

extension FileManager{
    
    private func getDocumentDirectory(filename: String) -> URL{
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    func save<T: Codable>(filename: String, object: T){
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(object){
            if let json = String(data: encoded, encoding: .utf8){
                do{
                    try json.write(to: getDocumentDirectory(filename: filename).appendingPathComponent(filename), atomically: true, encoding: .utf8)
                } catch {
                    print(error.localizedDescription)
                }
            }
            else {
                print("Failed to form JSON")
            }
        }
    }
    
    func load<T: Codable>(filename: String) -> T? {
        if let data = try? Data(contentsOf: getDocumentDirectory(filename: filename).appendingPathComponent(filename)){
            let decoder = JSONDecoder()
            if let loaded = try? decoder.decode(T.self, from: data){
                return loaded
            } else{
                print("Failed to decode")
                return nil
            }
        }
        return nil
    }
    
}

