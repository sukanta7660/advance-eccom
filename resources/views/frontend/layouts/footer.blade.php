
	<!-- Start Footer Area -->
	<footer class="footer">
		<!-- Footer Top -->
		<div class="footer-top section">
			<div class="container">
				<div class="row">
					<div class="col-lg-5 col-md-6 col-12">
						<!-- Single Widget -->
						<div class="single-footer about">
							@php
								$settings=DB::table('settings')->get();
							@endphp
                            <div class="logo">
                                <img src="@foreach($settings as $data) {{$data->logo}} @endforeach" alt="logo">
                            </div>
							<p class="text">@foreach($settings as $data) {{$data->short_des}} @endforeach</p>
							<p class="call">Got Question? Call us 24/7<span><a href="tel:123456789">@foreach($settings as $data) {{$data->phone}} @endforeach</a></span></p>
						</div>
						<!-- End Single Widget -->
					</div>
					<div class="col-lg-3 col-md-6 col-12">
						<!-- Single Widget -->
						<div class="single-footer links">
							<h4>Information</h4>
							<ul>
								<li><a href="{{route('about-us')}}">About Us</a></li>
								<li><a href="{{route('contact')}}"> Contact Us </a></li>
							</ul>
						</div>
						<!-- End Single Widget -->
					</div>
					<div class="col-lg-4 col-md-6 col-12">
						<!-- Single Widget -->
						<div class="single-footer social">
							<h4>Get In Touch</h4>
							<div class="contact">
								<ul>
									<li>@foreach($settings as $data) {{$data->address}} @endforeach</li>
									<li>@foreach($settings as $data) {{$data->email}} @endforeach</li>
									<li>@foreach($settings as $data) {{$data->phone}} @endforeach</li>
								</ul>
							</div>
							<div class="sharethis-inline-follow-buttons"></div>
						</div>
						<!-- End Single Widget -->
					</div>
				</div>
			</div>
		</div>
		<!-- End Footer Top -->
		<div class="copyright">
			<div class="container">
				<div class="inner">
					<div class="row">
						<div class="col-lg-6 col-12">
							<div class="left">
								<p>Copyright © {{date('Y')}} All Rights Reserved.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- /End Footer Area -->

	<!-- Jquery -->
    <script src="{{asset('frontend/js/jquery.min.js')}}"></script>
    <script src="{{asset('frontend/js/jquery-migrate-3.0.0.js')}}"></script>
	<script src="{{asset('frontend/js/jquery-ui.min.js')}}"></script>
	<script src="{{asset('frontend/js/popper.min.js')}}"></script>
	<script src="{{asset('frontend/js/bootstrap.min.js')}}"></script>
	<script src="{{asset('frontend/js/colors.js')}}"></script>
	<script src="{{asset('frontend/js/slicknav.min.js')}}"></script>
	<script src="{{asset('frontend/js/owl-carousel.js')}}"></script>
	<script src="{{asset('frontend/js/magnific-popup.js')}}"></script>
	<script src="{{asset('frontend/js/waypoints.min.js')}}"></script>
	<script src="{{asset('frontend/js/finalcountdown.min.js')}}"></script>
	<script src="{{asset('frontend/js/nicesellect.js')}}"></script>
	<script src="{{asset('frontend/js/flex-slider.js')}}"></script>
	<script src="{{asset('frontend/js/scrollup.js')}}"></script>
	<script src="{{asset('frontend/js/onepage-nav.min.js')}}"></script>
	<script src="{{asset('frontend/js/isotope/isotope.pkgd.min.js')}}"></script>
	<script src="{{asset('frontend/js/easing.js')}}"></script>
	<script src="{{asset('frontend/js/active.js')}}"></script>


	@stack('scripts')
	<script>
		setTimeout(function(){
		  $('.alert').slideUp();
		},5000);
		$(function() {
		// ------------------------------------------------------- //
		// Multi Level dropdowns
		// ------------------------------------------------------ //
			$("ul.dropdown-menu [data-toggle='dropdown']").on("click", function(event) {
				event.preventDefault();
				event.stopPropagation();

				$(this).siblings().toggleClass("show");


				if (!$(this).next().hasClass('show')) {
				$(this).parents('.dropdown-menu').first().find('.show').removeClass("show");
				}
				$(this).parents('li.nav-item.dropdown.show').on('hidden.bs.dropdown', function(e) {
				$('.dropdown-submenu .show').removeClass("show");
				});

			});
		});
	  </script>
