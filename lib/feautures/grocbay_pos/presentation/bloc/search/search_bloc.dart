import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:grocbay_pos/core/usecases/usecase.dart';
import 'package:grocbay_pos/feautures/grocbay_pos/domain/entities/pos_ordersearch_model.dart';
import 'package:grocbay_pos/feautures/grocbay_pos/presentation/bloc/order/order_managment_bloc.dart';

import '../../../../../core/error/failuers.dart';
import '../../../domain/entities/fetch_category_product.dart';
import '../../../domain/entities/search_user_modle.dart';
import '../../../domain/usecases/barcode_search_usecase.dart';
import '../../../domain/usecases/product_search_usecase.dart';
import '../../../domain/usecases/searchorderlist_usercase.dart';
import '../../../domain/usecases/usersearch_usecase.dart';

part 'search_event.dart';
part 'search_state.dart';



class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchUserUsecase searchUserrUsecase;
  SearchProductUsecase searchProductUsecase;
  SearchOrderUsecase searchOrderUsecase;

  SearchBloc({required this.searchUserrUsecase,required this.searchProductUsecase,required this.searchOrderUsecase}) : super(SearchInitial()) {
    on<OnSearch>((event, emit) async {
      emit(SearchLoading());
      switch(event.type){

        case SearchType.user:
          final  result =  await searchUserrUsecase(data: UsersearchData(event.query));
          result.fold((l) => emit(SearchError(mapFailureToMessage(l))), (r) => emit(SearchSucsess<List<SearchUser>>(r)));
          // TODO: Handle this case.
          break;
        case SearchType.product:
          final  result =  await searchProductUsecase(data: ProductsearchData(event.query));
          result.fold((l) => emit(SearchError(mapFailureToMessage(l))), (r) => emit(SearchSucsess<List<FetchCategoryProduct>>(r)));
          // TODO: Handle this case.
          break;
        case SearchType.order:
          final  result =  await searchOrderUsecase(data: OrdersearchParam(query:event.query,start: "0" ));
          result.fold((l) => emit(SearchError(mapFailureToMessage(l))), (r) => emit(SearchSucsess<List<PosOrderSearch>>(r)));
          // TODO: Handle this case.
          break;
      }
     // TODO: implement event handler
    });
  }
}