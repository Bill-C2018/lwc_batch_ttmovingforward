@isTest
public with sharing class LeadControllerTests {

    @isTest
    public static void testIt() {
        List<Lead> t = new List<Lead>();
        Lead l = new Lead( LastName = 'test1' , Company = 'bob1' , Status = 'Open - Not Contacted');
        t.add(l);
        l = new Lead( LastName = 'test2' , Company = 'bob2' , Status = 'Working - Contacted');
        t.add(l);
        l = new Lead( LastName = 'test3' , Company = 'bob3' , Status = 'Closed - Converted');
        t.add(l);
        l = new Lead( LastName = 'test4' , Company = 'bob4' , Status = 'Closed - Not Converted');
        t.add(l);

        insert t;

        List<Lead> res;
        res = LeadsController.getAllLeads();
        system.assertEquals(4,res.size());
        res = LeadsController.getOpenNotContactedLeads();
        system.assertEquals(1,res.size());
        res = LeadsController.getWorkingContactedLeads();
        system.assertEquals(1,res.size());
        res = LeadsController.getClosedConvertedLeads();
        system.assertEquals(1,res.size());
        res = LeadsController.getClosedNotConvertedLeadsName();
        system.assertEquals(1,res.size());
    }

}
