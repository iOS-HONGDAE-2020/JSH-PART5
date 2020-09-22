//
//  Displayable.swift
//  EcommerceApp
//
//  Created by 정수현 on 2020/09/22.
//  Copyright © 2020 정수현. All rights reserved.
//

import Foundation

protocol Displayable {
    var title_AF: String { get }
    var reservation_grade_AF: Int { get }
    var id_AF: String { get }
    var date_AF: String { get }
    var grade_AF: Int { get }
    var reservation_rate_AF: Double { get }
    var thumb_AF: String { get }
    var user_rating_AF: Double { get }
}

