import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_shop_app/data/remote/api/categoryremotedatasource.dart';
import 'package:flutter_shop_app/domain/model/category.dart';
import 'package:flutter_shop_app/presentation/providers/categoriesadminprovider.dart';

class _FakeCategoryRemoteDatasource implements CategoryRemoteDatasource {
  _FakeCategoryRemoteDatasource(this.pages);

  final List<PaginatedCategories> pages;
  int _callCount = 0;

  @override
  Future<PaginatedCategories> getCategories({int page = 1, int pageSize = 20}) async {
    final index = _callCount;
    _callCount += 1;
    return pages[index];
  }

  @override
  Future<Category> getCategory(int id) async {
    throw UnimplementedError();
  }

  @override
  Future<Category> createCategory(Map<String, dynamic> payload) async {
    throw UnimplementedError();
  }

  @override
  Future<Category> updateCategory(int id, Map<String, dynamic> payload) async {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteCategory(int id) async {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getStats() async {
    throw UnimplementedError();
  }
}

void main() {
  test('loadMore appends categories from the next page', () async {
    final datasource = _FakeCategoryRemoteDatasource([
      PaginatedCategories(
        count: 2,
        next: 'page=2',
        results: [
          const Category(
            id: 1,
            name: 'Tecnología',
            slug: 'tecnologia',
            description: '',
            isActive: true,
            totalProducts: 2,
            createdAt: '',
          ),
        ],
      ),
      PaginatedCategories(
        count: 2,
        next: null,
        results: [
          const Category(
            id: 2,
            name: 'Hogar',
            slug: 'hogar',
            description: '',
            isActive: true,
            totalProducts: 1,
            createdAt: '',
          ),
        ],
      ),
    ]);

    final notifier = CategoriesAdminNotifier(datasource);

    await Future<void>.delayed(const Duration(milliseconds: 1));
    expect(notifier.debugState.categories.length, 1);
    expect(notifier.debugState.page, 2);

    await notifier.loadMore();

    expect(notifier.debugState.categories.length, 2);
    expect(notifier.debugState.page, 3);
  });
}
