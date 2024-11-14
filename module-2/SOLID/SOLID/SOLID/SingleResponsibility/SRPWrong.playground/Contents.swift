
import Foundation

//ეს კლასი არღვევს SOLID SRP პრინციპს, რადგან კლასი ახდენს სხვა და სხვა ტიპის არსებების მართვას
//და ყველა ლოგიკა მოქცეულია ერთ კლასში

final class SRPWrong {
    
    init() {}
    
    private func getAnimals() -> Data {
        return Data()
    }
    
    private func getBirds() -> Data {
        return Data()
    }
    
    private func getReptiles() -> Data {
        return Data()
    }
    
    func handleJungle() {
        let allAnimals = getAnimals()
        print(allAnimals)
        
        let allBirds = getBirds()
        print(allBirds)
        
        let reptile = getReptiles()
        print(reptile)
    }
}
