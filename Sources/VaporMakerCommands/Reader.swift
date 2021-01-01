import Foundation

class Reader {
    
    let path: String
    
    init (path: String) {
        self.path = path
    }
    
    func get(name: String, replaces: [String:String]) throws -> Data {

        let path = Bundle.module.url(forResource: "\(self.path)/\(name)", withExtension: "stub")!

        var stubContent = try String(contentsOf: path)
        
        for (key, value) in replaces {
            stubContent = stubContent.replacingOccurrences(of: "{{\(key)}}", with: value)
        }
        
        return stubContent.data(using: .utf8)!
    }
    
    
}
