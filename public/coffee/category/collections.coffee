class CategoryCollection extends app.BaseCollection 
	url:'/lbc/lbc/public/api/category'
	model: app.Category

@app = window.app ? {}
@app.CategoryCollection = CategoryCollection