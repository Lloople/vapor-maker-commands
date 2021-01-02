import Vapor

protocol MakerProtocol: Command {
    
    func run(using context: CommandContext, signature: Signature) throws -> Void
    
    func directory() -> String
        
    func message(_ signature: Signature) -> String?
    
    func filename(_ signature: Signature) -> String
    
    func stub(_ signature: Signature) -> String
    
    func replaces(_ signature: Signature) -> [String:String]
    
}

extension MakerProtocol {
    
    func run(using context: CommandContext, signature: Signature) throws {
        let writer = Writer(path: "Sources/App/\(self.directory())")
        let reader = Reader(path: "Stubs/\(self.directory())")
        
        try writer.createFile(
            name: self.filename(signature),
            contents: reader.get(name: self.stub(signature), replaces: self.replaces(signature))
        )
        
        let message: String? = self.message(signature)
        
        context.console.print(message ?? "\(self.filename(signature)) created successfully. Build something amazing! :)")
    }
}
