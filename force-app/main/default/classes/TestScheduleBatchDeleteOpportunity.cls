@isTest
public with sharing class TestScheduleBatchDeleteOpportunity {
    public static final String CRON_EXP = '0 0 2 ? * SAT';
    public static final Integer NUM_RECORDS = 200;
    @TestSetup
    static void makeData(){
        update TestOpportunityFactory.createOpportunities();
    }

    @isTest
    static void test(){
        Test.startTest();
        String jobId = System.schedule('Schedule Batch Opportunity Delete', CRON_EXP, new ScheduleBatchDeleteOpportunity());
        Test.stopTest();

        System.assertEquals(NUM_RECORDS / 2, [SELECT COUNT() FROM Opportunity], 'The number of Opportunity records should be ' + NUM_RECORDS / 2 + '.');
    }
}