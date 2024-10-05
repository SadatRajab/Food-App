
class User_model {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? image;
  final int? points;
  final int? credit;
  final String? token;

  User_model(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.image,
      this.points,
      this.credit,
      this.token});

  factory User_model.fromJson(Map<String, dynamic> json) {
    return User_model(
        id : json['id']??0,
        name : json['name']??'Null',
        email : json['email']??'Null',
        phone : json['phone']??'Null',
        image : json['image']??'Null',
        points : json['points']??0,
        credit : json['credit']??0,
        token :json['token']??'Null',
    );
  }

}
