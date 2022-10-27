import 'package:dartz/dartz.dart';
import 'package:dartz/dartz_unsafe.dart';
import 'package:grocbay_pos/core/error/failuers.dart';
import 'package:grocbay_pos/core/usecases/usecase.dart';
import 'package:grocbay_pos/core/util/presentation/constants/ic_constants.dart';
import 'package:grocbay_pos/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../entities/Fetch_category.dart';
import '../entities/fetch_category_product.dart';
import '../entities/get_loyalty_model.dart';
import '../repositorie/repository_provider.dart';

class GetProductBarCode extends UseCase<FetchCategoryProduct,ProductBarCodePArms>{
  DependencyRepostProvider repo ;
  GetProductBarCode(this.repo);

  @override
  Future<Either<Failure, FetchCategoryProduct>> call({ProductBarCodePArms? data}) async{
    // TODO: implement call

    final value = await repo.getRequest(Params(uri: Uri.parse("single-product-by-barcode"),methed: Methed.Post,data: {"barcode":data!.code,"user":"0"}));

    return  Future.value(value.fold((l) =>Left(l), (r) =>Right( FetchCategoryProduct.fromJson(r))));
  }

}
class ProductBarCodePArms{
  late String code;
  late String user;
  ProductBarCodePArms({required this.code,this.user ="0"});
}
