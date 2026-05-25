sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"aayush/employee/employee/test/integration/pages/EmployeeSetList",
	"aayush/employee/employee/test/integration/pages/EmployeeSetObjectPage"
], function (JourneyRunner, EmployeeSetList, EmployeeSetObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('aayush/employee/employee') + '/test/flpSandbox.html#aayushemployeeemployee-tile',
        pages: {
			onTheEmployeeSetList: EmployeeSetList,
			onTheEmployeeSetObjectPage: EmployeeSetObjectPage
        },
        async: true
    });

    return runner;
});

