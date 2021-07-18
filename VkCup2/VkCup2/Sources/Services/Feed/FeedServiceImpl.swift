final class FeedServiceImpl {
    private var feedRequest: VKRequest?
}

// MARK: - FeedService

extension FeedServiceImpl: FeedService {
    func cancelAllOperations() {
        feedRequest?.cancel()
    }
    
    func getFeed(
        startFrom: String?,
        completion: @escaping (Result<(feed: [Feed], nextFrom: String), ServiceError>) -> Void
    ) {
        var parameters: [String: Any] = [
            "filters": ["post", "photo"]
        ]
        if let startFrom = startFrom {
            parameters["start_from"] = startFrom
        }
        
        guard let request = VKApi.request(
                withMethod: "newsfeed.get",
                andParameters: parameters
        ) else {
            completion(.failure(.failInitRequest))
            return
        }
        
        request.execute(resultBlock: { object in
            let decoder = JSONDecoder()
            guard let responseString = object?.responseString else {
                completion(.failure(.failParse))
                return
            }
            
            let data = Data(responseString.utf8)
            do {
                let response = try decoder.decode(Response<FeedArray>.self, from: data)
                let items = response.response.items.elements
                let nextFrom = response.response.next_from
                completion(.success((feed: items, nextFrom: nextFrom)))
            } catch {
                completion(.failure(.failParse))
            }
        }) { error in
            completion(.failure(.fail))
        }
    }
}
