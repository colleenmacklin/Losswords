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
    int swidth, sheight;
    float ratio;
    int xpos, ypos;
    int spos;
    int newspos;
    int sposMin, sposMax;
    int loose;
    
    Scrollbar(int xp, int yp, int sw, int sh, int l);
    
    void update();
	void draw();

};



//#endif
