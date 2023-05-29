public with sharing class UpdateStudentStatusInvoker {
    public class InputParams {
        @InvocableVariable(label='Student ID' required=true)
        public Id studentId;
        
        @InvocableVariable(label='Status' required=true)
        public String status;
    }

    @InvocableMethod(label='Update Student Status')
    public static void updateStudentStatus(List<InputParams> paramsList) {
        InputParams params = paramsList[0];
        TrainingManager tm = new TrainingManager();
        tm.updateStudentStatus(params.studentId, params.status);
    }
}