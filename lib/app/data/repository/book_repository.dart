import 'package:tugas2/app/data/model/book_model.dart';

import '../../util/app_constants.dart';
import '../core/dio_client.dart';

class BookRepo {
  final DioClient dioClient;
  BookRepo(this.dioClient);

  Future getBook({String isbn = '9780131495050'}) async {
    try {
      final response = await dioClient.get(
        AppConstants.bookUri + isbn,
      );

      BookModel result = BookModel.fromJson(response);
      return result;
    } catch (e) {
      return e;
    }
  }
}
