import processing.pdf.*;
color g = color(150, 200, 0);

void setup(){
  size(900, 500, PDF, "ME5.pdf");
  background(255);
  
  float x; // posición en x.
  for(x = 100; x <= 800; x = x+100){
    float npet = random(6, 12); // n de petalos.
    float y = 250 + random(-20, 40); // posición en y. 
    float elr = random(20, 40); // radio de la elipse (círculo) central. Factor para escalar los pétalos.
    
    drawFlower(npet, x, y, elr, elr);
  }
}

void drawFlower(float n, float xpos, float ypos,
                float xw, float yh){
  
  drawPalo(xpos, ypos, xw, yh);
  drawNPetals(n, xpos, ypos, xw, yh);
  fill(g);
  ellipse(xpos, ypos, xw, yh);
  
}

void drawNPetals(float n, float xpos, float ypos,
                 float xw, float yh){
  
  float angle;
  float auxx; float auxy;
  
  float colr = random(0, 255);
  float colg = random(0, 255);
  float colb = random(0, 255);
  
  float c = 1;
  // Itera sobre el ángulo para hacer calzar n pétalos en la flor.
  for(angle = 0; angle <= 360; angle = angle += 360/n){
    translate(xpos, ypos);
    auxx = xpos; auxy = ypos;
    xpos = 0; ypos = 0;
  
    rotate(radians(angle));
    
    fill(colr/c, colg/c, colb/c); c = c+0.1; // Difumina el color de cada pétalo.
    ellipse(xpos + xw, ypos, 2*xw, yh);

    resetMatrix();
    xpos = auxx; ypos = auxy;
  }
}

void drawPalo(float xpos, float ypos, 
              float xw, float yh){
  fill(g);
  rect(xpos - xw/5, ypos, 2*xw/5, yh*5);
}
