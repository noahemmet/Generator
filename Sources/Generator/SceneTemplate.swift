import Common

public struct SceneTemplate {
	public var intro: Grammar
	public var area: GeneratedEntity
	public var entities: [GeneratedEntity]

	public init(intro: Grammar, area: GeneratedEntity, entities: [GeneratedEntity]) {
		self.intro = intro
		self.area = area
		self.entities = entities
	}
}
