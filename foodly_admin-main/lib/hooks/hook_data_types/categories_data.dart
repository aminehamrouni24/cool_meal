
import 'package:foodly_admin/models/api_error.dart';
import 'package:foodly_admin/models/categories.dart';

class FetchCategories {
  final List<Category>? categories;
  final int currentPage;
  final int totalPages;
  final ApiError? error;
  final bool isLoading;
  final Function? refetch;

  FetchCategories(
      {required this.categories,
      required this.currentPage,
      required this.totalPages,
      required this.error,
      required this.isLoading,
      required this.refetch});
}
