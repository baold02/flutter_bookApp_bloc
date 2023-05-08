/// createdAt : "2023-05-07T11:14:22.487Z"
/// name : "name 1"
/// imgae : "imgae 1"
/// price : "price 1"
/// athur : "athur 1"
/// id : "1"

class FavoriteBookModel {
  FavoriteBookModel({
      String? createdAt, 
      String? name, 
      String? imgae, 
      String? price, 
      String? athur, 
      String? id,}){
    _createdAt = createdAt;
    _name = name;
    _imgae = imgae;
    _price = price;
    _athur = athur;
    _id = id;
}

  FavoriteBookModel.fromJson(dynamic json) {
    _createdAt = json['createdAt'];
    _name = json['name'];
    _imgae = json['imgae'];
    _price = json['price'];
    _athur = json['athur'];
    _id = json['id'];
  }
  String? _createdAt;
  String? _name;
  String? _imgae;
  String? _price;
  String? _athur;
  String? _id;
FavoriteBookModel copyWith({  String? createdAt,
  String? name,
  String? imgae,
  String? price,
  String? athur,
  String? id,
}) => FavoriteBookModel(  createdAt: createdAt ?? _createdAt,
  name: name ?? _name,
  imgae: imgae ?? _imgae,
  price: price ?? _price,
  athur: athur ?? _athur,
  id: id ?? _id,
);
  String? get createdAt => _createdAt;
  String? get name => _name;
  String? get imgae => _imgae;
  String? get price => _price;
  String? get athur => _athur;
  String? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['createdAt'] = _createdAt;
    map['name'] = _name;
    map['imgae'] = _imgae;
    map['price'] = _price;
    map['athur'] = _athur;
    map['id'] = _id;
    return map;
  }

}