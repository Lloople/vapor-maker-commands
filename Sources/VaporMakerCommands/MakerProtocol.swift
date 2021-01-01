import Vapor

protocol MakerProtocol: Command {
    
    func run(using context: CommandContext, signature: Signature) throws -> Void
    
    func directory() -> String
    
    func createFile(writer: Writer, reader: Reader, signature: Signature) throws -> String
    
    func message(signature: Signature) -> String?
}

extension MakerProtocol {
    
    func run(using context: CommandContext, signature: Signature) throws {
        let writer = Writer(path: "Sources/App/\(self.directory())")
        let reader = Reader(path: "Stubs/\(self.directory())")
        
        let file = try self.createFile(writer: writer, reader: reader, signature: signature)
        
        let message: String? = self.message(signature: signature)
        
        context.console.print(message ?? "\(file) created successfully. Build something amazing! :)")
    }
}
