global class LeadProcessor implements    Database.Batchable<Sobject> 
{
    global Database.QueryLocator start(Database.BatchableContext bc) 
    {
 //       return Database.getQueryLocator([Select LeadSource From Lead ]);
        return Database.getQueryLocator('SELECT Name FROM BatchableTestObject__c WHERE IDNUMBER__c < 5000'); 
    }

    global void execute(Database.BatchableContext bc, List<Leads> scope)
    {

            for (Lead Leads : scope) 
            {
                Leads.LeadSource = 'Dreamforce';
            }
        update scope;

    }    

    global void finish(Database.BatchableContext bc){   }    
}