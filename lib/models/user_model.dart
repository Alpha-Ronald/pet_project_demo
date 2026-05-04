

class UserModel{
  UserModel({

    required this.name,
    required this.address,
    required this.email,
    required this.imageUrl,
});

  final String name;
  final String address;
  final String email;
  final String imageUrl;


  factory UserModel.fromMap(Map<String,dynamic> data){
    return UserModel(
      name: data['name'] ?? '',
      address: data['address']??  '',
      email: data['email'],
      imageUrl:data["imageUrl"],

    );

  }
}