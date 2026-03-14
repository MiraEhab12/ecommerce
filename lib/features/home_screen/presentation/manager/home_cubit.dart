
import 'package:ecommerce_udemy/features/home_screen/data/repo/home_repo.dart';
import 'package:ecommerce_udemy/features/home_screen/presentation/manager/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepo repo;

  ProductCubit(this.repo) : super(const ProductState());

  static ProductCubit get(context) => context.read<ProductCubit>();

  Future<void> getProducts() async {
    emit(state.copyWith(loading: true, error: null));

    final result = await repo.getProducts();

    result.fold(
      (products) {
        emit(state.copyWith(
          loading: false,
          products: products,
        ));
      },
      (failure) {
        emit(state.copyWith(
          loading: false,
          error: failure.message,
        ));
      },
    );
  }
Future<void> getProductsByCategory(String category) async {
  emit(state.copyWith(loading: true));

  final result = await repo.getProductsByCategory(category);

  result.fold(
    (products) {
      emit(
        state.copyWith(
          loading: false,
          products: products,
        ),
      );
    },
    (error) {
      emit(
        state.copyWith(
          loading: false,
          error: error.message,
        ),
      );
    },
  );
}
}
