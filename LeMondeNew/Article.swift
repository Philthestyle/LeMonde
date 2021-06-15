//
//  Article.swift
//  LeMondeNew
//
//  Created by Faustin Veyssiere on 15/06/2021.
//

import Foundation


class Article: Codable, Serializable {
    private enum CodingKeys: String, CodingKey {
        case titre
        case key
    }
    
    
    var titre: String
    var key: String
    
    
    // MARK: - INIT AUTO
    init() {
        self.titre = "titre"
        self.key = "key"
    }
    
    // MARK: - INIT WITH PARAMS
    init(titre: String, key: String) {
        
        self.titre = titre
        self.key = key
    }
    
    // MARK: - DECODER
    required init(from decoder: Decoder) throws {
        let values: KeyedDecodingContainer<CodingKeys>
        do {
            values = try decoder.container(keyedBy: CodingKeys.self)
            
            self.titre  = try values.decodeIfPresent(String.self, forKey: .titre) ?? "titre"
            self.key  = try values.decodeIfPresent(String.self, forKey: .key) ?? "key"
           
        } catch let error {
            let className = "Article"
            fatalError("Error! When you want to decode your model: <\(className)> > \(error)")
        }
        
       
    }
    
    // MARK: - ENCODER
    func encode(to encoder: Encoder) throws {
        do {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            try container.encodeIfPresent(titre, forKey: .titre)
            try container.encodeIfPresent(key, forKey: .key)
            
           
            
        } catch let error {
            fatalError("Error! When you want to encode your model: \(type(of: self)) > \(self) :: \(error)")
        }
    }
    
    
  
}
