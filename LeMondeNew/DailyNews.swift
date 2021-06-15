//
//  DailyNews.swift
//  LeMondeNew
//
//  Created by Faustin Veyssiere on 15/06/2021.
//

import Foundation

class DailyNews: Codable, Serializable {
    private enum CodingKeys: String, CodingKey {
        case elements
   
    }
    
    
    var elements: [Article]?
  
    
    // MARK: - INIT AUTO
    init() {
        self.elements = []

    }
    
    // MARK: - INIT WITH PARAMS
    init(elements: [Article]) {
        
        self.elements = elements
    }
    
    // MARK: - DECODER
    required init(from decoder: Decoder) throws {
        let values: KeyedDecodingContainer<CodingKeys>
        do {
            values = try decoder.container(keyedBy: CodingKeys.self)
            
            self.elements  = try values.decodeIfPresent([Article].self, forKey: .elements) ?? [Article(titre: "titre article missing", key: "key")]
            
            
            
            
        } catch let error {
            let className = "DailyNews"
            fatalError("Error! When you want to decode your model: <\(className)> > \(error)")
        }
        
       
    }
    
    // MARK: - ENCODER
    func encode(to encoder: Encoder) throws {
        do {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            try container.encodeIfPresent(elements, forKey: .elements)
            try container.encodeIfPresent(elements, forKey: .elements)

            
        } catch let error {
            fatalError("Error! When you want to encode your model: \(type(of: self)) > \(self) :: \(error)")
        }
    }
    
    
  
}
