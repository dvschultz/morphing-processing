float u,v,w = 0;
float x,y,z = 0;
float uMin,uMax,vMin,vMax,wMin,wMax;
float iter = 125;
float scalar = 15;
color c = color(255);
boolean white = true;
float s = 1.0;
void setup() {
  size(600,800,P3D);
  background(0);
  strokeWeight(.75);
  stroke(c);
}

void draw() {
	u = 0;
	v = 0;
	uMin = 0; //try -4*PI
	vMin = 0;
	uMax = 2*PI; //try 4*PI
	vMax = PI;

	// background(0);
	translate(width/2,height/2,0);

	pushMatrix();

	if(frameCount%1000 == 0 && frameCount <= 2000) {
		white = !white;
		if(white) {
			c = color(255);
		} else {
			c = color(0);
		}
		stroke(c);
	} 

	s = ((frameCount%1000)/300.0) + 1.0;

	rotateX(frameCount*PI/300);
	rotateY(frameCount*PI/200);
	scale( s );
	// rotateZ(frameCount*PI/100);

	//try rotateX(PI/2);

	
	
	v = 0;
	for(u = uMin; u <= uMax; u+=((uMax-uMin)/iter))  {
	    for(v = vMin; v <= vMax; v+=((vMax-vMin)/iter)) {
	    	x = ( u * sin(v) * cos(18*u) ) * scalar;
	    	y = ( u * sin(v) * sin(12*u) ) * scalar;
	    	z =  u * cos(v) * scalar;
	    	//z = u* cos(v)*scalar;
	    	point(x,y,z);
	    }
	}
	popMatrix();
	surfaceItems();
}

void surfaceItems() {
    surface.setTitle("FPS = " + (int)frameRate );
}