//
//  Scrollbar.cpp
//  Losswords_1
//
//  Created by Colleen Macklin on 4/10/12.
//  Copyright (c) 2012 Parsons School of Design. All rights reserved.
//

//#include <iostream>
#include "Scrollbar.h"

Scrollbar::Scrollbar(int xp, int yp, int sw, int sh, int l) 
{
    swidth = sw;
    sheight = sh;
    int widthtoheight = sw - sh;
    ratio = (float)sw / (float)widthtoheight;
    xpos = xp;
    ypos = yp-sheight/2;
    spos = xpos + swidth/2 - sheight/2;
    newspos = spos;
    sposMin = xpos;
    sposMax = xpos + swidth - sheight;
    loose = l;
}

void Scrollbar::draw(){
    
}

void Scrollbar::update(){
    
}