#pragma once

#include "ofMain.h"
#include "ofxiPhone.h"
#include "ofxiPhoneExtras.h"
#include "Letter.h"
#include "Scrollbar.h"

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
    void checkWords(int w);
    
    int centerX;
    int centerY;
    
    string typeStr;
	//Scrollbar HScrollbar;
    
	//ofTrueTypeFont  menlo64;
    //ofTrueTypeFont  menlo14;

    ofPoint p;
    //Letter L;
    //vector<char>  letters;
    //vector<ofTTFCharacter> ofTrueTypeFont::getStringAsPoints(string str){
    vector<ofTTFCharacter> chars;
    vector<ofPoint> pts;
    vector<Letter>  letters;
    vector<Letter>  letters2;

    //vector <string>  s;
    vector<int> lWords;
    vector <ofRectangle> rects;
    
    ofRectangle charRect;
    float touchX;
	char _c;
    float sWidth;
    int myT;
    Boolean t;
    vector<int> tNums;
    float iter;
    int x;
    vector <float> xArray;
//	ofPoint touchPt;
//	ofPoint drag;
//	bool bDragging;


};


