global class updateBatchTestObject implements Database.Batchable<sObject>  {

    Integer recordsProcessed = 0;
/*
//this is using iterable - which is subject to limits
//
    
    List<BatchTestObject__c> listToBatch = new List<BatchTestObject__c>();

    public void setListToParse() {
        listToBatch = [SELECT Id, Name FROM BatchTestObject__c];
    }

    public List<SObject> start(Database.BatchableContext context) {   

        return listToBatch;
    }

    global void execute(Database.BatchableContext bc, List<sObject> scope) {
        for (sObject b: scope) {

        }

        recordsProcessed = recordsProcessed + scope.size();
    }
*/

//to launch from console 
/*
Id jobid = Database.executeBatch(new updateBatchTestObject(), 200);
system.debug('job id ' + jobid);
*/


// this uses the queryLocator version so is exempt from most limits


    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator([Select Name From BatchTestObject__c ]);
    }

    public void execute(Database.BatchableContext bc, List<BatchTestObject__c> scope) {
        List<BatchTestObject__c> l = new List<BatchTestObject__c>();
        for(BatchTestObject__c b: scope) {
            b.Name = b.Name + ' Modified ';
            l.add(b);
        }

        update l;
        recordsProcessed = recordsProcessed + scope.size();
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

}
