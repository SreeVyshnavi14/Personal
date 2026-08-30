public class OrderReadyQueueable implements Queueable {
    private Id orderId;

    public OrderReadyQueueable(Id orderId) {
        this.orderId = orderId;
    }

    public void execute(QueueableContext context) {
        Order orderRec = [SELECT Id, Status,Name FROM Order WHERE Id = :orderId LIMIT 1];
        orderRec.Status = 'Ready for Fulfillment';
        update orderRec;

        Fulfillment_Request__c fulfillmentReq = new Fulfillment_Request__c(Order__c = orderId);
        insert fulfillmentReq;

        /*OrderFulfillmentRequestEvent__e event = new OrderFulfillmentRequestEvent__e(
            FulfillmentRequestId__c = fulfillmentReq.Id,
            OrderId__c = orderId
        );
        EventBus.publish(event);*/
    }
}