public with sharing class GetRoles {
     @AuraEnabled
    public static List<UserRole> roles()
    {
        String query = 'SELECT Id, Name from UserRole';
        try {
            List<UserRole> rolesList = new List<UserRole>();
            for (UserRole opp : Database.query(query)) {
                rolesList.add(opp);
            }
           
            return rolesList;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

}