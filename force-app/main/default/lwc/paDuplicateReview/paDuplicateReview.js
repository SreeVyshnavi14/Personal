import { LightningElement, api, track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class PaDuplicateReview extends LightningElement {
    @api recordId; // The current case record ID
    @track showComparison = false;
    @track duplicateCount = 3; // This would come from the backend in a real implementation

    // Mock data for demonstration
    currentPA = {
        careRequestId: 'CR-2025-00123',
        caseId: 'CAS-2025-04567',
        careRequestSubStatus: 'In Review - Clinical',
        caseStatus: 'Open',
        careRequestItem: 'Knee MRI',
        quantity: 1,
        careRequestDate: '06/01/2025',
        requestingProvider: 'Dr. Sarah Chen',
        servicingProvider: 'UC Davis Medical Center'
    };

    duplicates = [
        {
            careRequestId: 'CR-2025-00120',
            caseId: 'CAS-2025-04564',
            careRequestSubStatus: 'Pending',
            caseStatus: 'Open',
            careRequestItem: 'Knee MRI',
            quantity: 1,
            careRequestDate: '05/28/2025',
            requestingProvider: 'Dr. Sarah Chen',
            servicingProvider: 'UC Davis Medical Center'
        },
        {
            careRequestId: 'CR-2025-00121',
            caseId: 'CAS-2025-04565',
            careRequestSubStatus: 'Approved',
            caseStatus: 'Closed',
            careRequestItem: 'Knee MRI',
            quantity: 1,
            careRequestDate: '06/03/2025',
            requestingProvider: 'Dr. John Doe',
            servicingProvider: 'UC Davis Health'
        },
        {
            careRequestId: 'CR-2025-00122',
            caseId: 'CAS-2025-04566',
            careRequestSubStatus: 'Denied',
            caseStatus: 'Closed',
            careRequestItem: 'Knee MRI',
            quantity: 1,
            careRequestDate: '05/30/2025',
            requestingProvider: 'Dr. Sarah Chen',
            servicingProvider: 'UC Davis Medical Center'
        }
    ];

    get alertBannerClass() {
        return `slds-notify slds-notify_alert slds-theme_alert-texture slds-theme_warning ${this.showComparison ? 'slds-hide' : ''}`;
    }

    get currentPAFields() {
        return [
            { key: 'careRequestId', label: 'Care Request ID', value: this.currentPA.careRequestId },
            { key: 'caseId', label: 'Case ID', value: this.currentPA.caseId },
            { key: 'status', label: 'Status', value: this.currentPA.careRequestSubStatus },
            { key: 'caseStatus', label: 'Case Status', value: this.currentPA.caseStatus },
            { key: 'careRequestItem', label: 'Care Request Item', value: this.currentPA.careRequestItem },
            { key: 'quantity', label: 'Quantity', value: this.currentPA.quantity },
            { key: 'requestDate', label: 'Request Date', value: this.currentPA.careRequestDate },
            { key: 'requestingProvider', label: 'Requesting Provider', value: this.currentPA.requestingProvider },
            { key: 'servicingProvider', label: 'Servicing Provider', value: this.currentPA.servicingProvider }
        ];
    }

    get duplicatesWithFields() {
        return this.duplicates.map(dup => ({
            ...dup,
            fields: [
                { key: 'careRequestId', label: 'Care Request ID', value: dup.careRequestId },
                { key: 'caseId', label: 'Case ID', value: dup.caseId },
                { key: 'status', label: 'Status', value: dup.careRequestSubStatus },
                { key: 'caseStatus', label: 'Case Status', value: dup.caseStatus },
                { key: 'careRequestItem', label: 'Care Request Item', value: dup.careRequestItem },
                { key: 'quantity', label: 'Quantity', value: dup.quantity },
                { key: 'requestDate', label: 'Request Date', value: dup.careRequestDate },
                { key: 'requestingProvider', label: 'Requesting Provider', value: dup.requestingProvider },
                { key: 'servicingProvider', label: 'Servicing Provider', value: dup.servicingProvider }
            ]
        }));
    }

    handleReviewDuplicates() {
        this.showComparison = true;
    }

    handleBackToCase() {
        this.showComparison = false;
    }

    handleViewFullRequest(event) {
        const careRequestId = event.currentTarget.dataset.id;
        // In a real implementation, this would navigate to the full case record
        this.showToast('Info', `Viewing full request for ${careRequestId}`, 'info');
    }

    handleMergeRequest(event) {
        const careRequestId = event.currentTarget.dataset.id;
        // In a real implementation, this would trigger the merge process
        this.showToast('Success', `Initiating merge for ${careRequestId}`, 'success');
    }

    handleNotDuplicate(event) {
        const careRequestId = event.currentTarget.dataset.id;
        // In a real implementation, this would mark the record as not a duplicate
        this.showToast('Success', `Marked ${careRequestId} as not a duplicate`, 'success');
    }

    showToast(title, message, variant) {
        this.dispatchEvent(
            new ShowToastEvent({
                title,
                message,
                variant
            })
        );
    }
}