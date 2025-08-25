public class testCSUma {
/********************************************************************************************************************************************
 * Name             :           CsController
 * Coverage         :
 * Desctiption      :           Controller class for ForecastNow module
 *********************************************************************************************************************************************
 * Version                      Date                    Developer                           Description
 * ******************************************************************************************************************************************
 * 1.5                          Dec-26-08-2024           TechMantraNow                      Added from V1.5
 *******************************************************************************************************************************************/

    @AuraEnabled(cacheable=true)
    public static Boolean appIsAccessible(Id userId) {
        try {
            return testHelper.appIsAccessibleHelper(userId);
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    @AuraEnabled(cacheable=true)
    public static CSNow_Settings__c getAppSettings(){
        try {
            return CSNow_Settings__c.getOrgDefaults();
        }catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    
    /*
    Method      :       isAppAccessible
        Params      :       userId
        Return      :       Wrapper -CSNowAccessWrapper - Returns information about the user's accessibility to the application.
         */
    @AuraEnabled
    public static Tm_ForecastWrappers.CSNowAccessWrapper checkAppAccess(Id userId){
        try{
            System.debug('userId>userId>'+userId);
            return testHelper.checkAppAccessHelper(userId);
        }catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
        
    }
    
    @AuraEnabled(cacheable=true)
    public static List<Id> collectUsersInHierarchy(Id userRoleId) {
        try {
            return testHelper.collectUsersInHierarchyHelper(userRoleId);
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage()+e.getLineNumber());
        }
    }
    @AuraEnabled(cacheable=true)
    public static Decimal closedWonAmount(List<String> userIdList) {
        try {
            Decimal returnValue = 0;
            for (AggregateResult result : [SELECT SUM(Amount) amount FROM Opportunity WHERE OwnerId IN :userIdList AND CloseDate = THIS_QUARTER AND StageName = 'Closed Won']) {
                returnValue = (Decimal) result.get('amount');
            }
            return returnValue;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    @AuraEnabled(cacheable=true)
    public static Map<Object,Map<String,Decimal>> getPipelineData(List<String> userIdList,String quarter, Integer year, String quarterCount, String userSelection,Date startDate,Date endDate){
        try{
            system.debug('userIdList'+userIdList);
            System.debug('quarter'+quarter+' year'+year+' quarterCount'+quarterCount+' Userselection '+userSelection);
            return testHelper.getPipelineDataHelper(userIdList,quarter,year,quarterCount,userSelection,startDate,endDate);
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
        
        
    }
    
    @AuraEnabled(cacheable=true)
    public static Map<Object,Map<String,Decimal>> getBillingBacklogData(List<String> userIdList){
        try{
            return testHelper.getBillingBacklogDataHelper(userIdList);
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    
    @AuraEnabled(cacheable=true)
    public static Map<Object, Map<String, Decimal>>   getQrrArrData(List<String> userIdList,String quarter, Integer year, String quarterCount, String userSelection){
        try{
            return testHelper.getQrrArrDataHelper(userIdList,quarter,year,quarterCount,userSelection);
        }catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
   @AuraEnabled(cacheable=true)
    public static Map<String, List<Forecast_Value__c>> getForecastData(List<String> userIdList,String quarter, Integer year, String quarterCount, String userSelection){
        try{
            return testHelper.getForecastDataHelper(userIdList,quarter,year,quarterCount,userSelection);
        }catch(Exception e){
            throw new AuraHandledException(e.getMessage());
        }
    }
    @AuraEnabled(cacheable=true)
    public static Map<String, Map<String, Decimal>> getQuotaData(List<String> userIdList,String quarter, Integer year, String quarterCount, String userSelection){
        
        try{
            return testHelper.getQuotaDataHelper(userIdList,quarter,year,quarterCount,userSelection);
        }catch(Exception e){
            throw new AuraHandledException(e.getMessage());
        }
        
    }
    @AuraEnabled(cacheable=true)
    public static Map<Object, Map<String, Decimal>>  getACVData(List<String> userIdList,String quarter,Integer year,String quarterCount,String userSelection) {
        try{
            return testHelper.getACVDataHelper(userIdList,quarter,year,quarterCount,userSelection);
            
        }catch(Exception e){
            throw new AuraHandledException(e.getMessage());
        }
    }
    
    
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> closedWonRecords(List<String> userIdList) {
        try {
            List<Opportunity> returnList = [
                SELECT Id, Amount, CloseDate, Owner.Name, OwnerId
                FROM Opportunity
                WHERE
                OwnerId IN :userIdList
                AND StageName = 'Closed Won'
                AND CloseDate = THIS_QUARTER
            ];
            return returnList;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    @AuraEnabled(cacheable=true)
    public static Map<String, List<SObject>> getWeightedAndUnweightedData(String objectName, String groupBy, String userIds, List<Id> parentIdList, String quarter, Integer year, String quarterCount,String mode,String userSelection){
        try{
            return testHelper.getWeightedAndUnweightedDataHelper(objectName,groupBy,userIds,parentIdList,quarter,year,quarterCount,mode,userSelection);
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    @AuraEnabled(cacheable=true)
    public static List<Id> getOpportunityIds(String objectName, String userIds,String userSelection){
        try{
            return testHelper.getOpportunityIdsHelper(objectName,userIds,userSelection);
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage()); 
        }
    }
    @AuraEnabled
    public static List<User_Management__c> getUserPreference(String userId){
        try{
            return testHelper.getUserPreferenceHelper(userId);
        }catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
        
    }
    @AuraEnabled
    public static Map<Object, Map<String, Decimal>> get360PipelineData(List<String> userIdList,String quarter,Integer year,String quarterCount,String userSelection) {
        try{
            return testHelper.get360PipelineDataHelper(userIdList,quarter,year,quarterCount,userSelection);
        }catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
        
    }

}