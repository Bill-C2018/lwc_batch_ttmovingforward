public with sharing class ScheduledBatchTestObject implements Schedulable {
    
    
    public ScheduledBatchTestObject() {
    }

    public void execute(SchedulableContext ctx) {
        List<BatchTestObject__c> updates = new List<BatchTestObject__c>();
        for(List<BatchTestObject__c> b: [Select LastUpdate__c FROM BatchTestObject__c] ) {
            for(BatchTestObject__c bb: b) {
                bb.LastUpdate__c = system.today();
                updates.add(bb);
            }
        }

        update updates;
    }

}
