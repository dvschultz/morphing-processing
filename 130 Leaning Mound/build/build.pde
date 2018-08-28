float u,v,w = 0;
float x,y,z,cx,cy,cz,sx,sy,sz = 0;
float uMin,uMax,vMin,vMax,wMin,wMax;
float iter = 125;
float scalar = 75;
void setup() {
  size(600,800,P3D);
  background(0);
  strokeWeight(1);
  stroke(255);
}

void draw() {
	u = 0;
	v = 0;
	uMin = -PI/2; //try -4*PI
	vMin = 0;
	uMax = PI/2; //try 4*PI
	vMax = PI;

	background(0);
	translate(width/2,height/2,0);

	pushMatrix();

	rotateX(frameCount*PI/300);
	rotateY(frameCount*PI/200);
	//scale( (frameCount/1000.0) + 1);
	// rotateZ(frameCount*PI/100);

	//try rotateX(PI/2);
	
	v = 0;
	for(u = uMin; u <= uMax; u+=((uMax-uMin)/iter))  {
	    for(v = vMin; v <= vMax; v+=((vMax-vMin)/iter)) {
	    	cx = cos(u);
	    	cy = sin(u);
	    	cz = v;

	    	sx = sin(cz) * cx;
	    	sy = sin(cz) * cy;
	    	sz = cos(cz);

	    	x = cz * scalar;
	    	y = (cy + sx + sx +sx) * scalar;
	    	z = sx * scalar;
	    	//z = sx * sx * sx * sx * scalar;
	    	point(x,y,z);
	    }
	}
	popMatrix();
	surfaceItems();
}

void surfaceItems() {
    surface.setTitle("FPS = " + (int)frameRate );
}