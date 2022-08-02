global class updateBatchTestObject implements Database.Batchable<sObject>  {

/*
    Integer recordsProcessed = 0;
    global Database.QueryLocator start(Database.BatchableContext bc) {
        List<BatchableTestObject__c> bo = new List<BatchableTestObject__c>();

        
    }

    global void execute(Database.BatchableContext bc, List<BatchableTestObject__c> scope) {
        system.debug('+++++ in execute');

        for (BatchableTestObject__c b: scope) {
            b.Name = b.Name + 'testing';
        }
        recordsProcessed = recoredsProcessed + scope.size();
    }

    global void finish(Database.BatchableContext bc) {
        //system.debug('records processed: ' + recordsProcessed);
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors,
            JobItemsProcessed,
            TotalJobItems, CreatedBy.Email
            FROM AsyncApexJob
            WHERE Id = :bc.getJobId()];

        system.debug('Apex job id: ' + job);
    }
*/

}
