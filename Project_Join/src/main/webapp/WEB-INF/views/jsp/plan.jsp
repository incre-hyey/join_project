<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="nav.jsp"%>

<div class="w3-main" style="margin-left: 300px">
	<div class="w3-container w3-padding-large w3-grey">
		<div id="con_header">
			<div id="London" class="tabcontent">
				<h3>London</h3>
				<p>London is the capital city of England.</p>
			</div>
	
			<div id="Paris" class="tabcontent">
				<h3>Paris</h3>
				<p>Paris is the capital of France.</p>
			</div>
	
			<div id="Tokyo" class="tabcontent">
				<h3>Tokyo</h3>
				<p>Tokyo is the capital of Japan.</p>
			</div>
	
			<button class="tablink" onclick="openCity('London', this, 'red')"
				id="defaultOpen"><i class="fa fa-diamond w3-margin-right"></i>London</button>
			<button class="tablink" onclick="openCity('Paris', this, 'green')"><i class="fa fa-diamond w3-margin-right"></i>Paris</button>
			<button class="tablink" onclick="openCity('Tokyo', this, 'blue')"><i class="fa fa-diamond w3-margin-right"></i>Tokyo</button>
		</div>
		<!-- con_header -->
		<div id="plan_m">
			<div class="plan_list">
				<div class="thumb">
					<img src="https://www.w3schools.com/w3images/avatar_g2.jpg"
						class="w3-round">
				</div>
				<div>
					<ul data-role="listview" data-inset="true">
						<li><a href="#"> <img src="chrome.png">
								<h2>Google Chrome</h2>
								<p>Google Chrome is a free, open-source web browser.
									Released in 2008.Google Chrome is a free, open-source web
									browser. Released in 2008.</p>
						</a></li>

					</ul>
				</div>
			</div>
			<div class="plan_list">
				<div class="thumb">
					<img src="https://www.w3schools.com/w3images/avatar_g2.jpg"
						class="w3-round">
				</div>
				<div>
					<ul data-role="listview" data-inset="true">
						<li><a href="#"> <img src="chrome.png">
								<h2>Google Chrome</h2>
								<p>Google Chrome is a free, open-source web browser.
									Released in 2008.Google Chrome is a free, open-source web
									browser. Released in 2008.</p>
						</a></li>

					</ul>
				</div>
			</div>
			<div class="plan_list">
				<div class="thumb">
					<img src="https://www.w3schools.com/w3images/avatar_g2.jpg"
						class="w3-round">
				</div>
				<div>
					<ul data-role="listview" data-inset="true">
						<li><a href="#"> <img src="chrome.png">
								<h2>Google Chrome</h2>
								<p>Google Chrome is a free, open-source web browser.
									Released in 2008.Google Chrome is a free, open-source web
									browser. Released in 2008.</p>
						</a></li>

					</ul>
				</div>
			</div>
			<div class="plan_list">
				<div class="thumb">
					<img src="https://www.w3schools.com/w3images/avatar_g2.jpg"
						class="w3-round">
				</div>
				<div>
					<ul data-role="listview" data-inset="true">
						<li><a href="#"> <img src="chrome.png">
								<h2>Google Chrome</h2>
								<p>Google Chrome is a free, open-source web browser.
									Released in 2008.Google Chrome is a free, open-source web
									browser. Released in 2008.</p>
						</a></li>

					</ul>
				</div>
			</div>
			<div class="plan_list">
				<div class="thumb">
					<img src="https://www.w3schools.com/w3images/avatar_g2.jpg"
						class="w3-round">
				</div>
				<div>
					<ul data-role="listview" data-inset="true">
						<li><a href="#"> <img src="chrome.png">
								<h2>Google Chrome</h2>
								<p>Google Chrome is a free, open-source web browser.
									Released in 2008.Google Chrome is a free, open-source web
									browser. Released in 2008.</p>
						</a></li>

					</ul>
				</div>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>
</div>
