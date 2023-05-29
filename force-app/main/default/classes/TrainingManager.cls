public class TrainingManager {

    // Custom exception class
    public class TrainingManagerException extends Exception {}

    public void registerStudent(String contactName, Id trainingId) {
        try {
            Contact contact = [SELECT Id FROM Contact WHERE Name = :contactName LIMIT 1];
            Student__c student = new Student__c(
                Contact__c = contact.Id,
                Training__c = trainingId,
                Status__c = 'Registered'
            );
            insert student;
        } catch (Exception e) {
            throw new TrainingManagerException('Error registering student: ' + e.getMessage());
        }
    }

    public void updateStudentStatus(Id studentId, String newStatus) {
        try {
            Student__c student = [SELECT Id, Status__c FROM Student__c WHERE Id = :studentId];
            student.Status__c = newStatus;
            update student;
        } catch (Exception e) {
            throw new TrainingManagerException('Error updating student status: ' + e.getMessage());
        }
    }

    public List<Student__c> searchStudents(String name) {
        try {
            String searchName = '%' + name + '%';
            return [
                SELECT Id, Contact__c, Training__c, Status__c, Contact__r.Name, Name
                FROM Student__c 
                WHERE Contact__r.Name LIKE :searchName
                LIMIT 1
            ];
        } catch (Exception e) {
            throw new TrainingManagerException('Error searching students: ' + e.getMessage());
        }
    }
}
