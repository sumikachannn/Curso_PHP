// C++ code

long duration;
int distance;

#define trigp 3
#define echop 4
#define tempp A4

void setup()
{
    pinMode(echop, INPUT);
    pinMode(trigp, OUTPUT);
    pinMode(tempp, INPUT);
    pinMode(2, OUTPUT);
    pinMode(13, OUTPUT);
    pinMode(7, OUTPUT);
    pinMode(9, INPUT);
    Serial.begin(9600);
}

void sendistancia()
{
    digitalWrite(trigp, LOW);
    delay(200);
    digitalWrite(trigp, HIGH);
    delay(200);
    digitalWrite(trigp, LOW);
    duration = pulseIn(echop, HIGH);
    distance = duration * 0.034 / 2;
    Serial.print("Com algo na distância de ");
    Serial.print(distance);
    Serial.println(" cm");
}

void senmovimento()
{
    if (digitalRead(9) == HIGH)
    {
        digitalWrite(7, LOW);
        Serial.println("Alguém está se movendo ali!!!!");
        delay(250);
    }
    else
    {
        digitalWrite(13, LOW);
        digitalWrite(2, LOW);
        Serial.println("Não tem ninguém movendo ali");
        digitalWrite(7, HIGH);
        delay(250);
        digitalWrite(7, LOW);
        delay(250);
    }
}

void sentemperatura()
{
    int reading = analogRead(tempp);
    float voltage = reading * 5.0;
    voltage /= 1024.0;

    float temperatura = (voltage - 0.5) * 100;
    Serial.print("Temperatura está em: ");
    Serial.print(temperatura);
    Serial.println(" ºC");
}

void loop()
{
    senmovimento();
    sendistancia();
    sentemperatura();
    delay(500);
}
