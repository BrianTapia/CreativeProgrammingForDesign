size(800, 400);


// A - Escribir apellido usando println()
String a = "***** ***** ***** * *****";
String b = "  *   *   * *   * * *   *";
String c = "  *   ***** ***** * *****";
String d = "  *   *   * *     * *   *";
String e = "  *   *   * *     * *   *";


/// Mostrar en consola...
println( a );
println( b );
println( c );
println( d );
println( e );

// B - Mostrar en la ventana de processing su apellido...
PFont fuente; //crear variable para la fuente
fuente = loadFont("Courier-48.vlw"); 

// dibuja en la ventana
int posx = 20;
textFont(fuente);
textSize(30);
fill(50);
text(a, posx, 100);
text(b, posx, 130);
text(c, posx, 160);
text(d, posx, 190);
text(e, posx, 210);
