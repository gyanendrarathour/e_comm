class UserModel {
  final String uId;
  final String userName;
  final String email;
  final String phone;
  final String userImg;
  final String userDeviceToken;
  final String country;
  final String userAddress;
  final String city;
  final String street;
  final bool isAdmin;
  final bool isActive;
  final DateTime createdOn;

  UserModel(
      {required this.uId,
      required this.userName,
      required this.email,
      required this.phone,
      required this.userImg,
      required this.userDeviceToken,
      required this.country,
      required this.userAddress,
      required this.city,
      required this.street,
      required this.isAdmin,
      required this.isActive,
      required this.createdOn});

  Map<String, dynamic> toMap() {
    return {
      'uId': uId,
      'userName': userName,
      'email': email,
      'phone': phone,
      'userImg': userImg,
      'userDeviceToken': userDeviceToken,
      'country': country,
      'userAddress': userAddress,
      'city': city,
      'street': street,
      'isAdmin': isAdmin,
      'isActive': isActive,
      'createdOn': createdOn
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> json) {
    return UserModel(
        uId: json['uId'],
        userName: json['userName'],
        email: json['email'],
        phone: json['phone'],
        userImg: json['userImg'],
        userDeviceToken: json['userDeviceToken'],
        country: json['country'],
        userAddress: json['userAddress'],
        city: json['city'],
        street: json['street'],
        isAdmin: json['isAdmin'],
        isActive: json['isActive'],
        createdOn: json['createdOn']);
  }
}
