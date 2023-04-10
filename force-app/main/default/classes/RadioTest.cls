@isTest
private class RadioTest {

    @isTest
    static void testSetFrequency() {
        Radio radio = new Radio(88.1);
        radio.setFrequency(100.5);
        
        Assert.areEqual(100.5, radio.getFrequency(), 'Frequency should be 100.5');
    }

    @isTest
    static void testSetInvalidFrequency() {
        Radio radio = new Radio(88.1);

        try {
            radio.setFrequency(0);
            Assert.fail('An exception should be thrown for invalid frequency');
        } catch (Radio.InvalidFrequencyException e) {
            Assert.areEqual('Invalid frequency. It should be between 87.5 and 108.', e.getMessage(), 'Exception message should match');
        }
    }
}
