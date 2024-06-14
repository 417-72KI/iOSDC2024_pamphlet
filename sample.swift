#!/usr/bin/env swift

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking

extension URLSession {
    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        try await withCheckedThrowingContinuation { cont in
            dataTask(with: request) { (data, response, error) in
                if let error {
                    return cont.resume(throwing: error)
                }
                guard let data, let response else {
                    return cont.resume(throwing: URLError(.unknown))
                }
                cont.resume(returning: (data, response))
            }.resume()
        }
    }
}
#endif

let url = URL(string: "https://example.com/example.json")!
let (data, _) = try await URLSession.shared.data(for: URLRequest(url: url))

print(String(decoding: data, as: UTF8.self))