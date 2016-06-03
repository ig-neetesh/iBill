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

    <asset:javascript src="jquery-1.7.1.min.js"/>
    <asset:javascript src="angular.min.js"/>
    <asset:javascript src="right-menu.js"/>
    <asset:javascript src="jspdf.min.js"/>
    <asset:javascript src="jquery-ui.js"/>
    <asset:javascript src="application.js"/>
    <g:layoutHead/>
</head>

<body ng-app="BillGenerator" ng-controller="BillInfoCtrl">
<div class="cbp-spmenu-push">
    <nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-right" id="menu">
        <h3>Control</h3>
        <input type="checkbox" ng-model="contenteditable">Edit content

        <div id="accordion">
            <h3>User info</h3>

            <div>
                <input type="text" ng-model="name" placeholder="Name">
                <input type="number" ng-model="relationshipNumber" placeholder="Relationship Number">
                <input type="text" ng-model="mobileNumber" placeholder="Mobile number">
                <textarea ng-model="address" placeholder="Address"></textarea>
                <input type="text" ng-model="city" placeholder="City">
                <input type="text" ng-model="pincode" placeholder="Pincode">
                <input type="text" ng-model="landmark" placeholder="Landmark">
            </div>

            <h3>Bill Info</h3>

            <div>
                <input type="number" ng-model="billNumber" placeholder="Bill Number">
                <input type="date" ng-model="billDate" placeholder="Bill date">
                <input type="date" ng-model="payByDate" placeholder="Pay by date">
                <input type="date" ng-model="fromDate" placeholder="From date">
                <input type="date" ng-model="toDate" placeholder="To date">

                <input type="text" ng-model="creditLimit" placeholder="Credit Limit">
                <input type="text" ng-model="securityDeposite" placeholder="Security Deposite">
            </div>
            <h3>Bill Info</h3>
        </div>

        <input type="text" name="aaa" placeholder="Bill">

        <button onclick="Html2Pdf.download('.container', 'MyFile.pdf')">Download</button>
    </nav>

    <div class="container">
        <div class="main" contenteditable="{{contenteditable}}">
            <g:layoutBody/>
            <section>
                <h2>Slide Menus</h2>
                <button onclick="RightMenu.toggle()">Show/Hide Controls</button>
            </section>
        </div>
    </div>
</div>
</body>

</html>
