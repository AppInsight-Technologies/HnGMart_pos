import 'package:dartz/dartz.dart';
import 'package:dartz/dartz_unsafe.dart';
import 'package:grocbay_pos/core/error/failuers.dart';
import 'package:grocbay_pos/core/usecases/usecase.dart';
import 'package:grocbay_pos/core/util/presentation/constants/ic_constants.dart';
import 'package:grocbay_pos/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../entities/Fetch_category.dart';
import '../entities/get_loyalty_model.dart';
import '../repositorie/repository_provider.dart';

class GetLoyaltyUsecase extends UseCase<getLoyalty,LoyaltyParams>{
  DependencyRepostProvider repo ;
  GetLoyaltyUsecase(this.repo);

  @override
  Future<Either<Failure, getLoyalty>> call({LoyaltyParams? data}) async{
    // TODO: implement call

    final value = await repo.getRequest(Params(uri: Uri.parse("get-loyalty"),methed: Methed.Post,data: {"branch":sl<SharedPreferences>().getString(Prefrence.BRANCH)}));

    return  Future.value(value.fold((l) =>Left(l), (r) =>Right( getLoyalty.fromJson(r))));
  }

}
class LoyaltyParams{
  late String branch;
  LoyaltyParams({required this.branch});
}
