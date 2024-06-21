//
//  CatchedPokemonEntityCache.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 18/6/24.
//

import CoreData

@objc(CatchedPokemonEntityCache)
public class CatchedPokemonEntityCache: NSManagedObject {}

extension CatchedPokemonEntityCache {
    
    @NSManaged public var number: Int64
}

private extension CatchedPokemonEntityCache {
    
    @nonobjc static func fetchRequest() -> NSFetchRequest<CatchedPokemonEntityCache> {
        NSFetchRequest<CatchedPokemonEntityCache>(entityName: "CatchedPokemonEntityCache")
    }
    
    @nonobjc static func fetchCatchedPokemonByNumberRequest(_ number: Int) -> NSFetchRequest<CatchedPokemonEntityCache> {
        let request = fetchRequest()
        request.predicate = NSPredicate(format: "%K == %d", "number", number)
        return request
    }
}

private extension CatchedPokemonEntityCache {
    
    @nonobjc static func createCatchedPokemon(_ number: Int, using context: NSManagedObjectContext) -> CatchedPokemonEntityCache? {
        let entityCache = CatchedPokemonEntityCache(context: context)
        entityCache.number = Int64(number)
        
        return entityCache
    }
}

extension CatchedPokemonEntityCache {
    
    @nonobjc static func fetchCatchedPokemon(withNumber number: Int, using context: NSManagedObjectContext) -> CatchedPokemonEntityCache? {
        (try? context.fetch(fetchCatchedPokemonByNumberRequest(number)))?.first
    }
    
    @nonobjc static func fetchCatchedPokemons(using context: NSManagedObjectContext) -> [CatchedPokemonEntityCache] {
        (try? context.fetch(fetchRequest())) ?? []
    }
    
    @discardableResult @nonobjc static func saveCatchedPokemon(_ number: Int, using context: NSManagedObjectContext) -> CatchedPokemonEntityCache? {
        defer {
            do {
                try context.save()
            } catch {
                print("Failed to save context: \(error)")
            }
        }
        return createCatchedPokemon(number, using: context)
    }
    
    @nonobjc static func deleteCatchedPokemon(withNumber number: Int, using context: NSManagedObjectContext) {
        context.performAndWait {
            guard let catchedPokemon = fetchCatchedPokemon(withNumber: number, using: context) else {
                return
            }
            context.delete(catchedPokemon)
            
            do {
                try context.save()
            } catch {
                print("Failed to delete and save context: \(error)")
                context.rollback()
            }
        }
    }
}
