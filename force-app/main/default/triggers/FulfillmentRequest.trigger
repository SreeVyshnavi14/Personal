trigger FulfillmentRequest on OrderFulfillmentRequestEvent__e (after insert) {
	    List<Fulfillment_Request__c> requests = new List<Fulfillment_Request__c>();

    for (OrderFulfillmentRequestEvent__e event : Trigger.new) {
       
        Fulfillment_Request__c request = new Fulfillment_Request__c(
            Order__c = event.OrderId__c,
            Warehouse__c = event.WarehouseId__c
 
            
        );
        OrderFulfillmentHandler.getFulFillmentRequestId(event.Id);
        requests.add(request);
    }
    insert requests;
  ///test
}