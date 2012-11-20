@layout('layout._main')

@section('css')
	@parent
	{{ HTML::style('css/style.css') }}
@endsection

@section('js')
	@parent
	{{ HTML::script('js/category/models.js') }}
	{{ HTML::script('js/category/collections.js') }}
	{{ HTML::script('js/category/views.js') }}
	{{ HTML::script('js/category/category.js') }}
@endsection

@section('content')
	<div id="main-area" class="container">
		<div id="search-area" class="row-fluid">
			Category Search panel
		</div>
		<div id="result-area" class="row-fluid">
			Category Search results
		</div>
	</div>
	<!-- View Templates -->
	<script type="text/template" id="tpl-category-search">
	<form class="form-inline">
		<input type="text" name="input-medium" value="" placeholder="Category code">
		<input type="text" name="input-medium" value="" placeholder="Category name">
		<button type="submit" class="btn btn-primary btn-search">Search</button>
		<button type="cancel" class="btn btn-clear">Clear</button>
	</form>
	</script>
	<script type="text/template" id="tpl-category-results">
	<table class="table table-bordered table-striped table-hover">
		<thead>
			<tr>
				<th class="id-col">Id</th>
				<th class="">Code</th>
				<th class="">Name</th>
				<th class=""><a id="btn-add" class="btn">New</a></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>data</td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</tbody>
	</table>
	</script>
	<script type="text/template" id="tpl-category-row">
	<td class="id-col span1"><%= m.id %></td>
	<td class="span2"><%= m.code %></td>
	<td class="span5"><%= m.name %></td>
	<td class="tc-tool">
		<div class="row-fluid">
			<a class="btn btn-edit">Edit</a>
			<a class="btn btn-danger btn-delete">Delete</a>
		</div>
	</td>	
	</script>
	<script type="text/template" id="tpl-category-edit">
	<td class="id-col span1"><% _.isUndefined(m.id)? print('#'): print(m.id) %></td>
	<td class="span2"><input type="text" class="input-small code-edit" placeholder="Category code" value="<%= m.code %>"></td>
	<td class="span5"><input type="text" class="input-large name-edit" placeholder="Category name" value="<%= m.name %>"></td>
	<td class="span3">
		<div class="row-fluid">
			<a class="btn btn-success btn-save">Save</a>
			<a class="btn btn-warning btn-cancel">Cancel</a>
		</div>
	</td>	
	</script>

	<!-- End View Templates -->
@endsection