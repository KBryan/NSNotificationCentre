import UIKit

class URLObject : NSObject {
    
    private var fileUrl:String!
    private var someString:String!
    
    var RETURN_STRING:String {
        return someString
    }
    override init() {
        // default values for the object
        fileUrl = "www.google.com"
        someString = "This is a returned string"
    }
    init(url:String) {
        fileUrl = url
        someString = "\(fileUrl)"
    }
}
