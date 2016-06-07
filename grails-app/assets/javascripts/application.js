window.Html2Pdf = {
    download: function (el, fileName) {
        var form = $(el),
            cache_width = form.width(),
            a4 = [595.28, 841.89];  // for a4 size paper width and height


        function createPDF() {
            getCanvas().then(function (canvas) {
                var
                    img = canvas.toDataURL("image/png"),
                    doc = new jsPDF({
                        unit: 'px',
                        format: 'a4'
                    });
                doc.addImage(img, 'JPEG', 10, 20);
                doc.save(fileName);
                form.width(cache_width);
            });
        }

// create canvas object
        function getCanvas() {
            //form.width((a4[0] * 1.33333) - 80).css('max-width', 'none');
            return html2canvas(form, {
                imageTimeout: 2000,
                removeContainer: true
            });
        }

        $('body').scrollTop(0);
        createPDF();
    }
};
window.RightMenu = {
    initiated: false,
    init: function () {
        $("#accordion").accordion();
        var controls = "input,textarea";
        var isCheckBox = function (input) {
            return (input.type == "checkbox");
        };
        var addLabel = function (event, on, invert) {
            if (isCheckBox(on)) {
                return
            }
            var labelFor = $(on).attr("ng-model");
            var labelText = $(on).attr("placeholder") + ':';
            var labelQuery = 'div[used-for="' + labelFor + '"]';
            var label = $(labelQuery);
            if (!label.length) {
                label = '<div class="control-label" used-for="' + labelFor + '">' + labelText + '</div>';
                $(label).insertBefore(on);
                label = $(labelQuery);
            }
            if (invert) {
                $(label).removeClass(event);
            } else {
                $(label).addClass(event);
            }
        };
        var perform = function (event, on, toggleEffect) {
            if (isCheckBox(on)) {
                return
            }
            var highlightOn = $(on).attr("ng-model");
            var items = $('*[listen="' + highlightOn + '"]');
            if (toggleEffect) {
                items.removeClass(event);
            } else {
                items.addClass(event);
            }
        };
        $(controls).mouseover(function () {
            perform('mouseover', this, false);
            addLabel('mouseover', this, false);
        });
        $(controls).mouseout(function () {
            perform('mouseover', this, true);
            addLabel('mouseover', this, true);
        });
        $(controls).focus(function () {
            perform('focus', this, false);
            addLabel('focus', this, false);
        });
        $(controls).blur(function () {
            perform('focus', this, true);
            addLabel('focus', this, true);
        });

        this.initiated = true;
    },
    toggle: function (opener) {
        if (!this.inited) {
            this.init();
        }
        classie.toggle($('#menu')[0], 'cbp-spmenu-open');
        $(opener).toggleClass("opened");
    }
};


var app = angular.module('BillGenerator', []);
app.controller('BillInfoCtrl', function ($scope) {
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

    $scope.billBreakup = {
        monthlyCharges: 399,
        callCharges: 119.70,
        mobileInternetUsage: 987.99,
        valueAddedServices: 36,
        roaming: 8.70,
        discounts: 1109.19,
        taxes: 64.14,
        totalBillAmount: 506.34
    };

    $scope.billSummary = {
        previousBalance: 524.48,
        previousPayment: 525,
        newBillAmount: 1000,
        dueAmountTillPayByDate:0,/* (function () {
            return ($scope.billSummary.newBillAmount + $scope.billSummary.previousBalance - $scope.billSummary.previousPayment);
        })(),*/
        dueAmountAfterPayByDate: 0/*(function () {
            return ($scope.billSummary.dueAmountTillPayByDate + 100)
        })()*/
    };

    $scope.calculate = function () {
        var breakup = {
            monthlyCharges: 0,
            callCharges: 0,
            mobileInternetUsage: 0,
            valueAddedServices: 0,
            roaming: 0,
            discounts: 0,
            taxes: 0,
            totalBillAmount: 0
        };
    };
});

