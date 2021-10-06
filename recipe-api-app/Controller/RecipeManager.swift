import Foundation
import UIKit

protocol apiDelegate: AnyObject {
    func jsonData(_ recipe: RecipeData)
}

struct RecipeManager {

    weak var delegate: apiDelegate?

    func getApi () {
        guard let recipeURL = URL(string: "https://app.rakuten.co.jp/services/api/Recipe/CategoryRanking/20170426?format=json&applicationId=1096920546755581347") else { return }

        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: recipeURL) { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }

            if let safeData = data {
                let recipes = self.parseJSON(safeData)
                    delegate?.jsonData(recipes!)
            }
        }

        task.resume()
    }

    func parseJSON(_ recipeData: Data) -> RecipeData?{
        let decoder = JSONDecoder()
        do {
          let recipes = try decoder.decode(RecipeData.self, from: recipeData)
            return recipes
        } catch {
            print(error)
           return nil
        }
    }

}
