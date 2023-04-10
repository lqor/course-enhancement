public with sharing class ContactQueries {
    public static List<Contact> queryByBirtdateMonth(Integer month) {
        return [
            SELECT Id, Name, Birthdate, Email
            FROM Contact
            WHERE Birthdate != NULL AND CALENDAR_MONTH(Birthdate) = :month
            ORDER BY Birthdate ASC
        ];
    }

    public static List<Contact> queryContactsWithoutEmail() {
        return [
            SELECT Id, Name, Birthdate, Email, Owner.Name
            FROM Contact
            WHERE Email = null
        ];
    }
}