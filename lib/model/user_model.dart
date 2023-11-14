

class UserModel {
  String userName;
  String userEmail;
  String userGender;
  String userPhoneNumber;
  String userImage;
  String userAddress;

  UserModel( {
    required this.userName,
    required this.userAddress,
    required this.userEmail,
    required this.userGender,
    required this.userPhoneNumber,
    required this.userImage
  });
}
