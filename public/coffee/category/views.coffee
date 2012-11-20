# this is a view to represent Category Search panel
class CategorySearchView extends app.BaseView
	el:'#search-area'
	events: 
		'click .btn-search':'search'
		'click .btn-clear':'clear'

	initialize:->
		@$el.empty()
		@$el.html $('#tpl-category-search').html()
		@render()

	render:->

	search: (e)->
		e.preventDefault()
		@model.trigger 'search'

	clear: (e)->
		e.preventDefault()
		@model.trigger 'reset'


# this is a view to represent Category Search Results section

class CategoryResultView extends app.BaseView
	el:'#result-area'
	events: 
		'click #btn-add':'create' # Add event mapp, wire-up 'btn-add' with a function(callback).

	initialize:->
		@collection.on 'reset', @render, @
		@$el.empty()
		@$el.html $('#tpl-category-results').html()
		@render()

	render:->
		$tbody = @$('tbody')
		$tbody.empty()
		$this = @
		@collection.each (item) ->
			item.on 'save', $this.itemSave, $this
			item.on 'delete', $this.itemDelete, $this
			item.on 'edit', $this.itemEdit, $this
			item.on 'cancel', $this.itemCancel, $this
			displayView = new app.CategoryRowDisplayView model:item
			$tbody.append displayView.render().el
		@
	create:->
		newItem = new app.Category code:'', name:'' #inside that, create new category backbone.model for user to edit.  Attach some events to the model.
		newItem.on 'save', @itemSave, @
		newItem.on 'delete', @itemDelete, @
		newItem.on 'edit', @itemEdit, @
		newItem.on 'cancel', @cancelEdit, @
		editView = new app.CategoryRowEditView model:newItem
		@$('tbody').prepend editView.render().el

	itemSave: (view)->
		model = view.model
		model.save null,
			wait: true
			success: (rmodel, response)->
				rowView = new CategoryRowDisplayView model:model
				$editViewEl = view.$el
				$editViewEl.replaceWith rowView.render().el
				$editViewEl.attr 'id', model.id
			error: (rmodel, response)->
				console.log response

	itemDelete: (view)->
		model = view.model
		if model.isNew()
			view.remove()
		else
			model.destroy
				wait:true
				success:->view.remove()
				error: (rmodel, errors) -> console.log errors

	itemEdit: (view)->
		$rowViewEl = view.$el
		model = view.model
		#Create new edit view with the model
		editView = new app.CategoryRowEditView model:model
		$rowViewEl.replaceWith editView.render().el
		$rowView.attr 'id', model.id

	cancelEdit: (view)->
		model = view.model
		if model.isNew()
			view.remove()
		else
			rowView = new CategoryRowDisplayView model:model
			$editViewEl = view.$el
			$editViewEl.replaceWith rowView.render().el
			
# this is a view to represent combined area of search panel and search results
# i.e. sections represented by CategoryResultView and CategorySearchView

class CategoriesView extends app.BaseView
	initialize:->
		@searchModel = new app.CategorySearchModel
		@searchModel.on 'search', @search, @
		@searchModel.on 'reset', @reset, @

		@categoryCollection = new app.CategoryCollection

		@searchView = new app.CategorySearchView model: @searchModel
		@resultView = new app.CategoryResultView collection:@categoryCollection

	search:->
		@categoryCollection.fetch()
	reset:->
		@categoryCollection.reset []

class CategoryRowDisplayView extends app.BaseView
	tagName: 'tr'
	template: _.template($('#tpl-category-row').html())
	events:
		'click .btn-edit':'edit'
		'click .btn-delete':'delete'

	render:->
		@$el.html @template(m: @model.toJSON())
		@$el.attr 'id', @model.id
		@

	edit:->
		@model.trigger 'edit', @

	delete:->
		@model.trigger 'delete', @
# This is the view to represent edit mode row of the category table with contents.
class CategoryRowEditView extends app.BaseView
	tagName: 'tr'
	template: _.template($('#tpl-category-edit').html())
	events:
		'click .btn-save':'save'
		'click .btn-cancel':'cancel'

	render:->
		@$el.html @template(m: @model.toJSON())
		@$el.attr 'id', if @model.id? then @model.id else @model.cid
		@

	save:->
		#Update the model with values
		@model.set code:@$('.code-edit').val(), name:@$('.name-edit').val()
		@model.trigger 'save', @	# we'll trigger it is done with the view

	cancel:->
		@model.trigger 'cancel', @ 	# we'll inform the user upon cancel the edit

@app = window.app ? {}
@app.CategorySearchView = CategorySearchView
@app.CategoryResultView = CategoryResultView
@app.CategoriesView = CategoriesView
@app.CategoryRowDisplayView = CategoryRowDisplayView
@app.CategoryRowEditView = CategoryRowEditView