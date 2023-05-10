/**
 * BatchDeleteOpportunity.csl
 * Author(s): Dorian Aleander Patterosn
 *
 * Batch apex class for deleting Opportunity records.
 * The records must be older than 6 months and not closed.
 */
public with sharing class BatchDeleteOpportunity implements Database.Batchable<sObject>, Database.Stateful {
    public Integer recordsProcessed = 0;
    public Database.QueryLocator start(Database.BatchableContext bc){
        String query = 'SELECT Id FROM Opportunity ' +
        'WHERE IsClosed = false AND ' +
        'CreatedDate < TODAY - 30 * 6';
        return Database.getQueryLocator(query);
    }


    public void execute(Database.BatchableContext bc, List<Opportunity> records){
        delete records;
    }

    // In the future consider sending an email.
    public void finish(Database.BatchableContext bc){

    }
}