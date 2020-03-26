//
//  ListElement.swift
//  PresidentsTimePeriods
//
//  Created by Nicholas Grant on 3/23/20.
//  Copyright © 2020 nicholasgrant. All rights reserved.
//

import SwiftUI

struct ListElement: Identifiable {
    var id = UUID()
    var icon: String
    var image: String
    var title: String
    var text: String
}
