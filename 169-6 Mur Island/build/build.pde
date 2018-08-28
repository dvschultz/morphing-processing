float u,v,w = 0;
float x,y,z,cx,cy,cz,sx,sy,sz = 0;
float uMin,uMax,vMin,vMax,wMin,wMax;
float iter = 100;
float scalar = 10;
void setup() {
  size(600,800,P3D);
  background(0);
  strokeWeight(1);
  stroke(255);
}

void draw() {
	u = 0;
	v = 0;
	uMin = 0;
	uMax = 2*PI;
	vMin = 0;
	vMax = PI;

	background(0);
	translate(width/2,height/2,0);

	pushMatrix();

	rotateX(frameCount*PI/300);
	rotateY(frameCount*PI/200);
	//scale( (frameCount/1000.0) + 1);
	// rotateZ(frameCount*PI/100);

	//try rotateX(PI/2);

	//translate(-200,0,0);
	
	v = 0;
	for(u = uMin; u <= uMax; u+=((uMax-uMin)/iter))  {
	    for(v = vMin; v <= vMax; v+=((vMax-vMin)/iter)) {

	    	x = ( u + (10 * cos(v)) ) * scalar;
	    	y = ( u + (10 * sin(v) * cos(u)) ) * scalar;
	    	z = 10 * sin(v) * sin(u)  * scalar; //use sz instead of sy, smaller powers = taller
	    	point(x,y,z);
	    }
	}
	popMatrix();
	surfaceItems();
}

void surfaceItems() {
    surface.setTitle("FPS = " + (int)frameRate );
}