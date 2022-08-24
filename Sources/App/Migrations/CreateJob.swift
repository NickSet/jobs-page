import Fluent

struct CreateJob: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("jobs")
            .id()
            .field("title", .string, .required)
            .field("location", .string, .required)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("jobs").delete()
    }
}