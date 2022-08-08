public with sharing class LeadsController {

    private static List<Lead> queryForLeads(String q) {
        system.debug(' Calling query with: ' + q);
        List<Lead> leads = Database.query(q,System.AccessLevel.USER_MODE);
        system.debug(leads);
        return leads;
    }

    @AuraEnabled
    public static List<Lead> getAllLeads() {
        system.debug('In Get All leads');
        String query = 'SELECT Name, Company, Email, Phone, Status FROM Lead ORDER BY Name';
        List<Lead> res;
        try {
            res = queryForLeads(query);
        } catch(DmlException e) {
            throw e;
        }
        return res;
    }

    @AuraEnabled
    public static List<Lead> getOpenNotContactedLeads() {
        String query = 'SELECT Name, Company, Email, Phone, Status FROM Lead WHERE Status = \'Open - Not Contacted\' ORDER BY Name';
        List<Lead> res;
        try {
            res = queryForLeads(query);
        } catch(DmlException e) { throw e;  }
        return res;
    }

    @AuraEnabled
    public static List<Lead> getWorkingContactedLeads() {
        String query = 'SELECT Name, Company, Email, Phone, Status FROM Lead WHERE Status = \'Working - Contacted\' ORDER BY Name';
        List<Lead> res;
        try {
            res = queryForLeads(query);
        } catch(DmlException e) { throw e;  }
        return res;
    }

    @AuraEnabled
    public static List<Lead> getClosedConvertedLeads() {
        String query = 'SELECT Name, Company, Email, Phone, Status FROM Lead WHERE Status = \'Closed - Converted\' ORDER BY Name';
        List<Lead> res;
        try {
            res = queryForLeads(query);
        } catch(DmlException e) { throw e;  }
        return res;
    }

    @AuraEnabled
    public static List<Lead> getClosedNotConvertedLeadsName() {
        String query = 'SELECT Name, Company, Email, Phone, Status FROM Lead WHERE Status = \'Closed - Not Converted\' ORDER BY Name';
        List<Lead> res;
        try {
            res = queryForLeads(query);
        } catch(DmlException e) { throw e;  }
        return res;
    }

    //give an invalid query to make sure the toast component is working
    @AuraEnabled
    public static List<Lead> testErrorHandler(){
        String query = 'SELECT Name, Company, Emailaddy, Phone, Status FROM Lead WHERE Status = \'Closed - Not Converted\' ORDER BY Name';
        List<Lead> res;
        try {
            res = queryForLeads(query);
        } catch(DmlException e) { throw e;  }
        return res;

    }
}
