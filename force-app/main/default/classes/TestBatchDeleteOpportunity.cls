@isTest
public with sharing class TestBatchDeleteOpportunity {
    private static final Integer numRecords = 200;
    @TestSetup
    static void makeData(){
        List<Opportunity> opportunities = new List<Opportunity>();
        for(Integer i = 0 ; i < numRecords; i++){
            Opportunity opp = new Opportunity();
            opp.Name = 'Opportunity ' + i;
            opp.CloseDate = Date.today() + 30;
            opp.StageName = (i < numRecords / 2) ? 'Prospecting' : 'Closed - Won';
            opportunities.add(opp);
        }
        insert opportunities;
    }

    @isTest
    static void test(){
        System.assertEquals(numRecords, [SELECT COUNT() FROM Opportunity]);
        Test.startTest();
        BatchDeleteOpportunity bdo = new BatchDeleteOpportunity();
        Id batchId = Database.executeBatch(bdo);
        Test.stopTest();

        System.assertEquals(numRecords / 2, [SELECT COUNT() FROM Opportunity]);
    }
}