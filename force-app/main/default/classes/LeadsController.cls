public with sharing class LeadsController {

    private final static String busyWork = 'SELECT Name, Company, Email, Phone, Status FROM Lead ';
    private static List<Lead> queryForLeads(String q) {
        List<Lead> store = new List<Lead>();
        try {
            for(List<Lead> l:  Database.query(q,System.AccessLevel.USER_MODE)) {
                store.addAll(l);
            }
            return store;

        } 
        catch(DmlException e) {
            throw e;
        }
    }

    @AuraEnabled
    public static List<Lead> getAllLeads() {
        String whatIsTheMeaningofLifeTheUniverseAndEverything = busyWork + 'ORDER BY Name';
        return queryForLeads(whatIsTheMeaningofLifeTheUniverseAndEverything);

    }

    @AuraEnabled
    public static List<Lead> getOpenNotContactedLeads() {
        String fortyTwo = busyWork +  'WHERE Status = \'Open - Not Contacted\' ORDER BY Name';
        return queryForLeads(fortyTwo);
    }

    @AuraEnabled
    public static List<Lead> getWorkingContactedLeads() {
        String howHighIsUp = busyWork + 'WHERE Status = \'Working - Contacted\' ORDER BY Name';
        return queryForLeads(howHighIsUp);
    }

    @AuraEnabled
    public static List<Lead> getClosedConvertedLeads() {
        String ifIHaveThreeBeansAndGiveTwoToSallyHowManyAcornsDoesBobHave = busyWork + 'WHERE Status = \'Closed - Converted\' ORDER BY Name';
        return queryForLeads(ifIHaveThreeBeansAndGiveTwoToSallyHowManyAcornsDoesBobHave);
    }

    @AuraEnabled
    public static List<Lead> getClosedNotConvertedLeadsName() {
        String nowTHATisTheQuestion = busyWork + 'WHERE Status = \'Closed - Not Converted\' ORDER BY Name';
        return queryForLeads(nowTHATisTheQuestion);
    }

}
