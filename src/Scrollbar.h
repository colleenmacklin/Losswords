//
//  Scrollbar.h
//  Losswords_1
//
//  Created by Colleen Macklin on 4/10/12.
//  Copyright (c) 2012 Parsons School of Design. All rights reserved.
//
#include "ofMain.h"

//#ifndef Losswords_1_Scrollbar_h
//#define Losswords_1_Scrollbar_h


class Scrollbar {
    
public:
    int swidth, sheight;    // width and height of bar
    int xpos, ypos;         // x and y position of bar
    float ratio;
    float spos, newspos;    // x position of slider
    int sposMin, sposMax;   // max and min values of slider
    int loose;              // how loose/heavy
    
    bool locked;
    bool over;
    bool pressed;
    
    Scrollbar(int xp, int yp, int sw, int sh, int l);
    bool sOver();
    
    void update();
	void draw();
    int constrain(int val, int minv, int maxv);
    float getPos();
    float touchX, touchY;
    
    private:
};



//#endif
