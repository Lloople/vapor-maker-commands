import Vapor

struct LeafTagMaker: MakerProtocol {
    
    struct Signature: CommandSignature {
        @Argument(name: "name")
        var name: String
    }
    
    var help: String {
        "Generates a new custom leaf tag."
    }
    
    func directory() -> String { "LeafTags" }
    
    func createFile(writer: Writer, reader: Reader, signature: Signature) throws -> String {
        
        try writer.createFile(
            name: signature.name,
            contents: reader.get(name: "LeafTag", replaces: [
                "name": signature.name,
            ])
        )

        return signature.name
    }
    
    func message(signature: Signature) -> String? {
        return "Don't forget to register your tag with: \n\t`app.leaf.tags[\"now\"] = \(signature.name)()`"
    }
}
