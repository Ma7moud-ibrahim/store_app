import 'dart:io';

class UserProfile {
  static String? name;
  static String? password;
  static String? phone;
  static File? image;

  static void save({
    String? userName,
    String? userPassword,
    String? userPhone,
    File? userImage,
  }) {
    if (userName != null) name = userName;
    if (userPassword != null) password = userPassword;
    if (userPhone != null) phone = userPhone;
    if (userImage != null) image = userImage;
  }
}
