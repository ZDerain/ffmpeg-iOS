//
//  Demuxer.hpp
//  ATIssued_Example
//
//  Created by Derain Zhou on 2022/6/23.
//  Copyright © 2022 ZDerain. All rights reserved.
//

#ifndef Demuxer_hpp
#define Demuxer_hpp

#include <stdio.h>
#include <iostream>

class Demuxer {
public:
    using string_view_type = std::string &;
public:
    Demuxer(string_view_type id);
};

#endif /* Demuxer_hpp */
