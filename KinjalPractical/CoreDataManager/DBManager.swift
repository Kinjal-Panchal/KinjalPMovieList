//
//  DBManager.swift
//  KinjalPractical
//
//  Created by Kinjal panchal on 12/05/22.
//


import Foundation
import CoreData

class DBManager{
    
    static let shared = DBManager()
    var timeStamp = ""
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "KinjalPractical")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    lazy var context = persistentContainer.viewContext
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    // MARK: - Core Data Deleting support
    
    func deleteObjectContext(_ object: NSManagedObject){
        let context = persistentContainer.viewContext
        if context.hasChanges {
            context.delete(object)
            self.saveContext()
        }
    }
    
    // MARK: - Retrive HR Entity List
    
    func getmovieList(_ predicator: [NSPredicate] = [], _ sortDescriptors: [NSSortDescriptor] = []) -> [Movies]{
        let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "Movies")
        if predicator.count > 0{
            fetchReq.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: predicator)
        }
        if sortDescriptors.count > 0{
            fetchReq.sortDescriptors = sortDescriptors
        }
        
        do {
            if let data = try context.fetch(fetchReq) as? [Movies]{
                return data
            }
        }catch{
            print("Error while fetching",error.localizedDescription)
        }
        return []
    }
    
    func fetchdetailsById(for id: String, _ completionBlock:@escaping((Movies?)->Void)){
        let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "Detail")
        var predicator : [NSPredicate] = []
       // predicator.append(NSPredicate(format: "uid == %@",id))
        fetchReq.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: predicator)
        do {
            if let data = try context.fetch(fetchReq) as? [Movies]{
                if let entity = data.first{
                    completionBlock(entity)
                }
            }
        }
        catch{
            print("Error while fetching",error.localizedDescription)
            completionBlock(nil)
        }
    }
    
    // MARK: - Add New MovieList
    func addMovieList(_ movieData: MovieData) {
        var objmoviesList : Movies
        objmoviesList = Movies(context: self.context)
        objmoviesList.title = movieData.movietitle ?? ""
        objmoviesList.subtitle = movieData.description ?? ""
        objmoviesList.image = movieData.posterimage ?? Data()
        objmoviesList.date = movieData.releasedate ?? ""
        self.saveContext()
    }
    
    func deleteMovie(){
        let objMovie = Movies(context: self.context)
        deleteObjectContext(objMovie)
    }
}

