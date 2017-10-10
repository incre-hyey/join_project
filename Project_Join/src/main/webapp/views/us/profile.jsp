<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@include file="./login/nav.jsp"%>
	<div class="w3-main" style="margin-left: 300px">
		<%@include file="header.jsp"%>
		<div class="w3-card_con w3-padding-large w3-grey">

			<h2>PROFILE</h2>
			<div class="row">
				<div class="column">
					<div class="card">
						<img src="https://www.w3schools.com/w3images/team1.jpg" alt="Jane" style="width: 100%">
						<div class="card_con">
							<h2>Jane Doe</h2>
							<p class="title">CEO & Founder</p>
							<p><a href="./profile_view.jsp">Some text that describes me lorem ipsum ipsum lorem.Some text that describes me lorem ipsum ipsum lorem.</a></p>
							<p>
								<button class="button">Contact</button>
							</p>
						</div>
					</div>
				</div>

				<div class="column">
					<div class="card">
						<img src="https://www.w3schools.com/w3images/team2.jpg" alt="Mike" style="width: 100%">
						<div class="card_con">
							<h2>Mike Ross</h2>
							<p class="title">Art Director</p>
							<p>Some text that describes me lorem ipsum ipsum lorem.</p>
							<p>example@example.com</p>
							<p>
								<button class="button">Contact</button>
							</p>
						</div>
					</div>
				</div>
				<div class="column">
					<div class="card">
						<img src="https://www.w3schools.com/w3images/team3.jpg" alt="John" style="width: 100%">
						<div class="card_con">
							<h2>John Doe</h2>
							<p class="title">Designer</p>
							<p>Some text that describes me lorem ipsum ipsum lorem.</p>
							<p>example@example.com</p>
							<p>
								<button class="button">Contact</button>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@include file="footer.jsp"%>
	</div>
