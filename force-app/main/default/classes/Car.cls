public class Car {
    public String motor;
    public Integer maximumSpeed;
    public Integer passengers;
    public String color;
    public Boolean motorIsOn;
    public Radio radio;

    public Car(String motor, Integer maximumSpeed, Integer passengers, String color) {
        this.motor = motor;
        this.maximumSpeed = maximumSpeed;
        this.passengers = passengers;
        this.color = color;
        this.motorIsOn = true;
    }

    public void addSpeed(Integer speed) {
        this.maximumSpeed += speed;
    }

    public void repaint(String newColor) {
        this.color = newColor;
    }

    public void toggleMotor() {
        this.motorIsOn = !this.motorIsOn;
    }

    public void assignRadio(Radio radio) {
        this.radio = radio;
    }

    public void printCarValues() {
        System.debug('Motor: ' + motor);
        System.debug('Maximum Speed: ' + maximumSpeed);
        System.debug('Passengers: ' + passengers);
        System.debug('Color: ' + color);
        System.debug('Motor Is On: ' + motorIsOn);

        if (radio != null) {
            System.debug('Radio Type: ' + radio.radioType);
            System.debug('Frequency: ' + radio.frequency);
            System.debug('Radio Is On: ' + radio.isOn);
        }
    }
}