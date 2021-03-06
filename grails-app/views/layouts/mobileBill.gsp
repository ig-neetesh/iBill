<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Grails"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
    <asset:stylesheet src="application.css"/>

    <asset:javascript src="jquery.min.js"/>
    <asset:javascript src="angular.min.js"/>
    <asset:javascript src="right-menu.js"/>
    <asset:javascript src="jspdf.min.js"/>
    <asset:javascript src="html2canvas.min.js"/>
    <asset:javascript src="jquery-ui.js"/>
    <asset:javascript src="application.js"/>
    <g:layoutHead/>
</head>

<body ng-app="BillGenerator" ng-controller="BillInfoCtrl">
<div class="cbp-spmenu-push">
    <nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-right" id="menu">
        <div class="menu-handler" onclick="RightMenu.toggle(this)"></div>

        <h3 class="pad20">Control</h3>

        <div class="control-page">
            <input type="checkbox" id="freeHandEditing" ng-model="contenteditable">
            <label for="freeHandEditing">Edit page like a document</label>

            <div class="clearfix"></div>
        </div>

        <div id="accordion">
            <h3>User info</h3>

            <div>
                <div class="control-panel push-left">
                    <input type="text" ng-model="name" placeholder="Name">
                    <input type="number" ng-model="relationshipNumber" placeholder="Relationship Number">
                    <input type="text" ng-model="mobileNumber" placeholder="Mobile number">
                </div>

                <div class="control-panel push-right">
                    <textarea ng-model="address" placeholder="Address"></textarea>
                    <input type="text" ng-model="city" placeholder="City">
                    <input type="text" ng-model="pincode" placeholder="Pincode">
                    <input type="text" ng-model="landmark" placeholder="Landmark">
                </div>

                <div class="clearfix"></div>
            </div>

            <h3>Bill info</h3>

            <div>
                <div class="control-panel push-left">
                    <input type="number" ng-model="billNumber" placeholder="Bill Number">
                    <input type="text" ng-model="creditLimit" placeholder="Credit Limit">
                    <input type="text" ng-model="securityDeposite" placeholder="Security Deposite">

                </div>

                <div class="control-panel push-right">
                    <input type="date" ng-model="billDate" placeholder="Bill date">
                    <input type="date" ng-model="payByDate" placeholder="Pay by date">
                    <input type="date" ng-model="fromDate" placeholder="From date">
                    <input type="date" ng-model="toDate" placeholder="To date">
                </div>

                <div class="clearfix"></div>
            </div>

            <h3>Old bill info</h3>

            <div>
                <div class="info-panel">Please fill exact numbers!!! We will create formula using these numbers. So we can perfectly calculate your new bill.</div>

                <div>
                    <input type="number" ng-model="billBreakup.monthlyCharges" placeholder="Monthly charges">
                </div>

                <div class="border-top control-panel-full">
                    <div class="control-panel push-left">
                        <input type="number" ng-model="billBreakup.callCharges" placeholder="Call charges">
                        <input type="number" ng-model="billBreakup.mobileInternetUsage"
                               placeholder="Mobile internet usage">
                    </div>

                    <div class="control-panel push-right">
                        <input type="number" ng-model="billBreakup.valueAddedServices"
                               placeholder="Value added services">
                        <input type="number" ng-model="billBreakup.roaming" placeholder="Roaming">
                    </div>

                    <div class="clearfix"></div>
                </div>

                <div class="border-top">
                    <div class="control-panel push-left">
                        <input type="number" ng-model="billBreakup.discounts" placeholder="Discounts">
                    </div>

                    <div class="control-panel push-right">
                        <input type="number" ng-model="billBreakup.taxes" placeholder="Taxes">
                    </div>

                    <div class="clearfix"></div>
                </div>

                <div class="border-top">
                    <input type="number" ng-model="billBreakup.totalBillAmount" placeholder="Total bill amount">
                </div>
            </div>

            <h3>Desired bill charges</h3>

            <div>
                <div>
                    <div class="control-panel push-left">

                        <input type="number" ng-model="billSummary.previousBalance" placeholder="Previous balance">
                    </div>

                    <div class="control-panel push-right">
                        <input type="number" ng-model="billSummary.previousPayment" placeholder="Previous payment">
                    </div>

                    <div class="clearfix"></div>
                </div>

                <div class="border-top">
                    <input type="number" ng-model="billSummary.newBillAmount" placeholder="New bill amount">
                </div>
            </div>
        </div>
        <button ng-click="calculate()">Calculate</button>

        <button onclick="Html2Pdf.download('.container', 'MyFile.pdf')">Download</button>
    </nav>

    <div class="container">
        <div class="main" contenteditable="{{contenteditable}}">
            <g:layoutBody/>
        </div>
    </div>
</div>
</body>

</html>
