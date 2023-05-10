/**
 * BatchDeleteOpportunity.csl
 * Author(s): Dorian Aleander Patterosn
 *
 * Batch apex class for deleting Opportunity records.
 * The records must be older than 6 months and not closed.
 */
public with sharing class BatchDeleteOpportunity implements Database.Batchable<sObject>, Database.Stateful {
    public Integer recordsProcessed = 0;
    public List<Opportunity> start(Database.BatchableContext bc){
        Date sixMonthsAgo = Date.today().addMonths(6);
        return [SELECT Id FROM Opportunity
                WHERE StageName IN ('Closed - Won', 'Closed - Lost') AND
                CreatedDate < :sixMonthsAgo
                LIMIT 200
        ];
    }


    public void execute(Database.BatchableContext bc, List<Opportunity> records){
        delete records;
    }

    // In the future consider sending an email.
    public void finish(Database.BatchableContext bc){

    }
}