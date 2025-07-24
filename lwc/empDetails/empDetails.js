import { LightningElement,track } from 'lwc';
export default class EmpDetails extends LightningElement {
    @track isAccountSelected = false;
    @track isOpportunitySelected = false;
    @track isContactSelected = false;
  
    handleAccountClick() {
      this.isAccountSelected = true;
      this.isOpportunitySelected = false;
      this.isContactSelected = false;
  
    }
    handleOpportunityClick() {
        this.isAccountSelected = false;
        this.isOpportunitySelected = true;
        this.isContactSelected = false;

    }
    handleContcatClick(){
        this.isAccountSelected = false;
        this.isOpportunitySelected = false;
        this.isContactSelected = true;

    }
   
  
  
    
}