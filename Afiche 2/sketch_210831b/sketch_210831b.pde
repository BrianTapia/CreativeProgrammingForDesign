color red = color(160, 0, 0);
color black = color(0, 0, 0);
color w = color(255);
color golden = color(212, 175, 55);

color sc = w;
float sw = 1;
int alpha = 100;

void setup(){
  size(600, 900);
  background(black);
  
  // DIBUJA EL FONDO CON LAS FIGURAS DE LAS CARTAS.
  int i; int j;
  int margin = 0;
  for(j = margin; j <= height - margin; j = j+50){
    for(i = margin; i <= width - margin; i = i+50){
      stroke(10);
      fill(black);
      //ellipse(i, j, 10, 10);
      drawRandom(i, j, 65, 65, true);
    }
  }
  
  // BORDE NEGRO:
  stroke(black);
  strokeWeight(40);
  noFill();
  rect(0, 0, width, height);
  
  // PUZZLES AL MEDIO + REGIÓN OPACA + TRÉBOLES
  noStroke();
  fill(black, 200);
  rect(0, 400, width, 100);
  
  PFont fuente; //crear variable para la fuente
  fuente = createFont("poker.ttf", 48); 
  
  textFont(fuente);
  textSize(100);
  fill(w);
  text("Puzzles", 125, 490);
  
  drawClover(80, 450, 20, 20, true, w);
  drawClover(600 - 80, 450, 20, 20, true, w);
  
  // THAT'S THE PUZZLE...
  
  noStroke();
  fill(black, 200);
  rect(300, 810, 250, 50);
  
  fuente = loadFont("SnellRoundhand-48.vlw"); 
  
  textFont(fuente);
  textSize(30);
  fill(w);
  text("That's the puzzle...", 320, 845);

  // Guardo el resultado:
  save("Afiche.tif");
}

void drawRandom(float x, float y,
                 float xwidth, float yheight,
                 boolean fill){
                  
  int choice;
  choice = int(random(0, 3));
  
  float angle;
  angle = random(0, 360);
  //angle = 180;
       
  if (choice == 0) {
    // VERIFICADO QUE ROTA BIEN.
    println("drawDiamond");
    
    translate(x, y);
    rotate(radians(angle));
    x = 0; y = 0;  
    
    drawDiamond(x, y, 2*xwidth/4, 2*yheight/4, fill, red);  
    resetMatrix();
    
  } 
  
  else if (choice == 1) {
    // VERIFICADO QUE ROTA BIEN.
    println("drawHeart");

    translate(x, y);
    rotate(radians(angle));
    x = 0; y = 0;  
    
    drawHeart(x, y-yheight/2, xwidth, yheight, fill, red);  
    resetMatrix();
    
  } 
  
  else if (choice == 2) {
    // VERIFICADO QUE ROTA BIEN.
    println("drawSpade");
    
    translate(x, y);
    rotate(radians(angle));
    x = 0; y = 0;  
    
    drawSpade(x, y-yheight/2, xwidth, yheight, fill, black);  
    resetMatrix();
  } 
  
  else {
    println("drawClover"); 
  }
                 
  resetMatrix();
                 }

void drawClover(float x, float y,
                 float xwidth, float yheight,
                 boolean fill, color col){

  float bottomWidth  = xwidth*0.7;
  float topHeight    = yheight*0.7;
  float bottomHeight = yheight*0.3;
  

  
  stroke(sc);
  strokeWeight(sw);
  fill(col, 255);
  if(fill == false){noFill();}
  
  PShape clover = createShape(GROUP);
  
  PShape lob1 = createShape(ELLIPSE, x, y-1*yheight/4, xwidth, yheight);
  PShape lob2 = createShape(ELLIPSE, x - xwidth/2, y + yheight/2, xwidth, yheight);
  PShape lob3 = createShape(ELLIPSE, x + xwidth/2, y + yheight/2, xwidth, yheight);
  PShape lob4 = createShape(ELLIPSE, x, y+yheight/3, xwidth/2, yheight/2);
  
  // El tallo:
  clover.addChild(lob1);
  clover.addChild(lob2);
  clover.addChild(lob3);
  clover.addChild(lob4);
  
  beginShape();
    vertex(x, y + yheight/2);
    
    quadraticVertex(
      x, y + topHeight + 1.5*bottomHeight,
      x - bottomWidth/2, y + topHeight + 1.5*bottomHeight
    );
    
    vertex(x + bottomWidth / 2, y + topHeight + 1.5*bottomHeight);
    
    quadraticVertex(
      x, y + topHeight + 1.5*bottomHeight,
      x, y + yheight/2
    );
    
 
  endShape();

  shape(clover);
}

void drawDiamond(float x, float y,
                 float xwidth, float yheight,
                 boolean fill, color col) {
                 
  stroke(sc);
  strokeWeight(sw);
  fill(col, alpha);
  if(fill == false){noFill();}
  
  shininess(5.0);
  
  beginShape();
    vertex(x, y - yheight);
    
    bezierVertex(
      x, y - yheight,
      x, y,
      x + xwidth, y
    );
    
    bezierVertex(
      x + xwidth, y,
      x, y,
      x, y + yheight
    );
    
    bezierVertex(
      x, y + yheight,
      x, y,
      x - xwidth, y
    );
    
    bezierVertex(
      x - xwidth, y,
      x, y,
      x, y - yheight
    );
    
  endShape();
}


void drawSpade(float x, float y,
               float xwidth, float yheight,
               boolean fill, color col) {
  
  float bottomWidth  = xwidth*0.5;
  float topHeight    = yheight*0.7;
  float bottomHeight = yheight*0.3;
                 
  stroke(sc);
  strokeWeight(sw);
  fill(col, alpha);
  if(fill == false){noFill();}
  
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
               float xwidth, float yheight,
               boolean fill, color col) {
  
  float bottomWidth  = xwidth*0.7;
  float topHeight    = yheight*0.7;
  float bottomHeight = yheight*0.3;
              
  stroke(sc);
  strokeWeight(sw);
  fill(col, alpha);
  if(fill == false){noFill();}
  
  shininess(5.0);
  
  //translate(x, 3*y);
  //rotate(radians(180));
  
  //x = 0; y = 0;
  
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
  
  //resetMatrix();
  
}
