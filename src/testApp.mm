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
    iter-=.1; //speed of moving
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
    
    //DRAWING THE MAIN TEXT
    x=40;    
   // x=40;
    
    for (int i=0; i<S.sLetter.size(); i++){
        if (i==myT) {
            tNums.push_back(i);
            //S.sLetter[i].color = 100;
            ofSetColor(225,0,0);
        }else{
            ofSetColor(225);
            
        }
        if (S.sLetter[i]==" ") {
            x += (sWidth+10);
        }
        else{
            x += (sWidth+8);
        }

        sWidth=franklinBook64.stringWidth(S.sLetter[i]);
        
        ofPushMatrix();
        ofTranslate(x+iter, 0);
        franklinBook64.drawString(S.sLetter[i], 0, centerY);
        //franklinBook64.drawString(S.sLetter[i], x, centerY);

        //if not MOVING
        //rect.push_back(franklinBook64.getStringBoundingBox(S.sLetter[i], x+sWidth, centerY));
        rect.push_back(franklinBook64.getStringBoundingBox(S.sLetter[i], sWidth, centerY));

        //if MOVING
        //rect.push_back(franklinBook64.getStringBoundingBox(S.sLetter[i], x+sWidth+iter, centerY));

        ofNoFill();
        ofSetHexColor(0xCCCCCC);

        ofRect(rect[i].x-rect[i].width, rect[i].y, rect[i].width, rect[i].height);
        
        //probably need to make an iterator
        
//        vector <Particle>::iterator iter = particles.begin();
//        while (iter != particles.end()) {
//            iter->update();
//            ofVec2f center_w = ofVec2f(centerX, centerY);
//            if(iter->getPosition().x>740 || iter->getPosition().x<0 || iter->getPosition().y>1024 || iter->getPosition().y<0) {
//                iter->dead=true;
//            }
//            if(iter->dead) {
//                printf("\n\nDEAD\n\n");
//                iter->destroy();
//                particles.erase(iter);
//            }
//            
//            else ++iter;
//        }
//        vector <int>::iterator iter = xArray.begin();
//        while (iter != xArray.end()) {
            
        for (int i=0; i<S.sLetter.size(); i++){
       //xArray[i]=rect[i].x;
            xArray[i]=2;

        }
        
        //if MOVING
        //ofRect((rect[i].x-rect[i].width)+iter, rect[i].y, rect[i].width, rect[i].height);
        ofPopMatrix();

        //hack to keep spacing nice...
        
        
    }

    //DRAW A CIRCLE, THEN A LINE TO THE LAST CIRCLE -- PUT IN TOUCHDOWN AND TOUCHUP, COLOR SPAN IN THE SENTENCES

     string info = "";
     //info += "FPS: "+ofToString(ofGetFrameRate(), 1)+"\n";
    info += "S.sLetter.size(): "+ofToString(S.sLetter.size())+"\n";
    info += "X: "+ofToString(x)+"\n";
    info+= "rect[0].x: "+ofToString(rect[3].x+iter)+"\n";
    //info+= "rect[0].y: "+ofToString(rect[0].y)+"\n";
    info+= "rect[0].width: "+ofToString(rect[0].width)+"\n";
    info+= "touch.x: " + ofToString(touchX) +"\n";
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
       // touchX = touch.x+iter;
        touchX = touch.x;
//        if ((touch.x-48 <= rect[i].x+rect[i].width&& touch.x-48>=rect[i].x)&&(touch.y>=rect[i].y&&touch.y<=rect[i].y+rect[i].height)){
            if ((touch.x-xArray[i]+iter >= rect[i].x-rect[i].width && touch.x-xArray[i]+iter<=rect[i].x)&&(touch.y>=rect[i].y&&touch.y<=rect[i].y+rect[i].height)){

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

