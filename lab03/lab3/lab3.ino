const int potpin = 17;
const int ledpin = 0;

void setup() {
  Serial.begin(9600);
}

void loop() {
  int result= analogRead(potpin)/16;
  Serial.println(result);
  analogWrite(ledpin, result);
  delay(100);
}
