/// createdAt : "2023-05-08T06:26:26.107Z"
/// imgae : "imgae 1"
/// name : "name 1"
/// athur : "athur 1"
/// description : "description 1"
/// rate : "rate 1"
/// price : "price 1"
/// quantity : 64
/// idBook : "idBook 1"
/// id : "1"

class BookOrderModel {
  BookOrderModel({
      String? createdAt, 
      String? imgae, 
      String? name, 
      String? athur, 
      String? description, 
      String? rate, 
      String? price, 
      num? quantity, 
      String? idBook, 
      String? id,}){
    _createdAt = createdAt;
    _imgae = imgae;
    _name = name;
    _athur = athur;
    _description = description;
    _rate = rate;
    _price = price;
    _quantity = quantity;
    _idBook = idBook;
    _id = id;
}

  BookOrderModel.fromJson(dynamic json) {
    _createdAt = json['createdAt'];
    _imgae = json['imgae'];
    _name = json['name'];
    _athur = json['athur'];
    _description = json['description'];
    _rate = json['rate'];
    _price = json['price'];
    _quantity = json['quantity'];
    _idBook = json['idBook'];
    _id = json['id'];
  }
  String? _createdAt;
  String? _imgae;
  String? _name;
  String? _athur;
  String? _description;
  String? _rate;
  String? _price;
  num? _quantity;
  String? _idBook;
  String? _id;
BookOrderModel copyWith({  String? createdAt,
  String? imgae,
  String? name,
  String? athur,
  String? description,
  String? rate,
  String? price,
  num? quantity,
  String? idBook,
  String? id,
}) => BookOrderModel(  createdAt: createdAt ?? _createdAt,
  imgae: imgae ?? _imgae,
  name: name ?? _name,
  athur: athur ?? _athur,
  description: description ?? _description,
  rate: rate ?? _rate,
  price: price ?? _price,
  quantity: quantity ?? _quantity,
  idBook: idBook ?? _idBook,
  id: id ?? _id,
);
  String? get createdAt => _createdAt;
  String? get imgae => _imgae;
  String? get name => _name;
  String? get athur => _athur;
  String? get description => _description;
  String? get rate => _rate;
  String? get price => _price;
  num? get quantity => _quantity;
  String? get idBook => _idBook;
  String? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['createdAt'] = _createdAt;
    map['imgae'] = _imgae;
    map['name'] = _name;
    map['athur'] = _athur;
    map['description'] = _description;
    map['rate'] = _rate;
    map['price'] = _price;
    map['quantity'] = _quantity;
    map['idBook'] = _idBook;
    map['id'] = _id;
    return map;
  }

}