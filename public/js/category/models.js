// Generated by CoffeeScript 1.3.3
(function() {
  var Category, CategorySearchModel, _ref,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Category = (function(_super) {

    __extends(Category, _super);

    function Category() {
      return Category.__super__.constructor.apply(this, arguments);
    }

    Category.prototype.urlRoot = '/lbc/lbc/public/api/category';

    Category.prototype.defaults = {
      code: '',
      name: ''
    };

    return Category;

  })(app.BaseModel);

  CategorySearchModel = (function(_super) {

    __extends(CategorySearchModel, _super);

    function CategorySearchModel() {
      return CategorySearchModel.__super__.constructor.apply(this, arguments);
    }

    return CategorySearchModel;

  })(app.BaseModel);

  this.app = (_ref = window.app) != null ? _ref : {};

  this.app.Category = Category;

  this.app.CategorySearchModel = CategorySearchModel;

}).call(this);
