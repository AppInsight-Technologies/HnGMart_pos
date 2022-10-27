import 'package:dartz/dartz.dart';
import 'package:dartz/dartz_unsafe.dart';
import 'package:grocbay_pos/core/error/failuers.dart';
import 'package:grocbay_pos/core/usecases/usecase.dart';
import 'package:grocbay_pos/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/util/presentation/constants/ic_constants.dart';
import '../entities/Fetch_category.dart';
import '../repositorie/repository_provider.dart';

class GetCategory extends UseCase<List<CategoryFetch>,NoPrams>{
  DependencyRepostProvider repo ;
  GetCategory(this.repo);

  @override
  Future<Either<Failure, List<CategoryFetch>>> call({NoPrams? data}) async{
    // TODO: implement call
    List<CategoryFetch> list=[];
    final value = await repo.getRequest(Params(uri: Uri.parse("v3/restaurant/get-categories"),methed: Methed.Post,data: {"language_id":"en", "mode":"getAll", "branch":sl<SharedPreferences>().getString(Prefrence.BRANCH),"branchtype":"4"}));
    value.map((r) => r['data'].forEach((v){
      list.add(CategoryFetch.fromJson(v));
    }));

    return  Future.value(value.fold((l) =>Left(l), (r) =>Right( list)));
  }

}
