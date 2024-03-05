import 'package:compatibility_app/api/api_requestes.dart';
import 'package:compatibility_app/model/post/blog.dart';
import 'package:compatibility_app/utils/app_helper.dart';
import 'package:get/get.dart';

class BlogController extends GetxController {
  List<Blogs> listBlog = [];

  Future<void> getPost({int? postId}) async {
    await ApiRequestes.getPost(appLanguage: AppHelper.getAppLanguage(), postId: postId)
        .then((value) {
      if (value != null) {
        listBlog.clear();
        listBlog.addAll(value.result!.users!);
      }
    });
  }
}
