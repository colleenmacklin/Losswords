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
    ofSetColor(225,0,0);

    ofNoFill();
    //ofRect(xpos, ypos, swidth, sheight);
//    if(over || locked) {
//        fill(153, 102, 0);
//    } else {
//        fill(102, 102, 102);
//    }
    ofRect(spos, ypos, 120, sheight);

}

void Scrollbar::update(){
//    if(over()) {
//        over = true;
//    } else {
//        over = false;
//    }
    if(pressed) {
        locked = true;    
    }
    if(!pressed) {
        locked = false;
    }
    if(locked) {
        newspos = constrain(touchX-sheight/2, sposMin, sposMax);
    }
    if(abs(newspos - spos) > 1) {
        spos = spos + (newspos-spos)/loose;
    }

}


int Scrollbar::constrain(int val, int minv, int maxv) {
    return min(max(val, minv), maxv);
}

bool Scrollbar::sOver() {
    if(touchX > xpos && touchX < xpos+swidth &&
       touchY > ypos && touchY < ypos+sheight) {
        return true;
    } else {
        return false;
    }
}


float Scrollbar::getPos() {
    // Convert spos to be values between
    // 0 and the total width of the scrollbar
    return spos * ratio;
}
