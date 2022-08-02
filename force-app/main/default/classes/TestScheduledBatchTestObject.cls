@isTest
public with sharing class TestScheduledBatchTestObject {

    // Dummy CRON expression: midnight on March 15.
    // Because this is a test, job executes
    // immediately after Test.stopTest().
    public static String CRON_EXP = '20 30 8 10 2 ?';

    @isTest
    public static void TestIt() {

        List<BatchTestObject__c> blist = new List<BatchTestObject__c>();

        for (Integer x = 0; x < 500; x++) {
            BatchTestObject__c b = new BatchTestObject__c(Name = 'test ' + x, IDNumber__c = x);
            blist.add(b);
        }

        insert blist;

        test.StartTest();
        String jobId = System.schedule('ScheduledApexTest',
                CRON_EXP,
                new ScheduledBatchTestObject());

        Test.stopTest();

        //verify 


        for(List<BatchTestObject__c> l : [Select LastUpdate__c from BatchTestObject__c]) {
            for (BatchTestObject__c b: l) {
                system.assertEquals(system.today(), b.LastUpdate__c);
            }
        } 

    }

}
