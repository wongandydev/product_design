//
//  TemperatureService.swift
//  EightSleepTemperature
//
//  Created by Calvin Chueh on 2/7/25.
//

import Combine
import Foundation

protocol TemperatureService {
    var state: AnyPublisher<TemperatureState, Never> { get }
    func update(power: TemperaturePower) -> AnyPublisher<Void, Never>
    func update(phase: TemperaturePhase, temperature: Temperature) -> AnyPublisher<Void, Never>
}

final class TemperatureServiceImpl: TemperatureService {
    
    private let _state: CurrentValueSubject<TemperatureState, Never> = .init(
        .init(
            currentTemperature: .init(value: 0),
            currentPhase: .bedtime,
            schedule: .init(
                bedtime: .init(value: 1),
                night: .init(value: -1),
                dawn: .init(value: 5)
            ),
            power: .off
        )
    )
    
    var state: AnyPublisher<TemperatureState, Never> {
        _state.eraseToAnyPublisher()
    }
    
    private var cancellables: Set<AnyCancellable> = []
    
    func update(phase: TemperaturePhase, temperature: Temperature) -> AnyPublisher<Void, Never> {
        Just(())
            .delay(for: 1, scheduler: RunLoop.main)
            .handleEvents(receiveOutput: { [weak self] in
                guard let self else { return }
                var newState = self._state.value
                switch phase {
                case .bedtime:
                    newState.schedule.bedtime = temperature
                case .night:
                    newState.schedule.night = temperature
                case .dawn:
                    newState.schedule.dawn = temperature
                }
                _state.send(newState)
            })
            .eraseToAnyPublisher()
    }
    
    func update(power: TemperaturePower) -> AnyPublisher<Void, Never> {
        Just(())
            .delay(for: 1, scheduler: RunLoop.main)
            .handleEvents(receiveOutput: { [weak self] in
                guard let self else { return }
                var newState = self._state.value
                newState.power = power
                _state.send(newState)
            })
            .eraseToAnyPublisher()
    }
}


extension Publisher {
    
    func mapVoid() -> AnyPublisher<Void, Failure> {
        return map { _ in () }.eraseToAnyPublisher()
    }
}
