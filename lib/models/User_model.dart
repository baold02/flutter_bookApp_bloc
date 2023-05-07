class UserModel {
  UserModel({
      this.createdAt, 
      this.name, 
      this.pass, 
      this.phone, 
      this.imageUser, 
      this.assdress, 
      this.id,});

  UserModel.fromJson(dynamic json) {
    createdAt = json['createdAt'];
    name = json['name'];
    pass = json['pass'];
    phone = json['phone'];
    imageUser = json['imageUser'];
    assdress = json['assdress'];
    id = json['id'];
  }
  String? createdAt;
  String? name;
  String? pass;
  String? phone;
  String? imageUser;
  String? assdress;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['createdAt'] = createdAt;
    map['name'] = name;
    map['pass'] = pass;
    map['phone'] = phone;
    map['imageUser'] = imageUser;
    map['assdress'] = assdress;
    map['id'] = id;
    return map;
  }

}