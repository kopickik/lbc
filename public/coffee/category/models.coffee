class Category extends app.BaseModel
	urlRoot:'/lbc/lbc/public/api/category'
	defaults:
		code:''
		name:''

class CategorySearchModel extends app.BaseModel

@app = window.app ? {}
@app.Category = Category
@app.CategorySearchModel = CategorySearchModel