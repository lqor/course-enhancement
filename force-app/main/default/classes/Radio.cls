public class Radio {
    public Decimal frequency;
    public String radioType;
    public Boolean isOn;

    public Radio() {
        this.frequency = 135.5;
        this.radioType = 'Sony DSX-A110U';
        this.isOn = true;
    }

    public Radio(String radioType) {
        this.radioType = radioType;
    }

    public Decimal nextChannel() {
        this.frequency += 10;
        return this.frequency;
    }
}