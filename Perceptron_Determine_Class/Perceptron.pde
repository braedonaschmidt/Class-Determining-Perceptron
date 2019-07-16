public class Perceptron {
  float[] weights = new float[2]; // 0 is x, 1 is y
  float LEARNING_RATE = 0.01;
  
  public Perceptron() {
    for (int i = 0; i < weights.length; i++) {
      weights[i] = random(-1, 1);
    }
  }
  
  //------------------------------------------------------------------------
  
  public int guess(PVector pt) {
    // need to implement bias
    return step(weights[0] * pt.x + weights[1] * pt.y);
  }
  
  public int step(float num) {
    // 0 is counted as positive
    return (num >= 0)? 1: -1;
  }
  
  public void train(PVector point) {
    float error = calcActual(point) - guess(point);
    weights[0] += error * point.x * LEARNING_RATE;
    weights[1] += error * point.y * LEARNING_RATE;
  }
  
  public int calcActual(PVector pt) {
    // line is y=x, on the line = 1
    if (pt.y / pt.x >= 1) return 1;
    return -1;
  }
  
  public float calcAvgError(PVector[] points) {
    int totalError = 0;
    
    for (PVector point: points) {
      totalError += calcActual(point) - guess(point);
    }
    
    return totalError / points.length;
  }
}
