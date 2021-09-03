color red = color(255, 0, 0);
color black = color(0, 0, 0);

void setup(){
  size(500, 500);
  background(255);
  
  drawSpade(150, 150, 200, 200);
  drawHeart(300, 100, 200, 200);
}

void drawSpade(float x, float y,
               float xwidth, float yheight) {
  
  float bottomWidth  = xwidth*0.5;
  float topHeight    = yheight*0.7;
  float bottomHeight = yheight*0.3;
                 
  stroke(0);
  strokeWeight(5);
  fill(black);
  
  beginShape();
    vertex(x, y); // Starting point.
    
    // Parte superior izquierda:
    bezierVertex(
      x, y + topHeight/2,            // Control 1
      x - xwidth/2, y + topHeight/2, // Control 2
      x - xwidth/2, y + topHeight    // Final
    );
    
    // Parte inferior izquierda:
    bezierVertex(
      x - xwidth/2, y + topHeight * 1.5,  // Control 1
      x, y + topHeight * 1.5,             // Control 2
      x, y + topHeight                    // Final
    );
    
    // Parte inferior derecha:
    bezierVertex(
      x, y + topHeight * 1.5,             // Control 1
      x + xwidth/2, y + topHeight * 1.5,  // Control 2
      x + xwidth/2, y + topHeight         // Final
    );
    
    // Parte superior derecha:
    bezierVertex(
      x + xwidth/2, y + topHeight/2,  // Control 1
      x, y + topHeight/2,             // Control 2
      x, y                            // Final
    );
  endShape();
  
  // El tallo:
  beginShape();
    vertex(x, y + topHeight);
    
    quadraticVertex(
      x, y + topHeight + 1.5*bottomHeight,
      x - bottomWidth/2, y + topHeight + 1.5*bottomHeight
    );
    
    vertex(x + bottomWidth / 2, y + topHeight + 1.5*bottomHeight);
    
    quadraticVertex(
      x, y + topHeight + 1.5*bottomHeight,
      x, y + topHeight
    );
    
  endShape();
}

void drawHeart(float x, float y,
               float xwidth, float yheight) {
  
  float bottomWidth  = xwidth*0.7;
  float topHeight    = yheight*0.7;
  float bottomHeight = yheight*0.3;
              
  stroke(red);
  strokeWeight(5);
  fill(red);
  
  translate(x, 3*y);
  rotate(radians(180));
  
  x = 0; y = 0;
  
  beginShape();
    vertex(x, y); // Starting point.
    
    // Parte superior izquierda:
    bezierVertex(
      x, y + topHeight/2,            // Control 1
      x - xwidth/2, y + topHeight/2, // Control 2
      x - xwidth/2, y + topHeight    // Final
    );
    
    // Parte inferior izquierda:
    bezierVertex(
      x - xwidth/2, y + topHeight * 1.5,  // Control 1
      x, y + topHeight * 1.5,             // Control 2
      x, y + topHeight                    // Final
    );
    
    // Parte inferior derecha:
    bezierVertex(
      x, y + topHeight * 1.5,             // Control 1
      x + xwidth/2, y + topHeight * 1.5,  // Control 2
      x + xwidth/2, y + topHeight         // Final
    );
    
    // Parte superior derecha:
    bezierVertex(
      x + xwidth/2, y + topHeight/2,  // Control 1
      x, y + topHeight/2,             // Control 2
      x, y                            // Final
    );
    
  endShape();
  
  
  
}
