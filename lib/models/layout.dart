//
//  layout.dart
//
//  Created by Denis Bystruev on 03/03/2020.
//
//  Layout defines how items are positioned within a look

enum Layout {
  //  Items layouts:

  //  1 1-2 1-2 1-2 1-2 1-2
  //        3-↓ 3-4 3-4 3-4
  //                5-↓ 5-6
  bottom_left,

  //  1 1-2 1-2 1-2 1-2 1-2
  //        ↓-3 3-4 3-4 3-4
  //                ↓-5 5-6
  bottom_right,
}