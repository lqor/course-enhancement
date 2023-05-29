public with sharing class SearchStudentsInvoker {
    public class InputParams {
        @InvocableVariable(label='Name' required=false)
        public String name;
    }

    @InvocableMethod(label='Search Students')
    public static List<Student__c> searchStudents(List<InputParams> paramsList) {
        InputParams params = paramsList[0];
        TrainingManager tm = new TrainingManager();
        return tm.searchStudents(params.name);
    }
}