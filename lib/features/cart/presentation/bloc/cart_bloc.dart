import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../products/domain/entity/product_entity.dart';
import '../../domain/entity/cart_entity.dart';
import '../../domain/usecase/add_to_cart_usecase.dart';
import '../../domain/usecase/clear_cart_usecase.dart';
import '../../domain/usecase/decrease_cart_quantity_usecase.dart';
import '../../domain/usecase/get_cart_usecase.dart';
import '../../domain/usecase/increase_cart_quantity_usecase.dart';
import '../../domain/usecase/remove_from_cart_usecase.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  //======================
  // Use Cases
  //======================

  final GetCartUseCase getCartUseCase;
  final AddToCartUseCase addToCartUseCase;
  final IncreaseCartQuantityUseCase increaseCartQuantityUseCase;
  final DecreaseCartQuantityUseCase decreaseCartQuantityUseCase;
  final RemoveFromCartUseCase removeFromCartUseCase;
  final ClearCartUseCase clearCartUseCase;

  //======================
  // Constructor
  //======================

  CartBloc(
    this.getCartUseCase,
    this.addToCartUseCase,
    this.increaseCartQuantityUseCase,
    this.decreaseCartQuantityUseCase,
    this.removeFromCartUseCase,
    this.clearCartUseCase,
  ) : super(const CartState()) {
    _registerEvents();
  }

  void _registerEvents() {
    // on<LoadCartEvent>(_loadCart);

    on<AddToCartEvent>(_onAddToCart);

    on<IncreaseQuantityEvent>(_onIncreaseQuantity);

    on<DecreaseQuantityEvent>(_onDecreaseQuantity);

    on<RemoveFromCartEvent>(_onRemoveFromCart);

    on<ClearCartEvent>(_onClearCart);
  }

  List<CartEntity> get cartItems {
    return state.cartProducts;
  }

  double get totalPrice {
    return state.cartProducts.fold(
      0,
      (sum, item) => sum + (item.product.price ?? 0) * item.quantity,
    );
  }

  int getQuantity(ProductEntity product) {
    try {
      return state.cartProducts
          .firstWhere((item) => item.product.id == product.id)
          .quantity;
    } catch (_) {
      return 0;
    }
  }

  Future<void> _onAddToCart(
    AddToCartEvent event,
    Emitter<CartState> emit,
  ) async {
    await _handleCartResult(emit, addToCartUseCase.execute(event.product));
  }

  Future<void> _onIncreaseQuantity(
    IncreaseQuantityEvent event,
    Emitter<CartState> emit,
  ) async {
    await _handleCartResult(
      emit,
      increaseCartQuantityUseCase.execute(event.product),
    );
  }

  Future<void> _onDecreaseQuantity(
    DecreaseQuantityEvent event,
    Emitter<CartState> emit,
  ) async {
    await _handleCartResult(
      emit,
      decreaseCartQuantityUseCase.execute(event.product),
    );
  }

  Future<void> _onRemoveFromCart(
    RemoveFromCartEvent event,
    Emitter<CartState> emit,
  ) async {
    await _handleCartResult(emit, removeFromCartUseCase.execute(event.product));
  }

  Future<void> _onClearCart(
    ClearCartEvent event,
    Emitter<CartState> emit,
  ) async {
    await _handleCartResult(emit, clearCartUseCase.execute());
  }

  //======================
  // Shared Method
  //======================

  Future<void> _handleCartResult(
    Emitter<CartState> emit,
    Future resultFuture,
  ) async {
    final result = await resultFuture;

    result.fold(
      ifLeft: (failure) {
        emit(state.copyWith(error: failure.message));
      },
      ifRight: (cartItems) {
        emit(state.copyWith(products: cartItems, ));
      },
    );
  }
}
