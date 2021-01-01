import Vapor

class Writer {
    
    let path: String

    let fm: FileManager
    
    init(path: String) {
        self.path = path
        
        self.fm = FileManager.default
    }
    
    func createFile(name: String, contents: Data?) throws {
        if !self.fm.fileExists(atPath: self.path) {
            try self.fm.createDirectory(atPath: self.path, withIntermediateDirectories: true)
        }
        
        self.fm.createFile(
            atPath: "\(self.path)/\(name).swift",
            contents: contents
        )
    }
}
