import Foundation

public extension UILabel {
    
    public func at_setAllSubstringsColor(substring : String?, color: UIColor?) {
        if substring != nil && color != nil {
            let attributedString = NSMutableAttributedString(attributedString: self.attributedText)
            let text = attributedString.mutableString
            
            let expression = NSRegularExpression(pattern: "(" + substring! + ")", options: NSRegularExpressionOptions.allZeros, error: nil)
            
            expression?.enumerateMatchesInString(text, options: NSMatchingOptions.allZeros, range: NSMakeRange(0, text.length), usingBlock: { (result: NSTextCheckingResult!, flags: NSMatchingFlags, stop: UnsafeMutablePointer<ObjCBool>) -> Void in
                
                // docs: "A result must have at least one range"
                let wordRange = result.rangeAtIndex(0)
                attributedString.addAttribute(NSForegroundColorAttributeName, value: color!, range: wordRange)
            })
            self.attributedText = attributedString
        }
    }
}