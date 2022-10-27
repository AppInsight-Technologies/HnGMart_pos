import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:grocbay_pos/feautures/grocbay_pos/domain/usecases/get_sub_category.dart';

import '../../../../../../core/error/failuers.dart';
import '../../../../domain/entities/fetch_subcategory.dart';

part 'subCategory_event.dart';

part 'subCategory_state.dart';

class SubcategoryBloc extends Bloc<SubcategoryEvent, SubcategoryState> {
  SubcategoryBloc(GetSubCategory getSubCategory) : super(SubcategoryStateInitial()) {
    on<SubcategoryEvent>((event, emit) async{
      // TODO: implement event handler
      emit(SubcategoryStateLoading());
      final value = await getSubCategory(data: SubCatParms(allkey:"All", catId: event.props.first as int));
      value.fold((l) => emit(SubcategoryStateError(mapFailureToMessage(l))), (r) => emit(SubcategoryStateSucsess<List<FetchSubCategory>>(r)));
      // TODO: implement event handler

    });
  }
}