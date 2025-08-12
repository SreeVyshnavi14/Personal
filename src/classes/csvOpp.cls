public class csvOpp {
    @AuraEnabled
     public static List<Account> createOpportunityRecords(String Data) {
         System.debug('base64Data'+Data);
        String dat = JSON.deserializeUntyped(Data).toString();
        System.debug('data'+dat);
        List<Account> accList = new List<Account>();
        List<String> lstCSVLines = dat.split('\n');
        for(Integer i = 1; i < lstCSVLines.size(); i++){
            Account acc = new Account();
            String csvLine = lstCSVLines[i];
            String prevLine = csvLine;
            Integer startIndex;
            Integer endIndex;
            
            while(csvLine.indexOf('"') > -1){
                if(startIndex == null){
                    startIndex = csvLine.indexOf('"');
                    csvLine = csvLine.substring(0, startIndex) + ':quotes:' + csvLine.substring(startIndex+1, csvLine.length());
                }else{
                    if(endIndex == null){
                        endIndex = csvLine.indexOf('"');
                        csvLine = csvLine.substring(0, endIndex) + ':quotes:' + csvLine.substring(endIndex+1, csvLine.length());
                    }
                }
                
                if(startIndex != null && endIndex != null){
                    String sub = csvLine.substring(startIndex, endIndex);
                    sub = sub.replaceAll(',', ':comma:');
                    csvLine = csvLine.substring(0, startIndex) + sub + csvLine.substring(endIndex, csvLine.length());
                    startIndex = null;
                    endIndex = null;
                }
            }
            
            List<String> csvRowData = new List<String>();
            for(String column : csvLine.split(',')){
                column = column.replaceAll(':quotes:', '').replaceAll(':comma:', ',');
                csvRowData.add(column);
            }
            acc.Name = csvRowData[0];
            acc.Phone = csvRowData[1];
            acc.AccountNumber = csvRowData[2];
            accList.add(acc);
        }
        if(!accList.isEmpty()){
            insert accList;
        }
       
}