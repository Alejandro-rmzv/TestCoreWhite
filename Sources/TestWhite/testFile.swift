//
//  testFile.swift
//  TestCoreWhite
//
//  Created by Jose Alejandro Ramirez Vergara on 22/12/25.
//
import Foundation
import Shared

public final class NetworkViewModel: ObservableObject {
    
    @Published var resultText: String = ""
    @Published var toastMessage: String = ""

    private let api: KtorNetworkClient

    init() {
        let config = NetworkConfig(
            baseUrl: "https://www.themealdb.com/api/json/v1/1",
            defaultHeaders: ["Accept": "application/json"],
            timeout: TimeoutConfig(
                connectTimeoutMillis: 15_000,
                requestTimeoutMillis: 20_000,
                socketTimeoutMillis: 20_000
            ),
            enableLogging: true,
            dynamicHeadersProvider: nil
        )

        self.api = KtorNetworkClient(config: config)
    }

    public func fetchCategories() {
        resultText = ""

        api.getJson(
            path: "/categories.php",
            query: [:],
            headers: [:]
        ) { [weak self] json, error in
            DispatchQueue.main.async {

                if let error = error {
                    print("❌ Error: \(error.localizedDescription)")
                    return
                }

                guard let json = json else {
                    print("❌ Empty response")
                    return
                }

                print("✅ Service success %@", json)
            }
        }
    }
}
