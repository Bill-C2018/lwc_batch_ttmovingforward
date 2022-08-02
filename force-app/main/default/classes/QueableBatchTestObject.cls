public with sharing class QueableBatchTestObject implements Queueable{

    private List<BatchTestObject__c> objs;
    private String updateText;
    public QueableBatchTestObject(List<BatchTestObject__c> b, String t) {
        objs = b;
        updateText = t;
    }

    public void execute(QueueableContext context) {
        for (BatchTestObject__c b: objs) {
            b.Name = b.Name + ' ' + updateText;
        }
        update objs;
    }

}


/*
code to launch directly

List<BatchTestObject__c> bo = [select NAME from BatchTestObject__c where IDNumber < 500];
// instantiate a new instance of the Queueable class
QueableBatchTestObject updateJob = new QueableBatchTestObject(bo);
// enqueue the job for processing
ID jobID = System.enqueueJob(updateJob);

*/