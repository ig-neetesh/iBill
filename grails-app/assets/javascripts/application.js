window.Html2Pdf = {
    download: function (el, fileName) {
        var pdf = new jsPDF('p', 'pt', 'letter');
        var options = {
            'width': 170,
            'elementHandlers': {
                '#bypassme': function (element, renderer) {
                    return true
                }
            }
        };
        pdf.fromHTML($(el)[0], 15, 15, options, function () {
            pdf.save(fileName);
        });
    }
};
window.RightMenu = {
    toggle: function () {
        $( "#accordion" ).accordion();
        classie.toggle($('#menu')[0], 'cbp-spmenu-open');
    }
};


var app = angular.module('BillGenerator', []);
app.controller('BillInfoCtrl', function($scope) {
    $scope.contenteditable = false;

    $scope.name = "Mr. Neetesh Bhardwaj";
    $scope.relationshipNumber = 1180996674;
    $scope.mobileNumber = "8802773141";
    $scope.address = "Hno-407h\nPkt No-2\nMayur Vihar 1";
    $scope.city = "New Delhi";
    $scope.pincode = "110091";
    $scope.landmark = "Police station";
    $scope.billNumber = 151615772;

    $scope.fromDate = new Date();
    $scope.toDate = new Date();
    $scope.billDate = new Date();
    $scope.payByDate = new Date();
    $scope.creditLimit = "1,800.00";
    $scope.securityDeposite = "0.00";
});
