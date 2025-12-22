import Foundation
import Combine
import Shared

public final class NetworkViewModel: ObservableObject {

    @Published public var resultText: String = ""
    @Published public var toastMessage: String = ""

    private let api: KtorNetworkClient

    public init() {
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
                guard let self else { return }

                if let error = error {
                    self.toastMessage = "Error: \(error.localizedDescription)"
                    return
                }

                guard let json else {
                    self.toastMessage = "Empty response"
                    return
                }

                self.resultText = json
            }
        }
    }
}
