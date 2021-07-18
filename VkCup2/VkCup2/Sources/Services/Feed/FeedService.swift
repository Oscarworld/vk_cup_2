protocol FeedService {
    func cancelAllOperations()
    
    func getFeed(
        startFrom: String?,
        completion: @escaping (Result<(feed: [Feed], nextFrom: String), ServiceError>) -> Void
    )
}
