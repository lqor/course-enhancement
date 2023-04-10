public with sharing class UpcomingBirthdaysController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> findBirthdaysThisWeek() {
        List<Contact> contacts = ContactQueries.queryByBirtdateMonth( Date.today().month());
        contacts = filterContactsOnCurrentWeek(contacts);

        return contacts;
    }

    @AuraEnabled(cacheable=true)
    public static List<Contact> findContactsWithoutEmail() {
        return ContactQueries.queryContactsWithoutEmail();
    }
      
    private static List<Contact> filterContactsOnCurrentWeek(List<Contact> contacts) {
        List<Contact> relevant = new List<Contact>();
        Integer startWeek = Date.today().toStartOfWeek().dayOfYear();
        Integer endWeek =  Date.today().toStartOfWeek().addDays(7).dayOfYear();

        for(Contact contact : contacts) {
            Integer dayOfYearContactBirthDay = contact.Birthdate.dayOfYear();
            Boolean isWithinRange = dayOfYearContactBirthDay >= startWeek && dayOfYearContactBirthDay <= endWeek;

            if(isWithinRange) {
                relevant.add(contact);
            }
        }

        return relevant;
    }
}
  