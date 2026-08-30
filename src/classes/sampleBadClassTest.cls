@isTest
public class sampleBadClassTest {

    @isTest
    static void testGetStageName() {
         sampleBadClass.getStageName(1);
         sampleBadClass.getStageName(2);
         sampleBadClass.getStageName(3);
         sampleBadClass.getStageName(4);
               
    }

    @isTest
    static void testProcessOpportunities() {
        // Creating data inside test without using @testSetup (bad practice)
        Account acc = new Account(Name = 'Test Account');
        insert acc;

        Opportunity opp = new Opportunity(
            Name = 'Test Opp',
            StageName = 'Prospecting',
            CloseDate = Date.today(),
            AccountId = acc.Id
        );
        insert opp;

        List<Opportunity> oppList = [SELECT Id, AccountId FROM Opportunity WHERE Id = :opp.Id];

        // Call method but don't assert results (bad practice)
        SampleBadClass.processOpportunities(oppList);
    }
}