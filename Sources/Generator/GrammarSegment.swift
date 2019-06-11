import Common

extension Grammar {
	public enum Segment: Hashable {
		case text(String)
		case constraint(Constraint)
		case entity(String)
		case trait(entity: String, Constraint)
	}
}
