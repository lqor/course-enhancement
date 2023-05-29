public with sharing class RegisterStudentInvoker {
    public class InputParams {
        @InvocableVariable(label='Contact Name' required=true)
        public String contactName;
        
        @InvocableVariable(label='Training ID' required=true)
        public Id trainingId;
    }

    @InvocableMethod(label='Register Student')
    public static void registerStudent(List<InputParams> paramsList) {
        InputParams params = paramsList[0];
        TrainingManager tm = new TrainingManager();
        tm.registerStudent(params.contactName, params.trainingId);
    }
}