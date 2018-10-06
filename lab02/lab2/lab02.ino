char receive_num;
void setup() {
  Serial.begin(9600);          
  pinMode(LED_BUILTIN, OUTPUT);
}

void loop() {
  if(Serial.available() > 0){     
    receive_num = Serial.read();  
    Serial.println(receive_num);
  }

  if(receive_num == '1')
    digitalWrite(LED_BUILTIN, HIGH);
  else if(receive_num == '2')
    digitalWrite(LED_BUILTIN, LOW);
}
