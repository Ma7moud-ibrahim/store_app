import 'package:app_store/helper/api.dart';

class AllCategoryService {
  Future<List<dynamic>> getAllCategoryService() async {
    List<dynamic> data = await Api().get(
      uri:
          'https://orbital-module-geologist-13367268-s-team.postman.co/workspace/My-Workspace~6f957398-6d8e-4bbf-8f23-a26072e420a5/example/39941941-259c8004-7bae-4fa2-9049-648f821fd00d?action=share&source=copy-link&creator=39941941',
    );

    return data;
  }
}
