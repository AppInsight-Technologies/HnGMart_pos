import 'package:grocbay_pos/core/util/presentation/constants/ic_constants.dart';
import 'package:grocbay_pos/feautures/grocbay_pos/domain/entities/fetch_category_product.dart';

import 'package:dartz/dartz.dart';
import 'package:dartz/dartz_unsafe.dart';
import 'package:grocbay_pos/core/error/failuers.dart';
import 'package:grocbay_pos/core/usecases/usecase.dart';
import 'package:grocbay_pos/feautures/grocbay_pos/domain/entities/getBrands.dart';
import 'package:grocbay_pos/feautures/grocbay_pos/domain/entities/getCategories.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../injection_container.dart';
import '../repositorie/repository_provider.dart';

class GetCategoriesUsecase extends UseCase<List<GetCategories>,CategoryParams>{
  DependencyRepostProvider repo ;
  GetCategoriesUsecase(this.repo);

  @override
  Future<Either<Failure, List<GetCategories>>> call({CategoryParams? data}) async{
    // TODO: implement call
    List<GetCategories> list=[];
    final value = await repo.getRequest(Params(uri: Uri.parse("get-product-category/list"),methed: Methed.Post,data: {"branch":sl<SharedPreferences>().getString(Prefrence.BRANCH),}));
    value.map((r) => r['data'].forEach((v){
      list.add(GetCategories.fromJson(v));
    }));

    return  Future.value(value.fold((l) =>Left(l), (r) =>Right( list)));
  }

}
class CategoryParams{
  late String branch;
  CategoryParams({required this.branch,});
}