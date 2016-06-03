<div ng-controller="LoginController">
	<h2><strong>Add spot :</strong> enter your email <a ng-click="onPopupEmail()">(why?)</a></h2>
	<input ng-model="userEmail" placeholder="email" type="email" ng-pattern="/^[^\s@]+@[^\s@]+\.[^\s@]{2,}$/" autocomplete="off" />
	<label ng-if="haveUserID != true" for="have-id">I have user ID:</label>
	<input ng-if="haveUserID != true" id="have-id" ng-model="$parent.haveUserID" type="checkbox" />
	<input ng-model="$parent.userID" placeholder="user ID (60 chars)" type="password" ng-if="haveUserID == true" autocomplete="off" />
	<span ng-if="unauthorized == true" class="errorMsg">Check Email / ID</span>
	<a class="wizard-control" ng-if="userEmail.length && haveUserID != true" ng-click="onSendCredentials()">Send email</a>
	<a class="wizard-control" ng-if="userEmail.length > 5 && userID.length >= 60" ng-click="onSendCredentials()"><span class="desktop-only">Next </span>&gt;</a>
</div>