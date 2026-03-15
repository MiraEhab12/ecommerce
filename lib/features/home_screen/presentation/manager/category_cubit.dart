import 'package:ecommerce_udemy/features/home_screen/data/repo/category_repo.dart';
import 'package:ecommerce_udemy/features/home_screen/presentation/manager/category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryRepo repo;

  CategoryCubit(this.repo) : super(const CategoryState());

  static CategoryCubit get(context) => context.read<CategoryCubit>();

  Future<void> getCategories() async {
    emit(state.copyWith(loading: true, error: null));

    final result = await repo.getCategories();

    result.fold(
      (failure) {
        emit(state.copyWith(loading: false, error: failure.message));
      },
      (categories) {
        categories.insert(0, "All");
        emit(
          state.copyWith(
            loading: false,
            categories: categories,
            selectedIndex: 0,
          ),
        );
      },
    );
  }

  void selectCategory(int index) {
    emit(state.copyWith(selectedIndex: index));
  }
}
