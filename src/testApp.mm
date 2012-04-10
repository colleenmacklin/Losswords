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
    //ofSetRectMode(OF_RECTMODE_CORNER);
    
    centerX = ofGetWidth()/2.0;
    centerY = ofGetHeight()/2.0;

    typeStr = "It was not such an awful voice";
    
    x = 10;

    for (int i=0; i<typeStr.length(); i++){
       string my_L;
        my_L.push_back(typeStr[i]);

        Letter l = *new Letter(x,150,my_L,64);

        letters.push_back(l);

        if (my_L == " ") {
            x+=32;
        }else{
            x += letters[i].menlo14.stringWidth(my_L)+4;

        }
    }
    
    //reset x
    x=10;
        //radar view
        for (int i=0; i<typeStr.length(); i++){
            string my_L2;
            my_L2.push_back(typeStr[i]);
            
            Letter l2 = *new Letter(x,300,my_L2,14);
            
            letters2.push_back(l2);
            
            if (my_L2 == " ") {
                x+=6;
            }else{
                x += letters2[i].menlo14.stringWidth(my_L2)+2;
            }
        }


    iter = 0;
}

//--------------------------------------------------------------
void testApp::update(){

}

//--------------------------------------------------------------
void testApp::draw(){
    
    
    ofSetColor(225);
    iter-=.1; //speed of moving
//
    for (int i=0; i<letters.size(); i++){
       
        ofSetColor(225,0);
        letters[i].draw();
        letters2[i].draw();

    }
    
    //ofRect(letters[0].myRect.x, letters[0].myRect.y, letters[0].myRect.width, letters[0].myRect.height);
/*        
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

*/
    //DRAW A CIRCLE, THEN A LINE TO THE LAST CIRCLE -- PUT IN TOUCHDOWN AND TOUCHUP, COLOR SPAN IN THE SENTENCES

     string info = "";
     //info += "FPS: "+ofToString(ofGetFrameRate(), 1)+"\n";
//    info += "S.sLetter.size(): "+ofToString(S.sLetter.size())+"\n";
//    info += "X: "+ofToString(x)+"\n";
//    info+= "rect[0].x: "+ofToString(rect[3].x+iter)+"\n";
    //info+= "rect[0].y: "+ofToString(rect[0].y)+"\n";
//    info+= "rect[0].width: "+ofToString(rect[0].width)+"\n";
//    info+= "touch.x: " + ofToString(touchX) +"\n";
//    info+= "touched? "+ofToString(myT)+"\n";
   //info+= "STRINGWIDTH? "+ofToString(menlo14.stringWidth(&typeStr[0]))+"\n";
    //info+= "bounding? "+ofToString(menlo14.getStringBoundingBox(&typeStr[0], 0, 0).width)+"\n";
    info+= "myt "+ofToString(myT)+"\n";
info+= "thisRect.x "+ofToString(letters[0].rect[0].x)+"\n";
    info+="lWords.size(): "+ofToString(lWords.size())+"\n";
     ofSetHexColor(0x444342);
     ofDrawBitmapString(info, 30, 30);
 

}

//--------------------------------------------------------------
void testApp::exit(){

}

//--------------------------------------------------------------
void testApp::touchDown(ofTouchEventArgs &touch){
    
    
    t=true;
    for (int i=0; i<letters.size(); i++){
        if (letters[i].inside(touch.x, touch.y)==true) {
            myT = i;
            //lWords.push_back(i);
            checkWords(i);
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

void testApp::checkWords(int w){
    
    //for(int i=0; i<lWords.size(); i++){
        //if (lWords.size()>=4) {
    if (letters[w].highlight_type==2){

            letters[w].highlight_type=0;
            letters2[w].highlight_type=0;

    }else
        letters[w].highlight_type = 2;
        letters2[w].highlight_type = 2;

}

