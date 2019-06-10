import Common

public struct Constraint {
	public var wordKind: Word.Kind
	public var tags: [Tag]

	public init(_ wordKind: Word.Kind, _ tags: Tag...) {
		self.wordKind = wordKind
		self.tags = tags
	}
}

extension Constraint: ExpressibleByStringLiteral {
	public init(stringLiteral value: String) {
		// example: "adj.ed: #animal, #slippery"
		let adjPrefix = "adj:"
		let adjPast = "adj.ed:"
		let adjPresent = "adj.ing:"
		let tagPrefix = "#"
		
		let separator: Character = ","
		let tagString: String
		if value.hasPrefix(adjPrefix) {
			wordKind = .adjective(.attributive)
			tagString = value.droppingPrefix(adjPrefix)
		} else if value.hasPrefix(adjPast) {
			wordKind = .adjective(.pastParticipal)
			tagString = value.droppingPrefix(adjPast)
		} else if value.hasPrefix(adjPresent) {
			wordKind = .adjective(.presentParticipal)
			tagString = value.droppingPrefix(adjPresent)
		} else {
			wordKind = .adjective(.attributive)
			tagString = value
		}
		let tagStrings = tagString.split(separator: separator)
			.map(String.init)
			.map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
			.map { $0.droppingPrefix(tagPrefix) } 
		
		tags = tagStrings.map { Tag($0) }
	}
}
