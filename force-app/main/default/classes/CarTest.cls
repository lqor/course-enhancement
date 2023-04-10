@isTest
private class CarTest {

    @isTest
    static void testCar() {
        Car car = new Car('Tesla', 'Model S', 2023);
        
        Assert.areEqual('Tesla', car.getMake(), 'Make should be Tesla');
        Assert.areEqual('Model S', car.getModel(), 'Model should be Model S');
        Assert.areEqual(2023, car.getYear(), 'Year should be 2023');
    }
    
    @isTest
    static void testRadio() {
        Radio radio = new Radio(88.1);
        
        Assert.areEqual(88.1, radio.getFrequency(), 'Frequency should be 88.1');
    }
    
    @isTest
    static void testCarWithRadio() {
        Car car = new Car('Tesla', 'Model S', 2023);
        Radio radio = new Radio(88.1);
        car.setRadio(radio);
        
        Assert.isNotNull(car.getRadio(), 'Radio should not be null');
        Assert.areEqual(88.1, car.getRadio().getFrequency(), 'Radio frequency should be 88.1');
    }
}
