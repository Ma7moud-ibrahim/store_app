import 'dart:io';

class UserProfile {
  // static يعني القيمة دي بتفضل موجودة في الذاكرة طول ما التطبيق شغال
  // وأي صفحة في التطبيق تقدر توصلها من غير ما حد يبعتها ليها
  static String? name;
  static File? image;

  static void save({required String userName, File? userImage}) {
    name = userName;
    image = userImage;
  }
}
