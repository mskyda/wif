<div class="wrapper" ng-if="center == null">
	<h2><strong>Add spot:</strong> use one of the buttons below</h2>
</div>

<div ng-if="center != null">

	<div ng-if="step == 0">

		<div ng-if="spot.coords == null" class="wrapper">
			<h2><strong>Add spot:</strong> choose place on map with double-click</h2>
			<a class="reset-location" ng-click="resetLocation()">Select another location</a>
		</div>

		<div ng-if="spot.coords != null" class="wrapper">
			<h2><strong>Add spot:</strong> Lat.: {{spot.coords.lat}}; Lng.: {{spot.coords.lng}}</h2>
			<a class="wizard-next" ng-click="wizardGo(1)">Next step</a>
		</div>

	</div>

	<div ng-if="step == 1 && spot.coords != null">

		<div ng-if="spot.coords != null" class="wrapper">
			<h2><strong>Add spot:</strong> enter the spot-name</h2>
			<input ng-model="spot.name" placeholder="minimum 6 chars" type="text" />
			<a class="wizard-next" ng-click="wizardGo(-1)">Previous step</a>
			<a ng-if="spot.name != null && spot.name.length > 5" class="cta" ng-click="onAddSpot()">Add</a>
		</div>

	</div>

</div>