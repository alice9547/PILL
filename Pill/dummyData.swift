//
//  dummyData.swift
//  Pill
//
//  Created by 김은서 on 2022/06/02.
//

import Foundation

let dummyData = """
[
{
  "_id": {
    "$oid": "628e0148962140251e0e637e"
  },
  "image": "data:image/FXffirvvxV334q778Vd9+Ku+/FXffirvvxV334q778Vd9+Ku+/FXffiru/7WKv8A/9k=",
  "active_ingredient": "프레가발린",
  "efficacy": "1. 성인에서 말초와 중추 신근육통의 치료",
  "uses": "이 약.",
  "precaution": "1. 경다.",
  "DUR": [
    {
      "단일/복합": "단일",
      "DUR성분(성분1/성분2..[병용성분])": "프레가발린",
      "DUR유형": "임부금기",
      "제형": "정제,캡슐",
      "금기 및 주의내용": "2등급",
      "비고": ""
    },
    {
      "단일/복합": "단일",
      "DUR성분(성분1/성분2..[병용성분])": "프레가발린",
      "DUR유형": "용량주의",
      "제형": "캡슐,나정,서방성필름코팅정,서방성다층정",
      "금기 및 주의내용": "600밀리그램밀리그램",
      "비고": ""
    }
  ],
  "product_name": "가벨린정50밀리그램(프레가발린)",
  "appearance": "흰색 또는 연한 노란색의 원형 정제",
  "shape": "원형",
  "manufacturer": "삼일제약(주)"
},
{
  "_id": {
    "$oid": "628e0148962140251e0e637e"
  },
  "image": "data:image/FXffirvvxV334q778Vd9+Ku+/FXffirvvxV334q778Vd9+Ku+/FXffiru/7WKv8A/9k=",
  "active_ingredient": "프레가발린",
  "efficacy": "1. 성인에서 말초와 중추 신근육통의 치료",
  "uses": "이 약.",
  "precaution": "1. 경다.",
  "DUR": [
    {
      "단일/복합": "단일",
      "DUR성분(성분1/성분2..[병용성분])": "프레가발린",
      "DUR유형": "임부금기",
      "제형": "정제,캡슐",
      "금기 및 주의내용": "2등급",
      "비고": ""
    },
    {
      "단일/복합": "단일",
      "DUR성분(성분1/성분2..[병용성분])": "프레가발린",
      "DUR유형": "용량주의",
      "제형": "캡슐,나정,서방성필름코팅정,서방성다층정",
      "금기 및 주의내용": "600밀리그램밀리그램",
      "비고": ""
    }
  ],
  "product_name": "가벨린정50밀리그램(프레가발린)",
  "appearance": "흰색 또는 연한 노란색의 원형 정제",
  "shape": "원형",
  "manufacturer": "삼일제약(주)"
}
]

"""

let dummy = dummyData.replacingOccurrences(of: "\n", with: "|")
