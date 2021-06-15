//
//  NetworkManager.swift
//  LeMondeTest
//
//  Created by Faustin Veyssiere on 14/06/2021.
//

import Foundation

public class NetworkManager {
    
    
    static func getDailyNews(completion:@escaping (DailyNews) -> ()) {
        guard let url = URL(string: "https://aec.lemonde.fr/ws/8/mobile/www/ios-phone/en_continu/index.json") else { return }
        
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let dailyNews = try! JSONDecoder().decode(DailyNews.self, from: data!)
            
            if dailyNews.elements == nil {
                completion(DailyNews(elements: dailyNews.elements ?? []))
                return
            }
            
            var allArticlesWithTitle: [Article] = []
            for i in 0...dailyNews.elements!.count - 1 {
                if dailyNews.elements![i].titre == "" { return }
                let articleWithTitle: Article = dailyNews.elements![i]
                allArticlesWithTitle.append(articleWithTitle)
            }
            
            let dailyNewsToBeReturned: DailyNews = DailyNews(elements: allArticlesWithTitle)
            
            DispatchQueue.main.async {
                
                completion(dailyNewsToBeReturned)
            }
        }
        .resume()
    }
    
 
    
}
