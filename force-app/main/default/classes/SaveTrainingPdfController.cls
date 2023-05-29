public class SaveTrainingPdfController {
    public Id trainingId { get; set; }

    public SaveTrainingPdfController(ApexPages.StandardController stdController) {
        this.trainingId = stdController.getId();
    }

    @AuraEnabled
    public static Id savePdfToContentVersion(Id trainingId) {
        PageReference pdfPage = Page.TrainingFlyer;
        pdfPage.getParameters().put('id', trainingId);
    
        Blob content = pdfPage.getContent();
        if(Test.isRunningTest()) {
            content = Blob.valueOf('TestContract');
        } else if(pdfPage == null) {
            content = Blob.valueOf(''); 
        }
    
        ContentVersion version = new ContentVersion();
        version.ContentLocation = 'S'; 
        version.Title = 'New Course';
        version.PathOnClient = 'Flyer.pdf';
        version.VersionData = content;
        version.FirstPublishLocationId = trainingId;    
        insert version;

        System.debug(version.Id);

        return version.Id;
    }
}
