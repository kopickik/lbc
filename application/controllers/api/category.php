<?php
class Api_Category_Controller extends Base_Controller {

	public $restful = true;
	public function get_index($id = null) {
		if (is_null($id)) {
			$allCats = Category::all();
			return BaseModel::allToJson($allCats);
		}
		else {
			$cat = Category::find($id);
			return $cat->toJson();
		}
	}

	public function post_index() {
		$cat = Input::json();
		$dbCat = new Category();
		$dbCat->code = $cat->code;
		$dbCat->name = $cat->name;
		$dbCat->save();
		return $dbCat->toJson();
	}
	public function put_index() {
		$cat = Input::json();
		$dbCat = Category::find($cat->id);
		$dbCat->code = $cat->code;
		$dbCat->name = $cat->name;
		$dbCat->save();
		return $dbCat->toJson();
	}
	public function delete_index($id = null) {
		$dbCat = Category::find($id);
		$dbCat->delete();
	}
}
?>