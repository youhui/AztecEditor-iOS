import Foundation

public class HTMLToAttributedString: Converter {

    /// The default font descriptor that will be used as a base for conversions.
    ///
    let defaultFontDescriptor: UIFontDescriptor

    public required init(usingDefaultFontDescriptor defaultFontDescriptor: UIFontDescriptor) {
        self.defaultFontDescriptor = defaultFontDescriptor
    }

    public func convert(html: String) throws -> NSAttributedString {
        let htmlToNode = Libxml2.In.HTMLConverter()
        let nodeToAttributedString = HMTLNodeToNSAttributedString(usingDefaultFontDescriptor: defaultFontDescriptor)

        let node = try htmlToNode.convert(html)

        return nodeToAttributedString.convert(node)
    }
}