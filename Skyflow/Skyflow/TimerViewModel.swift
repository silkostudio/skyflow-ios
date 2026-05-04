//
//  TimerViewModel.swift
//  Skyflow
//
//  Created by Florian N on 04/05/2026.
//

import Foundation
import Combine

class TimerViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var timeRemaining: Int = 25 * 60
    @Published var isRunning: Bool = false
    
    private var timer: AnyCancellable?
    let totalTime: Int = 25 * 60
    
    // MARK: - Computed Properties
    var progress: Double {
        Double(timeRemaining) / Double(totalTime)
    }
    
    var formattedTime: String {
        let minutes = timeRemaining / 60
        let seconds = timeRemaining % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    // MARK: - Methods
    func start() {
        isRunning = true
        timer = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self = self else { return }
                if self.timeRemaining > 0 {
                    self.timeRemaining -= 1
                } else {
                    self.stop()
                }
            }
    }
    
    func stop() {
        isRunning = false
        timer?.cancel()
    }
    
    func reset() {
        stop()
        timeRemaining = totalTime
    }
}
