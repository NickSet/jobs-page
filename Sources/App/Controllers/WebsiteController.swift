import Vapor
import Leaf

struct WebsiteController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        routes.get(use:indexHandler)
    }
    func indexHandler(_ req: Request) -> EventLoopFuture<View> {
        let context = IndexContent(title: "Home Page")
        return req.view.render("index", context)
    }
}

struct IndexContent: Encodable {
    let title: String
}