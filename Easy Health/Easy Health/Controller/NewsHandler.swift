//
//  NewsHandler.swift
//  Easy Health
//
//  Created by BJIT on 26/1/22.
//

import Foundation


final class NewsFeed {
    
    static let shared = NewsFeed()
    
    struct Constants {
        static let topHeadlinesURL = URL(string: "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=bf63e7a273404fbd8f9096d865b75879")
    }
    
    private init() {}
    
    public func getTopStories(completion: @escaping (Result<[NewsArticle], Error>) -> Void) {
        guard let url = Constants.topHeadlinesURL else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)

                    completion(.success(result.articles))
                }
                catch {
                    completion(.failure(error))
                }
            }
        }
        
        task.resume()
    }
}

struct APIResponse : Codable {
    let articles: [NewsArticle]
}

struct NewsArticle: Codable {
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String
}

struct Source: Codable {
    let name: String
    
}
