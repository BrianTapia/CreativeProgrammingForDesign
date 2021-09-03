color r = #F54509;
color y = #FCCE2A;
color b = #0B4484;

void setup(){
  size(494, 521);
  background(255);
  
  // --------- No pasan encima de ninguna otra línea.
  verticalLine(35, b);      // (1 V B) (Primera línea Vertical Blue)
  horizontalLine(51, b);    // (1 H B) 
  horizontalLine(484, b);   // (2 H B) Fake, si pasa encima de la (1 V Y) pero es imposible por la (1 V R).
  
  // --------- Aquí se enredan
  
  // Pasan encima de las tres anteriores.
  horizontalLine(14, r);    // 1 H R   // Pasa encima sólo de la (1 V B)
  horizontalLine(215, b);   // 2 H B   // Pasa encima sólo de la (1 V Y) pero es imposible uwu.
  
  // Deben ir en este orden.
  verticalLine(53, y);      // 2 V Y   // Pasa debajo sólo de la (2 H R)
  horizontalLine(347, r);   // 2 H R   // Pasa encima sólo de la (2 V Y)
  
  horizontalLine(37, y);    // 1 H Y   // Pasa debajo sólo de la (1 V R)   
  horizontalLine(504, y);   // 7 H Y
  
  verticalLine(158, r);     // 1 V R   // Pasa encima de la (1 H Y), (1 H B), (2 H B), (4 H Y), (7 H Y)
                                       // Pasa debajo de la (2 H Y), (3 H Y), (5 H Y)
                                       
  // ****** (No deben ir más líneas verticales no amarillas debajo) ******
  // ****** Pero la (2 V R) tiene que ir más abajo porque pasa encima de la (2 H Y) y abajo de la (4 H Y).
  // ****** :(
  
  verticalLine(15, y);      // 1 V Y
  horizontalLine(121, y);   // 2 H Y
  
  verticalLine(458, r);     // 2 V R   // Pasa encima de la (2 H Y)
                                       // Pasa debajo de la (4 H Y)
  
  horizontalLine(327, y);    // 4 H Y
  horizontalLine(231, y);    // 3 H Y
  
  horizontalLine(413, y);    // 5 H Y
  horizontalLine(445, y);    // 6 H Y
  
  // --------- Pasan encima de todo.
  verticalLine(203, y);      // 3 V Y
  verticalLine(318, y);      // 4 V Y
  verticalLine(355, y);      // 5 V Y
  verticalLine(401, y);      // 6 V Y
  verticalLine(426, y);      // 7 V Y
  verticalLine(476, y);      // 8 V Y
  
  // --------- Intersecciones imposibles:
  
  // Intersección imposible entre (1 V R) y (4 H Y).
  // Se arregla con un cuadrado:
  fill(r);
  noStroke();
  rect(153, 322, 11, 11);
  
  // Intersección imposible entre (2 V R) y (1 H Y).
  // Se arregla con un cuadrado:
  fill(y);
  noStroke();
  rect(453, 32, 11, 11);
  
  // Intersección imposible entre (2 V R) y (7 H Y).
  // Se arregla con un cuadrado:
  fill(y);
  noStroke();
  rect(453, 499, 11, 11);
  
  // Intersección imposible entre (1 V Y) y (2 H B).
  // Se arregla con un cuadrado:
  fill(b);
  noStroke();
  rect(10, 210, 11, 11);
  
  save("PietMondriran_NewYorkCity.png");
}

void verticalLine(int x, color col) {
  strokeWeight(11);
  stroke(col);
  line(x, 0, x, 600);
};

void horizontalLine(int y, color col) {
  strokeWeight(11);
  stroke(col);
  line(0, y, 568, y);
};
