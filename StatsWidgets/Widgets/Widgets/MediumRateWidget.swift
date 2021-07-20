//
//  SmallRateWidget.swift
//  StatsWidgetsExtension
//
//  Created by Andrey Chernyshev on 12.07.2021.
//

import WidgetKit
import SwiftUI

struct MediumRateWidget: Widget {
    let placeholder = StatsContent(date: Date(),
                                   passRate: 75,
                                   testTaken: 0,
                                   testsTakenNum: 10,
                                   correctAnswers: 0,
                                   correctAnswersNum: 374,
                                   questionsTaken: 0,
                                   answeredQuestions: 400)
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: "MediumRateWidget", provider: Provider(placeholder: placeholder)) { entry in
            VStack(alignment: .leading) {
                VStack(alignment: .center) {
                    PassRateView(title: "Widgets.PassRate".localized,
                                 progressFontSize: 19.scale,
                                 progress: entry.passRate / 100,
                                 titleColor: Color.make(244, green: 169, blue: 67),
                                 progressColor: Color.make(198, green: 54, blue: 136))
                    Spacer()
                    HStack() {
                        MediumVerticalRateView(count: entry.testsTakenNum,
                                               title: "Widgets.TestsTaken".localized,
                                               color: Color.make(244, green: 169, blue: 67))
                        Spacer()
                        MediumVerticalRateView(count: entry.correctAnswersNum,
                                               title: "Widgets.CorrectAnswers".localized,
                                               color: Color.make(198, green: 54, blue: 136))
                        Spacer()
                        MediumVerticalRateView(count: entry.answeredQuestions,
                                               title: "Widgets.QuestionsTaken".localized,
                                               color: Color.make(120, green: 55, blue: 244))
                    }
                }
                .padding(16)
            }
        }
        .supportedFamilies([.systemMedium])
        .configurationDisplayName("Widgets.Medium.Name".localized)
        .description("Widgets.Medium.Description".localized)
    }
}
