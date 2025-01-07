import Network

/// Monitors the network connectivity status.
class NetworkMonitor {
    /// Shared instance of the NetworkMonitor.
    static let shared = NetworkMonitor()

    /// The NWPathMonitor instance to track network changes.
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "NetworkMonitorQueue")

    /// Indicates whether the device is connected to the internet.
    private(set) var isConnected: Bool = false

    /// Indicates the type of network connection (e.g., WiFi, cellular).
    private(set) var connectionType: NWInterface.InterfaceType? = nil

    /// Initializes the NetworkMonitor and starts monitoring.
    private init() {
        monitor.pathUpdateHandler = { [weak self] path in
            self?.isConnected = path.status == .satisfied
            self?.connectionType = path.availableInterfaces.first { path.usesInterfaceType($0.type) }?.type
        }
        monitor.start(queue: queue)
    }

    /// Stops the network monitor.
    func stopMonitoring() {
        monitor.cancel()
    }
} 