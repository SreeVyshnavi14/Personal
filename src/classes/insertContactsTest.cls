@isTest
public class insertContactsTest {
    
    @testSetup
    static void setupData() {
        // Create an Account
        Account acc = new Account(Name = 'Test Account');
        insert acc;
        
        // Create Opportunities for that Account
        List<Opportunity> oppList = new List<Opportunity>();
        for(Integer i = 0; i < 3; i++) {
            oppList.add(new Opportunity(
                Name = 'Opp ' + i,
                StageName = (i == 0) ? 'Closed Lost' : 'Prospecting',
                CloseDate = Date.today().addDays(30),
                Amount = 1000 * (i+1),
                AccountId = acc.Id
            ));
        }
        insert oppList;
    }
    
    
    @isTest
    static void testDeleteClosedLostOpportunities() {
        // Ensure there is at least one Closed Lost opp before deletion
        Integer beforeCount = [SELECT COUNT() FROM Opportunity WHERE StageName = 'Closed Lost'];
        System.assert(beforeCount > 0, 'There should be Closed Lost opps before deletion');
        
        Test.startTest();
        insertContacts.deleteClosedLOstOpportunities();
        Test.stopTest();
        
        // Verify deletion
        Integer afterCount = [SELECT COUNT() FROM Opportunity WHERE StageName = 'Closed Lost'];
        System.assertEquals(0, afterCount, 'Closed Lost opps should be deleted');
    }
    
   
}