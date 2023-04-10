import { LightningElement, wire } from 'lwc';
import findContactsWithoutEmail from '@salesforce/apex/UpcomingBirthdaysController.findContactsWithoutEmail';

export default class ContactsWithMissingEmails extends LightningElement {
    @wire(findContactsWithoutEmail) contacts;
}