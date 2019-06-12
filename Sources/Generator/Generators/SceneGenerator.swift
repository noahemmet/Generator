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
		
		var areaGenerator = ParagraphGenerator(grammars: [template.area], entities: [])
		let area = try areaGenerator.generate(unique: unique)
		
		var introGenerator = ParagraphGenerator(grammars: [template.intro], entities: entities)
		let intro = try introGenerator.generate(unique: unique)
		
		let scene = Scene(area: area, entities: entities, intro: intro)
		return scene
	}
	
}
