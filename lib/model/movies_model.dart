class ProductsListModel {
  List<Products>? products;

  ProductsListModel({this.products});

  ProductsListModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String? id;
  Category? category;
  Category? tag;
  String? name;
  String? price;
  String? description;
  String? image;
  String? rating;
  int? reviews;
  String? dateModified;
  String? dateCreated;

  Products(
      {this.id,
      this.category,
      this.tag,
      this.name,
      this.price,
      this.description,
      this.image,
      this.rating,
      this.reviews,
      this.dateModified,
      this.dateCreated});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    tag = json['tag'] != null ? new Category.fromJson(json['tag']) : null;
    name = json['name'];
    price = json['price'];
    description = json['description'];
    image = json['image'];
    rating = json['rating'];
    reviews = json['reviews'];
    dateModified = json['date_modified'];
    dateCreated = json['date_created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.tag != null) {
      data['tag'] = this.tag!.toJson();
    }
    data['name'] = this.name;
    data['price'] = this.price;
    data['description'] = this.description;
    data['image'] = this.image;
    data['rating'] = this.rating;
    data['reviews'] = this.reviews;
    data['date_modified'] = this.dateModified;
    data['date_created'] = this.dateCreated;
    return data;
  }
}

class Category {
  String? id;
  String? name;
  String? image;
  String? dateModified;
  String? dateCreated;

  Category(
      {this.id, this.name, this.image, this.dateModified, this.dateCreated});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    dateModified = json['date_modified'];
    dateCreated = json['date_created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['date_modified'] = this.dateModified;
    data['date_created'] = this.dateCreated;
    return data;
  }
}
