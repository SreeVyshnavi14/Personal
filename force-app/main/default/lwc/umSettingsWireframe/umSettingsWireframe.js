import { LightningElement, track } from 'lwc';

export default class UmSettingsWireframe extends LightningElement {
    @track isPayersAppEnabled = false;
    @track isDuplicatePAEnabled = false;

    handlePayersAppToggle(event) {
        this.isPayersAppEnabled = event.target.checked;
    }

    handleDuplicatePAToggle(event) {
        this.isDuplicatePAEnabled = event.target.checked;
    }

    handleSave() {
        // For wireframe, just show a toast or console log
        // In a real app, you would call Apex to persist
        // eslint-disable-next-line no-console
        console.log('Settings saved:', {
            isPayersAppEnabled: this.isPayersAppEnabled,
            isDuplicatePAEnabled: this.isDuplicatePAEnabled
        });
        // Optionally show a toast (not implemented in wireframe)
    }
}