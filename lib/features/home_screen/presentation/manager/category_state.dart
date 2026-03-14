import 'package:equatable/equatable.dart';

class CategoryState extends Equatable {
  final bool loading;
  final String? error;
  final List<String> categories;
  final int selectedIndex;

  const CategoryState({
    this.loading = false,
    this.error,
    this.categories = const [],
    this.selectedIndex = 0,
  });

  CategoryState copyWith({
    bool? loading,
    String? error,
    List<String>? categories,
    int? selectedIndex,
  }) {
    return CategoryState(
      loading: loading ?? this.loading,
      error: error,
      categories: categories ?? this.categories,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }

  @override
  List<Object?> get props => [loading, error, categories, selectedIndex];
}
