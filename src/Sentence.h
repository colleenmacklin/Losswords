//
//  Sentence.h
//  Losswords_1
//
//  Created by Colleen Macklin on 3/14/12.
//  Copyright (c) 2012 Parsons School of Design. All rights reserved.
//

//#ifndef Sentence
//#define Sentence

#import "ofMain.h"


class Sentence {
	
    private:
    
    
    
    
    public:
    
    string letter;
        // The object knows its original "home" location
        float homex,homey;
        // As well as its current location
        float x,y;
        // And an angle of rotation
        float theta;
        // The object knows its original "home" location
    vector <string> sLetter;
    //Sentence(string letter, float x, float y);
    Sentence();

    //string letter;
    int color;	

	void update();
	void draw();
    void move();
};

//#endif
