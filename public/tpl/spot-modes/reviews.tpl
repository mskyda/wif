<div class="mode-holder">
	<p ng-if="!spot.comments.length" translate="firstReview"></p>
	<ul class="reviews-list" ng-if="spot.comments.length">
		<li ng-repeat="comment in spot.comments">
			<ng-include src="'tpl/star-rate.tpl'"></ng-include>
			<p>"{{comment.message}}"</p>
		</li>
	</ul>
</div>

