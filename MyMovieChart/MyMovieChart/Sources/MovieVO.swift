//
//  MovieVO.swift
//  MyMovieChart
//
//  Created by 김현지 on 2019/12/14.
//  Copyright © 2019 김현지. All rights reserved.
//

import Foundation
import UIKit

// 영화 정보를 담기 위한 객체
// Value Object 패턴
class MovieVO {
    var thumbnail: String?  // 영화 섬네일 이미지 주소
    var title: String?      // 영화 제목
    var description: String?    // 영화 설명
    var detail: String?     // 상세정보
    var opendate: String?   // 개봉일
    var rating: Double?     // 평점
    
    // 영화 섬네일 이미지를 담을 UIImage를 추가한다
    var thumbnailImage: UIImage?
}
