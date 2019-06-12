import Common


public struct Scene {
	public var area: String
	public var entities: [Entity]
	public var intro: String
}

public struct Entity: GeneratedEntity {
	public var name: String
	public var tags: [Tag]
}
