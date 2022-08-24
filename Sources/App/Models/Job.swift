import Vapor
import Fluent

final class Job: Model {
    static let schema = "jobs"

    @ID
    var id: UUID?

    @Field(key: "title")
    var title: String
    @Field(key: "location")
    var location: String

    init() {}

    init(id: UUID? = nil, title: String, location: String) {
        self.id = id
        self.title = title
        self.location = location
    }
}

extension Job: Content {}
