public class sampleBadClass {

    public static String getStageName(Integer stageCode) {
       
        String stageName;

        // Using if-else ladder instead of a cleaner approach (like Map or ternary)
        if(stageCode == 1) {
            stageName = 'Prospecting';
        } else if(stageCode == 2) {
            stageName = 'Qualification';
        } else if(stageCode == 3) {
            stageName = 'Proposal';
        } else if(stageCode == 4) {
            stageName = 'Closed Won';
        } else if(stageCode == 5) {
            stageName = 'Closed Lost';
        } else {
            stageName = 'Unknown    stage';
        }

        System.debug('Returning stage name: ' + stageName);

        return stageName;
    }

    public static void processOpportunities(List<Opportunity> opps) {
        // Query inside loop (bad practice)
        for(Opportunity opp : opps) {
           
        }
    }
}