import 'package:get/get.dart';
import 'package:tugas2/app/data/model/book_model.dart';
import 'package:tugas2/app/data/repository/book_repository.dart';

class BookController extends GetxController {
  final BookRepo bookRepo;

  BookController(this.bookRepo);

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(milliseconds: 100)).then((value) async {
      await getBook();
    });
  }

  String name = 'test';

  BookModel? book;

  Future<void> getBook() async {
    BookModel result = await bookRepo.getBook();
    book = result;
    update();
  }
}
