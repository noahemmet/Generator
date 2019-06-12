import Common

public struct SceneGenerator {
	public let corpus: Corpus
	
	public func generate(from template: SceneTemplate, unique: Bool = false) throws -> Scene {
		
		let entityGenerator = EntityGenerator<Entity>(corpus: corpus)
		let entities = try template.entities.map { try entityGenerator.generate(with: $0, unique: unique) { (name, tags) in
			let entity = Entity(name: name, tags: tags)
			return entity
			}
		}
		
		var areaResolver = GrammarResolver(grammars: [template.area], entities: [])
		let area = try areaResolver.generate(unique: unique)
		
		var introResolver = GrammarResolver(grammars: [template.intro], entities: entities)
		let intro = try introResolver.generate(unique: unique)
		
		let scene = Scene(area: area, entities: entities, intro: intro)
		return scene
	}
	
}
