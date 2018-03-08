/**
 * Sketch : Ombelline Blaise
 */

class SceneTwentyTwo extends Scene {

  int step, i=0, num=26;
  float theta; //theta=angle

  void setup() {
    student = "Ombelline Blaise";
    title = "Ohm";
    sketchCode = "sketch_22.pde";
    code = loadPde(sketchCode);
    step=width/num;
  }

  void draw() {

    pushMatrix();
    pushStyle();
    background(#FFCBBF);
     fill(#62B295);
     noStroke();
     ellipse(width/2,height/2,width*.6, height*.6);

     for (int x=2*step; x<width-2*step+1; x += step) {
       float sw = map(sin(theta+(TWO_PI/num*i)), -1, 1, 2.5, 20);
       float edge = 2*step;
       stroke(#FFCBBF);
       strokeWeight(sw);
      line(x, edge, x, height-edge);//tout remplacer si remplace un sinon envoie dans le ciel puisque step était en hauteur
     }
     theta += .005; //vitesse car dans map


    popStyle();
    popMatrix();
  }
}