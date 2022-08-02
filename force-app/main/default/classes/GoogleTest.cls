public with sharing class GoogleTest {
    public GoogleTest() {

    }

    @future(callout=true)
    public static void callGoogleIt(String query){
        system.debug('in futer method');
        system.debug(googleIt(query));
    }
    public static string googleIt(String query){
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://www.google.com?q='+query);
        req.setMethod('GET');
        HttpResponse res = h.send(req);
        if(res.getStatusCode() != 200){
          system.debug('Did not recieve a 200 status code: ' + res.getStatusCode());
          return '++++Failed++++++++++++';
        }
        return res.getBody();
      }
    


}
