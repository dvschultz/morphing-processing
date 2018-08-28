float u,v,w = 0;
float x0,y0,z0,xw,yw,zw = 0;
float uMin,uMax,vMin,vMax,wMin,wMax;
float iter = 100;
float scalar = 100;
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
	wMin = 0;
	wMax = 2*PI;

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

	    	x0 = sin(v) * cos(u);
	    	y0 = u * (sin(v) * sin(u));
	    	z0 = cos(v) * (13/10); 

	    	xw = sin(sin(x0)) * scalar;
	    	yw = sin(sin(y0)) * scalar;
	    	zw = sin(sin(z0)) * scalar;

	    	point(xw,yw,zw);
	    }
	}
	popMatrix();
	surfaceItems();
}

void surfaceItems() {
    surface.setTitle("FPS = " + (int)frameRate );
}