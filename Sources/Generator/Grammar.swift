import Common

public struct Grammar {
	public var segments: [Segment]

	public init(_ segments: [Segment]) {
		self.segments = segments
	}
}

extension Grammar: ExpressibleByStringLiteral {
	public init(stringLiteral value: String) {
		segments = [.text(value)]
	}
}

extension Grammar: ExpressibleByStringInterpolation {
	public init(stringInterpolation: Grammar.StringInterpolation) {
		self.init(stringInterpolation.segments)
	}
	
	public struct StringInterpolation: StringInterpolationProtocol {
		fileprivate var segments: [Segment] = []
		
		public init(literalCapacity: Int, interpolationCount: Int) {
			
		}
		
		public mutating func appendLiteral(_ literal: StringLiteralType) {
			segments.append(.text(literal))
		}
		
		public mutating func appendInterpolation(constraint: Constraint) {
			segments.append(.constraint(constraint))
		}
	}
}
