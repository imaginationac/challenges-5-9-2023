@isTest
public with sharing class TestOpportunityFactory {
    public static List<Opportunity> createOpportunities(){
        List<SObject> ls = Test.loadData(Opportunity.getSObjectType(), 'testOpportunities');
        List<Opportunity> opportunities = new List<Opportunity>();
        for(SObject obj : ls){
            opportunities.add((Opportunity) obj);
        }
        return opportunities;
    }
}