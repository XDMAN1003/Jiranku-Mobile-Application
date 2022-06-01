const database = require("../database");

// Here, we are implementing the class with Singleton design pattern

class ProductModel {
  constructor() {
    if (this.instance) return this.instance;
    ProductModel.instance = this;
  }

  get() {
    return database.getList("product");
  }

  getById(id) {
    return database.get("product", id);
  }

  create(todo) {
    return database.create("product", todo);
  }

  delete(id) {
    return database.delete("product", id);
  }

  update(id, todo) {
    return database.set("product", id, todo);
  }
}

module.exports = new ProductModel();
