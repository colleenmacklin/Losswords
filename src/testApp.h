#pragma once

#include "ofMain.h"
#include "ofxiPhone.h"
#include "ofxiPhoneExtras.h"
#include "Sentence.h"

class testApp : public ofxiPhoneApp {
	
public:
	void setup();
	void update();
	void draw();
	void exit();
	
	void touchDown(ofTouchEventArgs &touch);
	void touchMoved(ofTouchEventArgs &touch);
	void touchUp(ofTouchEventArgs &touch);
	void touchDoubleTap(ofTouchEventArgs &touch);
	void touchCancelled(ofTouchEventArgs &touch);

	void lostFocus();
	void gotFocus();
	void gotMemoryWarning();
	void deviceOrientationChanged(int newOrientation);
    
    int centerX;
    int centerY;
    
    string typeStr;
	
	ofTrueTypeFont  franklinBook64;
    ofTrueTypeFont  franklinBook14;

    ofPoint p;
    Sentence S;
    //vector<char>  letters;
    //vector<ofTTFCharacter> ofTrueTypeFont::getStringAsPoints(string str){
    vector<ofTTFCharacter> chars;
    vector<ofPoint> pts;
    vector<Sentence>  s;
    //vector <string>  s;

    vector <ofRectangle> rect;
	char _c;
    float sWidth;
    int myT;
    Boolean t;
    vector<int> tNums;
    float iter;
    int x;
//	ofPoint touchPt;
//	ofPoint drag;
//	bool bDragging;


};


