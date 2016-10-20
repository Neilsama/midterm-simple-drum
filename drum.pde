import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import processing.serial.*;

import cc.arduino.*;
import org.firmata.*;

Arduino arduino;
Minim minim;
AudioSample kick;
AudioSample snare;
AudioSample hihat;

void setup(){
  //frameRate(250);
  size(50,50);
  arduino = new Arduino(this, Arduino.list()[1], 57600);
  
  minim = new Minim(this);
  kick = minim.loadSample("kick.wav", 512);
  snare = minim.loadSample("snare.wav", 512);
  hihat = minim.loadSample("hihat.wav", 512);
  println("load");
}

void draw(){
  int drum1 = arduino.analogRead(2);
  int drum2 = arduino.analogRead(1);
  int cha = arduino.analogRead(0);
  
  if(drum1 != 0){
    println(drum1);
    kick.trigger();
    delay(100);   
  }
  if(drum2 !=0){
    println("snare"+drum2);
    snare.trigger();
    delay(100);   
  }
  if(cha !=0){
    println("cha"+cha);
    hihat.trigger();
    delay(100);   
  }
}