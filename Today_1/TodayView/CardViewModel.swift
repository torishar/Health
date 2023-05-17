//
//  CardViewModel.swift
//  Today_1
//
//  Created by Viktoriia Sharukhina on 18.05.2023.
//

import Foundation

struct ScrollCard {
    var title: String
    var content: String
    var mask: String?
}

class CardViewModel: ObservableObject {
    let scrollCardsData = [
        ScrollCard(title: "Fingers", content: "The fingers and toes are becoming properly separated, losing any webbing. The fingers and toes are becoming properly separated, losing any webbing.", mask: "mask2"),
        ScrollCard(title: "Heartbeat", content: "The fingers and toes are becoming properly separated, losing any webbing. The fingers and toes are becoming properly separated, losing any webbing."),
        ScrollCard(title: "Brain Development", content: "The baby's brain is developing rapidly, with neurons forming at a rate of millions per day. This will continue throughout pregnancy and beyond.", mask: "mask1"),
        ScrollCard(title: "Limb Movement", content: "The baby is now capable of moving their limbs, which can be seen on ultrasound. This is an important milestone in their development."),
        ScrollCard(title: "Vernix Caseosa", content: "The baby is now covered in a protective substance called vernix caseosa, which helps to protect their skin from the amniotic fluid.", mask: "mask2")
        ]
}
