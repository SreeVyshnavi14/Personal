public with sharing class OrderFulfillmentHandler {
     @AuraEnabled
    public static void triggerQueueableApex(Id orderId) {
        System.enqueueJob(new OrderReadyQueueable(orderId));
    }
   
}