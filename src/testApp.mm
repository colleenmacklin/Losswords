#include "testApp.h"

//--------------------------------------------------------------
void testApp::setup(){	
	// register touch events
	ofRegisterTouchEvents(this);
	
	// initialize the accelerometer
	ofxAccelerometer.setup();
    //ofTrueTypeFont::setGlobalDpi(72);

	//iPhoneAlerts will be sent to this.
	//ofxiPhoneAlerts.addListener(this);
	
	//If you want a landscape oreintation 
	iPhoneSetOrientation(OFXIPHONE_ORIENTATION_LANDSCAPE_RIGHT);
	
	ofBackground(0,0,0);
    
    centerX = ofGetWidth()/2.0;
    centerY = ofGetHeight()/2.0;

    
    franklinBook64.loadFont("frabk.ttf", 64);
	franklinBook64.setLineHeight(28.0f);
	franklinBook64.setLetterSpacing(1.037);

    
    franklinBook14.loadFont("frabk.ttf", 14);
	franklinBook14.setLineHeight(28.0f);
	franklinBook14.setLetterSpacing(1.037);

    typeStr = "It was not such an awful voice";
    
    //Sentence S(typeStr, 50, centerY);
    
    //Sentence s;
    for (int i=0; i<typeStr.length(); i++){
        string my_L;
        my_L.push_back(typeStr[i]);

        S.sLetter.push_back(my_L);
        //s.letter.push_back(my_L);

        
//        _c=typeStr[i];
//       // letters[i]=_c;
//       // letters[i] = new Letter(centerX,centerY,typeStr.charAt(i)); 
    }
//    
//    for (int i=0; i<S.letters.size(); i++) {
//        string my_L;
//        my_L.push_back(S.letters[i]);
//        S.sLetter.push_back(my_L);
//    }
//    int x = 50;
//    for (int i = 0; i < typeStr.length(); i++) {
//        s[i] = new Sentence(x,centerY,typeStr.at(i)); 
//        x += textWidth(typeStr.at(i));
//    }
    x = 40;
    iter = 0;
}

//--------------------------------------------------------------
void testApp::update(){

}

//--------------------------------------------------------------
void testApp::draw(){
    ofSetColor(225);
    iter-=.5;
    int l_x = 40;
//
    for (int i=0; i<S.sLetter.size(); i++){
        if (i==myT) {
            tNums.push_back(i);
            ofSetColor(225,0,0);
        }else{
            ofSetColor(225);

        }
        sWidth=franklinBook14.stringWidth(S.sLetter[i]);
        franklinBook14.drawString(S.sLetter[i], l_x, 280);
        
//      hack to keep spacing nice...
        if (S.sLetter[i]==" ") {
           l_x += (sWidth+5);
        }
        else{
            l_x += (sWidth+3);
        }
    }
    
    x=40+iter;  //comment out to stop moving
    //x=40;
    
    for (int i=0; i<S.sLetter.size(); i++){
        if (i==myT) {
            tNums.push_back(i);
            //S.sLetter[i].color = 100;
            ofSetColor(225,0,0);
        }else{
            ofSetColor(225);
            
        }

        sWidth=franklinBook64.stringWidth(S.sLetter[i]);
        franklinBook64.drawString(S.sLetter[i], x, centerY);
        rect.push_back(franklinBook64.getStringBoundingBox(S.sLetter[i], x+sWidth, centerY));

        //hack to keep spacing nice...
        if (S.sLetter[i]==" ") {
            x += (sWidth+10);
        }
        else{
            x += (sWidth+8);
        }
        
    }

    //DRAW A CIRCLE, THEN A LINE TO THE LAST CIRCLE -- PUT IN TOUCHDOWN AND TOUCHUP, COLOR SPAN IN THE SENTENCES

     string info = "";
     //info += "FPS: "+ofToString(ofGetFrameRate(), 1)+"\n";
    info += "S.sLetter.size(): "+ofToString(S.sLetter.size())+"\n";
    //info += "X: "+ofToString(x)+"\n";
    info+= "rect[0].x: "+ofToString(rect[0].x)+"\n";
    info+= "rect[0].y: "+ofToString(rect[0].y)+"\n";
    info+= "rect[0].width: "+ofToString(rect[0].width)+"\n";
    info+= "touched? "+ofToString(myT)+"\n";

     ofSetHexColor(0x444342);
     ofDrawBitmapString(info, 30, 30);
    
	
}

//--------------------------------------------------------------
void testApp::exit(){

}

//--------------------------------------------------------------
void testApp::touchDown(ofTouchEventArgs &touch){
    t=true;
    //gotta fix this so that each of the rects registers a touch
    for (int i=0; i<S.sLetter.size(); i++){
        //for (int i=0; i<1; i++){

        if ((touch.x>=rect[i].x-rect[i].width&&touch.x<=rect[i].x)&&(touch.y>=rect[i].y&&touch.y<=rect[i].y+rect[i].height)){
            t=true;
            myT = i;
            break;

        }
        else{
            myT=-1;
        }
    }

}

//--------------------------------------------------------------
void testApp::touchMoved(ofTouchEventArgs &touch){

}

//--------------------------------------------------------------
void testApp::touchUp(ofTouchEventArgs &touch){

}

//--------------------------------------------------------------
void testApp::touchDoubleTap(ofTouchEventArgs &touch){

}

//--------------------------------------------------------------
void testApp::lostFocus(){

}

//--------------------------------------------------------------
void testApp::gotFocus(){

}

//--------------------------------------------------------------
void testApp::gotMemoryWarning(){

}

//--------------------------------------------------------------
void testApp::deviceOrientationChanged(int newOrientation){

}


//--------------------------------------------------------------
void testApp::touchCancelled(ofTouchEventArgs& args){

}

