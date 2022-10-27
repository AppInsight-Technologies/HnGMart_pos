
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:grocbay_pos/feautures/grocbay_pos/domain/usecases/get-brands_usecase.dart';
import 'package:grocbay_pos/feautures/grocbay_pos/domain/usecases/getCategories_usercase.dart';
import 'package:grocbay_pos/feautures/grocbay_pos/domain/usecases/get_category.dart';

import '../../../../../core/error/failuers.dart';

part 'CategoriesBrands_event.dart';
part 'CategoriesBrands_state.dart';


class CategoriesBrandsBloc extends Bloc<GetCategoriesBrandsEvent, CategoriesBrandsState> {
  GetCategoriesUsecase getCategory;
  GetBrandsUsecase getBrands;

  CategoriesBrandsBloc({required this.getCategory, required this.getBrands}) : super(CategoriesBrandsInitial()) {
    on<OnGetCategoriesBrands>((event, emit) async{

      emit(CategoriesBrandsLoading());
      final categoriesresult =  await getCategory(data:CategoryParams(branch:event.branch));
      final getBrandsresult =    await getBrands(data:BrandParams(branch:event.branch));
      categoriesresult.fold((l) => emit(CategoriesBrandsError(mapFailureToMessage(l))), (r) => emit(CategoriesBrandsSucsess(r)));
      getBrandsresult.fold((l) => emit(CategoriesBrandsError(mapFailureToMessage(l))), (r) => emit(CategoriesBrandsSucsess(r)));


      // TODO: implement event handler
    });
  }
}