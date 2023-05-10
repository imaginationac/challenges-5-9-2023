/**
 * TestBatchDeleteOpportunity.cls
 * Author(s): Dorian Alexander Patterson
 *
 * Test class for BatchDeleteOpportunity
 */
@isTest
public with sharing class TestBatchDeleteOpportunity {
    private static final Integer numRecords = 200;
    @TestSetup
    static void makeData(){
        List<SObject> ls = Test.loadData(Opportunity.getSObjectType(), 'testOpportunities');
        List<Opportunity> opportunities = new List<Opportunity>();
        for(SObject obj : ls){
            opportunities.add((Opportunity) obj);
        }
        update opportunities;
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