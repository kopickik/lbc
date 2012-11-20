<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>{{ $viewName }}</title>
	<meta name="viewport" content="width=device-width">
	@section('css')
	{{ HTML::style('css/bootstrap.css') }}
	{{ HTML::style('css/bootstrap-responsive.css') }}
	@yield_section			
</head>
<body>
	<div class="container">
		<div class="hero-unit">
			<h1>{{ $viewName }}</h1>
		</div>
		<div class="row-fluid">
			@yield('content')
		</div>
	</div>
	
	<!-- JavaScript libraries -->
	@section('js')
	{{ HTML::script('js/lib/jquery-1.8.2.min.js')}}
	{{ HTML::script('js/lib/underscore-min.js')}}
	{{ HTML::script('js/lib/backbone-min.js')}}
	{{ HTML::script('js/lib/bootstrap.min.js')}}
	{{ HTML::script('js/base/base.js')}}
	@yield_section
	<!-- JavaScript application -->
</body>
</html>