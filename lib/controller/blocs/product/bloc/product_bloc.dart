// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';

// part 'product_event.dart';
// part 'product_state.dart';

// class ProductBloc extends Bloc<ProductEvent, ProductState> {
//   ProductBloc() : super(ProductInitial()) {
//     on<ProductEvent>((event, emit) {
//       // TODO: implement event handler
//     });
//   }
// }


import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../models/product.dart';
import '../../../api/product.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ApiService apiService;

  ProductBloc({required this.apiService}) : super(ProductInitial()) {
    on<FetchProducts>(_onFetchProducts);
  }

  void _onFetchProducts(FetchProducts event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    try {
      final products = await apiService.fetchProducts();
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}
