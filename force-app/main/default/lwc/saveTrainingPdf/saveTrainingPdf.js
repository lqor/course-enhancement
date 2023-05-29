import { LightningElement, api } from 'lwc';
import savePdfToContentVersion from '@salesforce/apex/SaveTrainingPdfController.savePdfToContentVersion';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { getRecordNotifyChange } from 'lightning/uiRecordApi';

export default class SaveTrainingPdf extends LightningElement {
    @api recordId;

    @api invoke() {
        savePdfToContentVersion({ trainingId: this.recordId })
            .then((contentVersionId) => {
                this.showToast();
                this.reloadPage();
            });
    }

    showToast() {
        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Success',
                message: 'PDF saved successfully',
                variant: 'success'
            })
        );
    }

    reloadPage() {
        window.location.reload();
    }
}
