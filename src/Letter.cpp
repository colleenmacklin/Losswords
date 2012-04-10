//
//  Letter.cpp
//  Losswords_1
//
//  Created by Colleen Macklin on 3/14/12.
//  Copyright (c) 2012 Parsons School of Design. All rights reserved.
//

//#include <iostream>
#include "Letter.h"

Letter::Letter(float x_, float y_, string letter_, int typeSize_)
{
    homex = x = x_;
    homey = y = y_;
    letter = letter_;
    typeSize = typeSize_;
    color = 255;
    
//    menlo64.loadFont("Menlo.ttc", 64);
//	menlo64.setLineHeight(28.0f);
//	menlo64.setLetterSpacing(1.037);
//    
//    
    menlo14.loadFont("mono.ttf", typeSize);
//	menlo14.setLineHeight(28.0f);
	menlo14.setLetterSpacing(1.037);

}

void Letter::update()
{
    
}

void Letter::draw()
{
    ofSetColor(color);
    
    menlo14.drawString(letter, x, y);
    //menlo14.drawString("hello", 10, 150);
    
    rect.push_back(menlo14.getStringBoundingBox(letter, x, y));
    myRect = menlo14.getStringBoundingBox(letter, x, y);
    
    if (highlight_type==1) {
        ofNoFill();
        ofRect(myRect.x, myRect.y, myRect.width, myRect.height);
    }
    if (highlight_type==2) {
        ofFill();
        ofSetRectMode(OF_RECTMODE_CENTER);
        ofSetColor(255, 255, 255);
        ofRect(myRect.x+myRect.width/2, myRect.y+myRect.height/2, myRect.width+(typeSize/5), myRect.height+(typeSize/5));

        ofSetColor(0,0,0);
        menlo14.drawString(letter, x, y);

    }

}

void Letter::move()
{
    //move the whole unit
    x+=.5;
    
}

void Letter::home(){
    x = homex;
    y = homey; 

}

void Letter::highlight(int type){
    if (type == 0) {
        highlight_type = 0;
    }   
    
    if (type == 1) {
        highlight_type = 1;
    }    

    if (type == 2) {
        highlight_type = 2;
    }    

}


bool Letter::inside(float px, float py){
	if( px >= x && py <= y && px <= (x + myRect.width) && py <= (y + myRect.height)){
        return true;
	}
	return false;
}
