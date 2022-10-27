import 'package:dartz/dartz.dart';
import 'package:grocbay_pos/core/error/failuers.dart';
import 'package:grocbay_pos/core/usecases/usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/util/presentation/constants/ic_constants.dart';
import '../../../../injection_container.dart';
import '../entities/fetch_subcategory.dart';
import '../repositorie/repository_provider.dart';

class GetSubCategory extends UseCase<List<FetchSubCategory>,SubCatParms>{
  DependencyRepostProvider repo ;
  GetSubCategory(this.repo);

  @override
  Future<Either<Failure, List<FetchSubCategory>>> call({SubCatParms? data}) async {
    // TODO: implement call
    List<FetchSubCategory> list=[];

    final value = await repo.getRequest(Params(uri: Uri.parse("v2/restaurant/get-sub-category/${data!.catId}"),methed: Methed.Post,data: {"allKey":data.allkey,"language_id":"0", "branch":"${sl<SharedPreferences>().getString(Prefrence.BRANCH)}"}));
    value.map((r) => r['data'].forEach((v){
      list.add(FetchSubCategory.fromJson(v));
    }));
    return  Future.value(value.fold((l) =>Left(l), (r) =>Right( list)));
  }
}
class SubCatParms{
  late String allkey;
  late int catId;
  SubCatParms({required this.allkey, required this.catId});
}
