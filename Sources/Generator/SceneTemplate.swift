import Common

public struct SceneTemplate {
	public var area: Grammar
	public var entities: [Grammar]
	public var intro: Grammar

	public init(area: Grammar, entities: [Grammar], intro: Grammar) {
		self.area = area
		self.entities = entities
		self.intro = intro
	}
}
