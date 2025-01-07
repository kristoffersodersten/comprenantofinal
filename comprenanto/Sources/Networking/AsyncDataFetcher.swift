import Foundation

/// Fetches data asynchronously from a given URL.
class AsyncDataFetcher {
    /// Fetches data from the specified URL.
    /// - Parameters:
    ///   - url: The URL to fetch data from.
    ///   - completion: A closure that handles the result, returning either the fetched data or an error.
    func fetchData(from url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: 0, userInfo: nil)))
                return
            }

            completion(.success(data))
        }
        task.resume()
    }

    /// Fetches and decodes JSON data from the specified URL.
    /// - Parameters:
    ///   - url: The URL to fetch JSON data from.
    ///   - type: The type of the object to decode.
    ///   - completion: A closure that handles the result, returning either the decoded object or an error.
    func fetchAndDecodeJSON<T: Decodable>(from url: URL, as type: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        fetchData(from: url) { result in
            switch result {
            case .success(let data):
                do {
                    let decodedObject = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decodedObject))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
} 