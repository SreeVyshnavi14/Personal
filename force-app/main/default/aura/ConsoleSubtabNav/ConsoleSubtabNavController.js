({	
    openTab : function(component, event, helper) {
        var workspaceAPI = component.find("workspace");
        workspaceAPI.openTab({
            url: '#/sObject/001dN00000mpTcuIAC/view',
            focus: true
        });
    },
	openTab1: function(component, event, helper) {
        var workspaceAPI = component.find("workspace");
        console.log("workspaceID@@"+workspaceAPI); 
        workspaceAPI.openTab({
            //lightning/app/c__Care_CoordinationApp/r/Account/001dN00000mpGruIAF/view
            pageReference: {
                type: 'standard__recordPage',
            	attributes: {
                	objectApiName: 'Account',
                	actionName: 'view',
                	recordId: '001dN00000mpGruIAF'
            	},
            	state: {
                	filterName: ""
            	}
                //type: 'standard__webPage',
            	//attributes: {
                //	url: '/lightning/r/Account/001dN00000mpGruIAF/view'
            	//}
            },
            focus: true
        }).then(function(response) {
            workspaceAPI.getAllTabInfo().then(function(response) {
                var focusedTabId = response.tabId;
                console.log('Test : ' + JSON.parse(JSON.stringify(response)))
                
                for(var i = 0; i < response.length; i++) {
        			var tabTitle = response[i].title; // title of the tab - usually the record "Name" field, if this is a "customTitle..."
        			var customTitle = response[i].name; // use this title if you have given a title to the tabs that you are wanting to close
			        var tabId = response[i].tabId; // this is the id you'll need to call the closeTab function
                    
                    console.log('Test ' + i + ' : ' + tabTitle + ' & ' + tabId + ' & ' + customTitle)

                    // You can add more customizations to this, like checking if this is a parent tab, or a subtab, or if it's focused, then not to close it
                    // just use response[i].attributeName in your 'response' to figure this out.
                    //if(tabTitle === tabTitleToDelete) {
                    //    workspaceAPI.closeTab({tabId: tabId});
                    //}
			    }
                focus: true
                
            	workspaceAPI.openSubtab ({
                    parentTabId: 'ctab1',
                    recordId : 'CareGdN000000AuvN1UptwPIAF',
                    focus: true
                }).then(function(response) {
                    workspaceAPI.openSubtab ({
                    parentTabId: focusedTabId,
                    recordId : recTempId,
                    focus: true
        			})
                })
                
                
        });
        }).catch(function(error) {
            console.log(error);
        })
    }
    
})