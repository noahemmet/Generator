import Common

public struct Grammar {
	public var segments: [Segment]

	public init(_ segments: [Segment]) {
		self.segments = segments
	}
	
	public var allConstraints: [Constraint] {
		let constraints: [Constraint] = self.segments.compactMap { segment in
			switch segment {
			case .text: return nil
			case .constraint(let constraint): return constraint
			}
		}
		return constraints
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
		
		public mutating func appendInterpolation(adj tagString: String) {
			let constraint = Constraint(wordKind: .adjective(.attributive), tagString: tagString)
			segments.append(.constraint(constraint))
		}
		
		public mutating func appendInterpolation(n tagString: String) {
			let constraint = Constraint(wordKind: .noun, tagString: tagString)
			segments.append(.constraint(constraint))
		}
	}
}
