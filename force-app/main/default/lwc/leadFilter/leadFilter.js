import UserPreferencesShowStreetAddressToExternalUsers from '@salesforce/schema/User.UserPreferencesShowStreetAddressToExternalUsers';
import { api, track, LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import f1 from '@salesforce/apex/LeadsController.getAllLeads';
import f2 from '@salesforce/apex/LeadsController.getOpenNotContactedLeads';
import f3 from '@salesforce/apex/LeadsController.getWorkingContactedLeads';
import f4 from '@salesforce/apex/LeadsController.getClosedConvertedLeads';
import f5 from '@salesforce/apex/LeadsController.getClosedNotConvertedLeadsName';

import NAME_FIELD from '@salesforce/schema/Lead.Name';
import COMPANY_FIELD from '@salesforce/schema/Lead.Company';
import EMAIL_FIELD from '@salesforce/schema/Lead.Email';
import PHONE_FIELD from '@salesforce/schema/Lead.Phone';
import STATUS_FIELD from '@salesforce/schema/Lead.Status';

export default class LeadFilter extends LightningElement {

    @track leadTable = [
        {label:'Name', fieldName:'Name', type: NAME_FIELD},  
        {label:'Company', fieldName:'Company', type: COMPANY_FIELD}, 
        {label:'Email', fieldName:'Email', type: EMAIL_FIELD}, 
        {label:'Phone', fieldName:'Phone', type: PHONE_FIELD}, 
        {label:'Status', fieldName:'Status', type: STATUS_FIELD},       
    ];

    @track leadList;


    showError = (msg) => {
        const evt = new ShowToastEvent({
            title: 'OOPS Something went wrong',
            message: msg,
            variant: 'error',
            mode: 'dismissable'
        });
        this.dispatchEvent(evt)        
    }

    getData = (foo) => {
        foo()
        .then(data => {
            this.leadList = [...data]
        })
        .catch(error => {
            this.showError(error.body.message + ' bummer!')
        })
    }

    //this could be a single call just switch off the id
    wowamazing1()  { this.getData(f1); }
    wowamazing2()  { this.getData(f2); }
    wowamazing3()  { this.getData(f3); }
    wowamazing4()  { this.getData(f4); }
    wowamazing5()  { this.getData(f5); }



}