<div class="mode-holder" ng-controller="LoginController">
	<div class="wrapper">
		<span class="label">Enter your user ID:</span>
		<input ng-model="userID" placeholder="user ID (60 chars)" type="password" autocomplete="off"/>
	</div>
	<div ng-if="userID.length >= 60">
		<span ng-if="unauthorized == true" class="errorMsg">User ID is wrong</span>
		<div ng-if="captchaPassed != true" id="recaptcha"></div>
		<a class="cta" ng-click="onSendCredentials()">Send</a>
	</div>
</div>