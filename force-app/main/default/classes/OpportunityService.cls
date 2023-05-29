public with sharing class OpportunityService {

    public Decimal calculateAmount(Opportunity opportunity1, Opportunity opportunity2) {
        return opportunity1.Amount + opportunity2.Amount;
    }

    public Opportunity softMerge(Opportunity opportunity1, Opportunity opportunity2) {
        Opportunity mergedOpportunity = new Opportunity();

        mergedOpportunity.AccountId = opportunity1.AccountId;
        mergedOpportunity.Amount = opportunity1.Amount;
        mergedOpportunity.CloseDate = opportunity1.CloseDate;

        mergedOpportunity.Name = opportunity2.Name;
        mergedOpportunity.Probability = opportunity2.Probability;
        mergedOpportunity.StageName = opportunity2.StageName;

        return mergedOpportunity;
    }

    public Opportunity createOpportunityWithAccount(Account acc) {
        Opportunity newOpportunity = new Opportunity();
        
        newOpportunity.AccountId = acc.Id;
        newOpportunity.Amount = 10000; 
        newOpportunity.CloseDate = System.today().addDays(30); 
        newOpportunity.Name = acc.Name + ' Opportunity'; 
        newOpportunity.Probability = 50;
        newOpportunity.StageName = 'Prospecting';

        return newOpportunity;
    }

    public void insertOpportunity(Opportunity opportunity) {
        insert opportunity;
    }
}