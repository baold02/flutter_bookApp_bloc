class BookModel {
  BookModel({
      this.createdAt, 
      this.imgae, 
      this.name, 
      this.athur, 
      this.description, 
      this.rate, 
      this.price, 
      this.status, 
      this.id,});

  BookModel.fromJson(dynamic json) {
    createdAt = json['createdAt'];
    imgae = json['imgae'];
    name = json['name'];
    athur = json['athur'];
    description = json['description'];
    rate = json['rate'];
    price = json['price'];
    status = json['status'];
    id = json['id'];
  }
  String? createdAt;
  String? imgae;
  String? name;
  String? athur;
  String? description;
  String? rate;
  String? price;
  String? status;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['createdAt'] = createdAt;
    map['imgae'] = imgae;
    map['name'] = name;
    map['athur'] = athur;
    map['description'] = description;
    map['rate'] = rate;
    map['price'] = price;
    map['status'] = status;
    map['id'] = id;
    return map;
  }

}