import Vapor

struct MigrationMaker: MakerProtocol {
    
    struct Signature: CommandSignature {
        @Argument(name: "name")
        var name: String
    }
    
    var help: String {
        "Generates a new migration."
    }
    
    func directory() -> String { "Migrations" }
    
    func createFile(writer: Writer, reader: Reader, signature: Signature) throws -> String {
        
        try writer.createFile(
            name: signature.name,
            contents: reader.get(name: "Migration", replaces: [
                "name": signature.name,
                "schema": signature.name.lowercased().finished(with: "s")
            ])
        )

        return signature.name
    }
    
    func message(signature: Signature) -> String? {
        return "Remember to register your migration with: \n\t`app.migrations.add(\(signature.name)())`"
    }
}
