// lib/presentation/providers/categories_admin_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shop_app/data/remote/api/categoryremotedatasource.dart';
import '../../domain/model/category.dart';

class CategoriesAdminState {
  final List<Category> categories;
  final bool           isLoading;
  final bool           isLoadingMore;
  final String?        error;
  final String         search;
  final int            page;
  final bool           hasMore;
  final int            total;
  final CategoryFormState formState;

  const CategoriesAdminState({
    this.categories = const [],
    this.isLoading  = false,
    this.isLoadingMore = false,
    this.error,
    this.search     = '',
    this.page       = 1,
    this.hasMore    = false,
    this.total      = 0,
    this.formState  = const CategoryFormIdle(),
  });

  List<Category> get filtered => search.isEmpty
      ? categories
      : categories.where((c) =>
          c.name.toLowerCase().contains(search.toLowerCase())).toList();

  CategoriesAdminState copyWith({
    List<Category>? categories,
    bool?           isLoading,
    bool?           isLoadingMore,
    String?         error,
    String?         search,
    int?            page,
    bool?           hasMore,
    int?            total,
    CategoryFormState? formState,
  }) => CategoriesAdminState(
    categories: categories ?? this.categories,
    isLoading:  isLoading  ?? this.isLoading,
    isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    error:      error,
    search:     search     ?? this.search,
    page:       page       ?? this.page,
    hasMore:    hasMore    ?? this.hasMore,
    total:      total      ?? this.total,
    formState:  formState  ?? this.formState,
  );
}

sealed class CategoryFormState {
  const CategoryFormState();
}
class CategoryFormIdle    extends CategoryFormState { const CategoryFormIdle(); }
class CategoryFormSaving  extends CategoryFormState { const CategoryFormSaving(); }
class CategoryFormSuccess extends CategoryFormState {
  final String message;
  const CategoryFormSuccess(this.message);
}
class CategoryFormError extends CategoryFormState {
  final String message;
  const CategoryFormError(this.message);
}

class CategoriesAdminNotifier extends StateNotifier<CategoriesAdminState> {
  final CategoryRemoteDatasource _datasource;

  CategoriesAdminNotifier(this._datasource) : super(const CategoriesAdminState()) {
    load();
  }

  Future<void> load({bool reset = true}) async {
    final currentState = state;
    final nextPage = reset ? 1 : currentState.page;

    if (reset) {
      state = currentState.copyWith(isLoading: true, error: null, page: 1);
    } else {
      if (currentState.isLoadingMore || !currentState.hasMore) return;
      state = currentState.copyWith(isLoadingMore: true);
    }

    try {
      final result = await _datasource.getCategories(page: nextPage, pageSize: 20);
      final nextCategories = reset
          ? result.results
          : [...currentState.categories, ...result.results];

      state = state.copyWith(
        categories: nextCategories,
        total: result.count,
        hasMore: result.next != null,
        page: nextPage + 1,
        isLoading: false,
        isLoadingMore: false,
        error: null,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        isLoadingMore: false,
        error:     e.toString().replaceAll('Exception: ', ''),
      );
    }
  }

  Future<void> loadMore() => load(reset: false);

  void setSearch(String q) => state = state.copyWith(search: q);

  // Toggle optimista
  Future<void> toggleActive(int id, bool isActive) async {
    state = state.copyWith(
      categories: state.categories.map((c) =>
        c.id == id ? c.copyWith(isActive: isActive) : c,
      ).toList(),
    );
    try {
      await _datasource.updateCategory(id, {'is_active': isActive});
    } catch (_) {
      state = state.copyWith(
        categories: state.categories.map((c) =>
          c.id == id ? c.copyWith(isActive: !isActive) : c,
        ).toList(),
      );
    }
  }

  Future<void> createCategory(Map<String, dynamic> payload) async {
    state = state.copyWith(formState: const CategoryFormSaving());
    try {
      final created = await _datasource.createCategory(payload);
      state = state.copyWith(
        categories: [created, ...state.categories],
        formState:  const CategoryFormSuccess('Categoría creada'),
      );
    } catch (e) {
      state = state.copyWith(
        formState: CategoryFormError(e.toString().replaceAll('Exception: ', '')),
      );
    }
  }

  Future<void> updateCategory(int id, Map<String, dynamic> payload) async {
    state = state.copyWith(formState: const CategoryFormSaving());
    try {
      final updated = await _datasource.updateCategory(id, payload);
      state = state.copyWith(
        categories: state.categories.map((c) => c.id == id ? updated : c).toList(),
        formState:  const CategoryFormSuccess('Categoría actualizada'),
      );
    } catch (e) {
      state = state.copyWith(
        formState: CategoryFormError(e.toString().replaceAll('Exception: ', '')),
      );
    }
  }

  Future<void> deleteCategory(int id) async {
    try {
      await _datasource.deleteCategory(id);
      state = state.copyWith(
        categories: state.categories.where((c) => c.id != id).toList(),
      );
    } catch (e) {
      state = state.copyWith(error: e.toString().replaceAll('Exception: ', ''));
    }
  }

  void resetFormState() =>
      state = state.copyWith(formState: const CategoryFormIdle());
}

final categoriesAdminProvider =
    StateNotifierProvider<CategoriesAdminNotifier, CategoriesAdminState>((ref) {
  return CategoriesAdminNotifier(ref.watch(categoryDatasourceProvider));
});