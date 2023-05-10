global with sharing class ScheduleBatchDeleteOpportunity implements Schedulable{
    global void execute(SchedulableContext context){
        BatchDeleteOpportunity bdo = new BatchDeleteOpportunity();
        Database.executeBatch(bdo);
    }
}