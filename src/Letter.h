//
//  Letter.h
//  Losswords_1
//
//  Created by Colleen Macklin on 3/14/12.
//  Copyright (c) 2012 Parsons School of Design. All rights reserved.
//

//#ifndef Letter
//#define Letter

//#import "ofMain.h"
#include "ofMain.h"



class Letter {
    
public:
    
    //    ofTrueTypeFont  menlo64;
        ofTrueTypeFont  menlo14;
    Letter(float x, float y, string letter, int typeSize);
    
    string letter;
    // The object knows its original "home" location
    float homex,homey;
    // As well as its current location
    float x,y;
    // And an angle of rotation
    float theta;
    // The object knows its original "home" location
    vector <string> sLetter;
    //Letter();
    vector <ofRectangle> rect;
    
    ofRectangle myRect;
    
    int highlight_type;
    //string letter;
    int color;	
    int typeSize;
	void update();
	void draw();
    void move();
    void home();
    bool inside(float x, float y);
    void highlight(int type);
    private:
    
    
    
    
};

//#endif
    
