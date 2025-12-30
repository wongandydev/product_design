//
//  TemperatureSchedule.swift
//  EightSleepTemperature
//
//  Created by Calvin Chueh on 2/7/25.
//

import Foundation

struct TemperatureState {
    var currentTemperature: Temperature
    var currentPhase: TemperaturePhase
    var schedule: TemperatureSchedule
    var power: TemperaturePower
}

enum TemperaturePower {
    case on
    case off
}

struct TemperatureSchedule {
    var bedtime: Temperature
    var night: Temperature
    var dawn: Temperature
}
