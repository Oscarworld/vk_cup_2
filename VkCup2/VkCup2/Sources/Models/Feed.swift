struct Response<T: Decodable>: Decodable {
    let response: T
}

struct FeedArray: Decodable {
    let next_from: String
    let items: FailableCodableArray<Feed>
}

struct Feed: Decodable {
    let post_id: Int
    let text: String
    let attachments: FailableCodableArray<Attachment>
    let comments: Comment
    let likes: Like
    let reposts: Report
}

struct Comment: Decodable {
    let count: Int
}

struct Like: Decodable {
    let count: Int
}

struct Report: Decodable {
    let count: Int
}

struct Attachment: Decodable {
    let id: Int
    let sizes: FailableCodableArray<PhotoSize>
}

struct PhotoSize: Decodable {
    let height: Int
    let width: Int
    let url: String
}

struct FailableDecodable<Base: Decodable>: Decodable {

    let base: Base?

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.base = try? container.decode(Base.self)
    }
}

struct FailableCodableArray<Element: Decodable>: Decodable {

    var elements: [Element]

    init(from decoder: Decoder) throws {

        var container = try decoder.unkeyedContainer()

        var elements = [Element]()
        if let count = container.count {
            elements.reserveCapacity(count)
        }

        while !container.isAtEnd {
            if let element = try container.decode(FailableDecodable<Element>.self).base {
                elements.append(element)
            }
        }

        self.elements = elements
    }
}
