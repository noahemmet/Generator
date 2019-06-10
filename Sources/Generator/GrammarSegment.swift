import Common

extension Grammar {
	public enum Segment {
		case text(String)
		case constraint(Constraint)
	}
}
