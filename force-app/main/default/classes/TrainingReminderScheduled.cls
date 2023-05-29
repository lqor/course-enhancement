public with sharing class TrainingReminderScheduled implements Schedulable {
    public void execute(SchedulableContext SC) {
        DateTime startOfDay = DateTime.newInstance(Date.today().addDays(3), Time.newInstance(0, 0, 0, 0));
        DateTime endOfDay = DateTime.newInstance(Date.today().addDays(3), Time.newInstance(23, 59, 59, 0));

        List<Training__c> sessions = [
            SELECT Id, Name, StartDate__c, EndDate__c, Trainer__c, Trainer__r.Email,
                (SELECT Name FROM Students__r) 
            FROM Training__c 
            WHERE StartDate__c >= :startOfDay AND StartDate__c <= :endOfDay
        ];

        System.debug('sessions: ' + sessions);
        System.debug('sessions[0].Students__r: ' + sessions[0].Students__r);

        List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
        EmailTemplate template = [SELECT Id, Body FROM EmailTemplate WHERE Name = 'TrainingReminder'];
        System.debug('template: ' + template);

        for (Training__c session : sessions) {
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.setTargetObjectId(session.Trainer__c);
            email.setToAddresses(new List<String>{session.Trainer__r.Email});
            email.setTemplateId(template.Id);
            email.setWhatId(session.Id);
            String newBody = addParticipantsToBody(template.Body, session.Students__r);
            email.setHtmlBody(newBody);

            emails.add(email);
        }

        System.debug('emails: ' + emails);
        if (!emails.isEmpty()) {
            Messaging.sendEmail(emails);
        }
    }

    private static String addParticipantsToBody(String body, List<Student__c> students) {
        String studentListString = '';
        for (Student__c student : students) {
            studentListString += '- ' + student.Name + '\n';
        }

        studentListString = studentListString.removeEnd('\n');

        return body.replace('{participants}', studentListString);
    }
    
}