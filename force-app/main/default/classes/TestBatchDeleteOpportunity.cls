/**
 * TestBatchDeleteOpportunity.cls
 * Author(s): Dorian Alexander Patterson
 *
 * Test class for BatchDeleteOpportunity
 */
@isTest
public with sharing class TestBatchDeleteOpportunity {
    private static final Integer NUM_RECORDS = 200;
    @TestSetup
    static void makeData(){
        update TestOpportunityFactory.createOpportunities();
    }

    @isTest
    static void test(){
        System.assertEquals(NUM_RECORDS, [SELECT COUNT() FROM Opportunity]);
        Test.startTest();
        BatchDeleteOpportunity bdo = new BatchDeleteOpportunity();
        Id batchId = Database.executeBatch(bdo);
        Test.stopTest();

        System.assertEquals(NUM_RECORDS / 2, [SELECT COUNT() FROM Opportunity], 'The number of Opportunity records should be ' + NUM_RECORDS / 2 + '.');
    }
}