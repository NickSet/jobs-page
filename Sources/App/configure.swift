import Fluent
import FluentPostgresDriver
import Leaf
import Vapor

extension Environment {
    static let pgUrl = URL(string: Self.get("DB_URL")!)!
}
// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    try app.databases.use(.postgres(url: Environment.pgUrl), as: .psql)

    app.migrations.add(CreateJob())
    app.logger.logLevel = .debug
    try app.autoMigrate().wait()

    app.views.use(.leaf)
    
    // register routes
    try routes(app)
}
