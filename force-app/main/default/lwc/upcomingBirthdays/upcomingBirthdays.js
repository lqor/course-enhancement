import { LightningElement, wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
import findBirthdaysThisWeek from '@salesforce/apex/UpcomingBirthdaysController.findBirthdaysThisWeek';

export default class UpcomingBirthdays extends LightningElement {
    @wire(findBirthdaysThisWeek) contacts;
}
