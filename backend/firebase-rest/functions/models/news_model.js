const database = require("../database");

// Here, we are implementing the class with Singleton design pattern

class NewsModel {
  constructor() {
    if (this.instance) return this.instance;
    NewsModel.instance = this;
  }

  get() {
    return database.getList("news");
  }

  getById(id) {
    return database.get("news", id);
  }

  create(todo) {
    return database.create("news", todo);
  }

  delete(id) {
    return database.delete("news", id);
  }

  update(id, todo) {
    return database.set("news", id, todo);
  }
}

module.exports = new NewsModel();
