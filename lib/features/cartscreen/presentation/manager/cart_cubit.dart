import 'package:ecommerce_udemy/features/cartscreen/data/repo/cart_repo.dart';
import 'package:ecommerce_udemy/features/cartscreen/presentation/manager/cart_state.dart';
import 'package:ecommerce_udemy/core/data/local/cache_helper.dart';
import 'package:ecommerce_udemy/utils/cache_utils/pref_keys.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo repo;
  CartCubit(this.repo) : super(const CartState());

  static CartCubit get(context) => context.read<CartCubit>();
  Future<void> getUserCart() async {
    emit(state.copyWith(loading: true, error: null));

    // جلب userId من الشيرد
    final int? userId = CacheHelper.getData(key: PrefKeys.userId) as int?;
    print("CartCubit userId = $userId");
    if (userId == null) {
      emit(state.copyWith(loading: false, error: "User ID not found"));
      return;
    }

    final result = await repo.getUserCart(userId);

    result.fold(
      (carts) {
        final allProducts = carts.expand((c) => c.products).toList();
        emit(
          state.copyWith(
            loading: false,
            carts: carts,
            productInCarts: allProducts,
            error: null,
          ),
        );
      },
      (failure) => emit(state.copyWith(loading: false, error: failure.message)),
    );
  }

  Future<void> addToCart(int productId, int quantity) async {
    emit(state.copyWith(loading: true, error: null));

    // جلب userId من الشيرد
    final int? userId = CacheHelper.getData(key: PrefKeys.userId) as int?;

    if (userId == null) {
      emit(state.copyWith(loading: false, error: "User ID not found"));
      return;
    }

    final result = await repo.addCart(productId, quantity, userId);

    result.fold(
      (_) async {
        await getUserCart();
      },
      (failure) => emit(state.copyWith(loading: false, error: failure.message)),
    );
  }
}
  /// جلب الكارت تلقائيًا حسب الـ userId المخزن
 

