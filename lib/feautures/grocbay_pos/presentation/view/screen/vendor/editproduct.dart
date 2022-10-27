import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocbay_pos/core/util/presentation/styles/screen_size_rario.dart';
import 'package:grocbay_pos/feautures/grocbay_pos/domain/entities/VendorProductVariation_model.dart';
import 'package:grocbay_pos/feautures/grocbay_pos/presentation/bloc/CategoriesBrands/CategoriesBrands_bloc.dart';
import 'package:grocbay_pos/feautures/grocbay_pos/presentation/bloc/VendorProductVariation/VendorProductVariation.dart';
import 'package:grocbay_pos/feautures/grocbay_pos/presentation/view/widgte/ProductTextForm.dart';
import 'package:grocbay_pos/feautures/grocbay_pos/presentation/view/widgte/ProductTextfield.dart';
import 'package:grocbay_pos/generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../core/util/presentation/constants/ic_constants.dart';
import '../../../../../../core/util/presentation/controller/product_add_controller.dart';
import '../../../../../../injection_container.dart';
import '../../../../domain/entities/fetch_category_product.dart';
import '../../../../domain/usecases/VendorProduct_usecase.dart';
import '../../../bloc/VendorProduct/VendorProduct.dart';
import '../../../rought_genrator.dart';
import '../../widgte/ProductDropdownTextform.dart';
import '../../widgte/ProductImagePicker.dart';
import '../../widgte/VendorVariationList.dart';

class EditVendorProduct extends StatefulWidget {
  final Map<String, dynamic>? qparams;

  const EditVendorProduct({Key? key,this.qparams}) : super(key: key);

  @override
  _EditVendorProductState createState() => _EditVendorProductState();
}

class _EditVendorProductState extends State<EditVendorProduct>
    with Navigations {
  bool _itemactiveswitchValue = false;
  var varindex = 0;
  List <FetchCategoryProduct> _data = [];
  //Arrays for product add standing data
  List<String> stock_types = [];
  List<String> delivery_duration = [];
  List<String> product_type = [];
  List<String> veg_type = [];
  List<String> return_duration = [];
  List<String> express_delivery_eligible = [];
  List<String> subscription_product = [];
  List<String> vendor_list = [];
  List<String> category_list = [];
  List<String> brand_list = [];
  List<String> min_max_expiry = [];

  //Textediting controllers
  var ItemName = TextEditingController();
  var ItemNameHindi = TextEditingController();
  var StockType = '';
  var DeliveryDuration = '';
  var ProductType = '';
  var VegType = '';
  var StockNotify = TextEditingController();
  var ReturnDuration = 'TextEditingController()';
  var Tax = TextEditingController();
  var ExpressEligible = '';
  var ItemDescription = TextEditingController();
  var ManufacturerDescription = TextEditingController();
  var ItemPriority = TextEditingController();
  var CountryOfOrigin = TextEditingController();
  var SubscriptionProduct = '';
  var Vendor = '';
  var Category = '';
  var Brand = '';

  //single stock variables
  var SingleStock = TextEditingController();
  var SingleSKU = TextEditingController();
  var SingleNetweight = TextEditingController();
  var SingleBarcode = TextEditingController();
  var SingleLoyalty = TextEditingController();
  var SingleMin = TextEditingController();
  var SingleMax = TextEditingController();
  var SingleUnit = TextEditingController();
  var SingleIncrement = TextEditingController();
  var SingleMRP = TextEditingController();
  var SingleSellingPrice = TextEditingController();
  var SingleMembership = TextEditingController();
  var SingleHSN = TextEditingController();
  var SingleShortNote = TextEditingController();
  bool ShowSingledesign = false;
  List<Variation> variationsarray = [];
  late final data;
  //model object creation
  // ProductAddParms product_obj = ProductAddParms();
  AddProductController product_obj = AddProductController();

  @override
  void initState() {
    if(widget.qparams!['fromScreen'].toString() == "editProduct") {
       data = jsonDecode(widget.qparams!['product']);
      debugPrint("widget.qparams!['product']..." +
          data.toString());
     // _data.addAll(data);
      debugPrint("itemdecode..." + data['item_name']);
       ItemName.text = data['item_name'];
       StockType = data['type'];
       StockNotify.text = "10";
       Tax.text = data['sales_tax'];
       ItemDescription.text = data['item_description'];
       ItemPriority.text = data['priority'];

       if(data['type'] == "1"){
         SingleStock.text = data['stock'].toString();
         SingleSKU.text = "";
         SingleNetweight.text = data['net_weight'].toString();
          SingleBarcode.text = "";
          SingleLoyalty.text = data['loyaltys'].toString();
          SingleMin.text = data['min_item'].toString();
          SingleMax.text = data['max_item'].toString();
          SingleUnit.text = data['unit'].toString();
          SingleIncrement.text = data['increament'].toString();
          SingleMRP.text = data['mrp'].toString();
          SingleSellingPrice.text = data['price'].toString();
          SingleMembership.text = data['membership_price'].toString();
          SingleHSN.text = "";
          SingleShortNote.text = data['singleshortNote'];
       }
      // DeliveryDuration = data['delivery_duration'] == "slot"?;
     //  ItemName.text = data['item_name'];
    //   ItemName.text = data['item_name'];
     //  ItemName.text = data['item_name'];
    }else if(widget.qparams!['fromScreen'].toString() == "searchBarcode"){
      data = jsonDecode(widget.qparams!['product']);
      debugPrint("widget.qparams!['product']..." +
          data.toString());
      debugPrint("itemdecode..." + data[0]['item_name']);
      ItemName.text = data[0]['item_name'];
      StockType = data[0]['type'];
      StockNotify.text = "10";
      Tax.text = data[0]['sales_tax'];
      ItemDescription.text = data[0]['item_description'];
      ItemPriority.text = data[0]['priority'];

      if(data[0]['type'] == "1"){
        SingleStock.text = data[0]['stock'].toString();
        SingleSKU.text = "";
        SingleNetweight.text = data[0]['net_weight'].toString();
        SingleBarcode.text = "";
        SingleLoyalty.text = data[0]['loyaltys'].toString();
        SingleMin.text = data[0]['min_item'].toString();
        SingleMax.text = data[0]['max_item'].toString();
        SingleUnit.text = data[0]['unit'].toString();
        SingleIncrement.text = data[0]['increament'].toString();
        SingleMRP.text = data[0]['mrp'].toString();
        SingleSellingPrice.text = data[0]['price'].toString();
        SingleMembership.text = data[0]['membership_price'].toString();
        SingleHSN.text = "";
        SingleShortNote.text = data[0]['singleshortNote'];
      }
    }

    stock_types = [(widget.qparams!['fromScreen'].toString() == "searchBarcode"?data[0]['type'] == "1" :data['type'] == "1")? S.current.single_sku:S.current.multi_sku];
    delivery_duration = [S.current.slot_based_deli];
    veg_type = ["Standard", "Fish", "Meat", "Offer", "Liqour", "Addon"];
    return_duration = [
      "No Return",
     /* "3 Hrs",
      "6 Hrs",
      "12 Hrs",
      "1 Day",
      "2 Day",
      "3 Day",
      "4 Day",
      "5 Day",
      "6 Day",
      "1 Week"*/
    ];
    express_delivery_eligible = [(widget.qparams!['fromScreen'].toString() == "searchBarcode"?data[0]['eligible_for_express'] == "1" :data['eligible_for_express'] == "1")?"No":"Yes"];
    subscription_product = [ (widget.qparams!['fromScreen'].toString() == "searchBarcode"?data[0]['eligible_for_subscription'] == "1" :data['eligible_for_subscription'] == "1")?"No":"Yes"];
    vendor_list = ["No Vendor"];
    brand_list = [widget.qparams!['fromScreen'].toString() == "searchBarcode"?data[0]['brand']:data['brand']];

    //calling bloc to get the categories and brands on page load
    var brandslistfull = BlocProvider.of<CategoriesBrandsBloc>(context).add(OnGetCategoriesBrands(sl<SharedPreferences>().getString(Prefrence.BRANCH)!,));


   // debugPrint("stock type on page load"+StockType.toString());
    // TODO: implement initState
    super.initState();
  }

  setdropdownValue(value,controller,bool? issingle){
    setState(() {
      controller = value;

if(issingle == true){
  ShowSingledesign = true;
}
else{
  ShowSingledesign = false;
}
    });
  }
  @override
  Widget build(BuildContext context) {

  //  debugPrint("Stock type in build method"+StockType.toString());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:(LayoutView(context).isMobile)? AppBar(
         elevation: 0,
        automaticallyImplyLeading: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Theme.of(context).primaryColor),
            onPressed: () {
              Navigator.of(context).pop();

            }),

        title: Row(
          children: [
            widget.qparams!['fromScreen'].toString() == "AddProduct"?
            Text(
              widget.qparams!['fromScreen'].toString() == "AddProduct"?
              S.of(context).Create_Item:(widget.qparams!['fromScreen'].toString() == "searchBarcode")?data[0]['item_name']:data['item_name'],
              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 24),
            )
            :Container(
              width:  MediaQuery.of(context).size.width / 1.3,
              child: Text(
                widget.qparams!['fromScreen'].toString() == "AddProduct"?
                S.of(context).Create_Item:(widget.qparams!['fromScreen'].toString() == "searchBarcode")?data[0]['item_name']:data['item_name'],
                style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            widget.qparams!['fromScreen'].toString() == "AddProduct"?Spacer():SizedBox.shrink(),
            widget.qparams!['fromScreen'].toString() == "AddProduct"? GestureDetector(
              onTap: (){
                sl<SharedPreferences>().setString("load", "0");
                Navigation(context,
                    navigatore: NavigatoreTyp.push,
                    name: Routename.VendorProductVariation);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Theme.of(context).primaryColor)),
                  child:
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                        children: [
                          Icon(Icons.add,color: Theme.of(context).primaryColor,size: 20,),
                          Text(
                           S.of(context).add_vartiation,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: LayoutView(context).isMobile?14:20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                  ),
                ),
              ),
            ):SizedBox.shrink()
          ],
        ),
      ):null,
      body: (LayoutView(context).isMobile)?
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color: Colors.white,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      // Expanded(
                      //     flex: 2,
                      //     child: Row(
                      //       children: [
                      //         const Text(
                      //           'Item Variation',
                      //           style: TextStyle(
                      //               color: Colors.black,
                      //               fontSize: 22,
                      //               fontWeight: FontWeight.bold),
                      //         ),
                      //         // Transform.scale(
                      //         //   scale: 0.7,
                      //         //   child: CupertinoSwitch(
                      //         //     value: _itemactiveswitchValue,
                      //         //     onChanged: (bool value) {
                      //         //       setState(() {
                      //         //         _itemactiveswitchValue = value;
                      //         //       });
                      //         //     },
                      //         //   ),
                      //         // ),
                      //       ],
                      //     )),

                    ],
                  ),
                ),

            /*    Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:  Container(
                      height: 45,
                      child: Text(
                      widget.qparams!['fromScreen'].toString() == "AddProduct"? S.of(context).Create_Item:(widget.qparams!['fromScreen'].toString() == "searchBarcode")?data[0]['item_name']:data['item_name'],
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,

                      ),
                    ),
                  ),
                ),*/
                (widget.qparams!['fromScreen'].toString() == "editProduct")?
                CachedNetworkImage(
                  imageUrl: data['item_featured_image'],
                  progressIndicatorBuilder:
                      (context, url,
                      downloadProgress) =>
                      Image.asset("assets/images/default_category.png"),
                  errorWidget:
                      (context, url, error) {
                    print("error img :$url");
                    return Image.asset("assets/images/default_category.png");
                  },
                  height: 130,
                  width: 130,
                ):(widget.qparams!['fromScreen'].toString() == "searchBarcode")?
                CachedNetworkImage(
                  imageUrl: data[0]['item_featured_image'],
                  progressIndicatorBuilder:
                      (context, url,
                      downloadProgress) =>
                      Image.asset("assets/images/default_category.png"),
                  errorWidget:
                      (context, url, error) {
                    print("error img :$url");
                    return Image.asset("assets/images/default_category.png");
                  },
                  height: 130,
                  width: 130,
                )
                    :SizedBox.shrink(),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProductTextForm(
                        labelText: S.of(context).item_name, controller: ItemName),
                  ),
                ),
             /*   Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProductTextForm(
                        labelText: S.of(context).item_name_in_hindi,
                        controller: ItemNameHindi),
                  ),
                ),*/
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropDownformfield(
                      labelText: S.of(context).stock_type,
                      DropdownItems: stock_types,
                      controller: StockType,parentfunction: setdropdownValue,),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropDownformfield(
                        labelText: S.of(context).delivery_duration,
                        DropdownItems: delivery_duration,
                        controller: DeliveryDuration,parentfunction: setdropdownValue),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropDownformfield(
                        labelText: S.of(context).product_type,
                        DropdownItems: veg_type,
                        controller: VegType,parentfunction: setdropdownValue),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProductTextForm(
                        labelText: S.of(context).stock_notify, controller: StockNotify),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropDownformfield(
                        labelText: S.of(context).return_duration,
                        DropdownItems: return_duration,
                        controller: ReturnDuration,parentfunction: setdropdownValue),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProductTextForm(labelText: 'Tax', controller: Tax),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropDownformfield(
                        labelText: S.of(context).express_delivery_eligible,
                        DropdownItems: express_delivery_eligible,
                        controller: ExpressEligible,parentfunction: setdropdownValue),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProductTextField(
                        labelText: S.of(context).item_description,
                        controller: ItemDescription),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProductTextField(
                        labelText: S.of(context).manufacturer_description,
                        controller: ManufacturerDescription),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProductTextForm(
                        labelText: S.of(context).item_priority, controller: ItemPriority),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProductTextForm(
                        labelText: S.of(context).country_of_origin,
                        controller: CountryOfOrigin),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropDownformfield(
                        labelText: S.of(context).subscription_product,
                        DropdownItems: subscription_product,
                        controller: SubscriptionProduct,parentfunction: setdropdownValue),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropDownformfield(
                        labelText: S.of(context).select_vendor,
                        DropdownItems: vendor_list,
                        controller: Vendor,parentfunction: setdropdownValue),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropDownformfield(
                        labelText: S.of(context).Brand,
                        DropdownItems: brand_list,
                        controller: Brand,parentfunction: setdropdownValue),
                  ),
                ),
                (widget.qparams!['fromScreen'].toString() == "editProduct" || (widget.qparams!['fromScreen'].toString() == "searchBarcode"))?
               SizedBox.shrink()
                    : Container(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductImagePicker(),
                    )),



                ///Single SKU Design changes

                (ShowSingledesign || widget.qparams!['fromScreen'].toString() == "searchBarcode"?data[0]['type'] == "1" :data['type'] == "1")?Column(
               //   mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ProductTextForm(
                            labelText: S.of(context).Stock, controller: SingleStock),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ProductTextForm(
                            labelText: S.of(context).SKU,
                            controller: SingleSKU),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ProductTextForm(
                            labelText: S.of(context).net_weight,
                            controller: SingleNetweight),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ProductTextForm(
                            labelText: S.of(context).Barcode,
                            controller: SingleBarcode),
                      ),
                    ),
                  ],
                ):SizedBox.shrink(),
                (ShowSingledesign || widget.qparams!['fromScreen'].toString() == "searchBarcode"?data[0]['type'] == "1" :data['type'] == "1")?Column(
                 // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ProductTextForm(
                            labelText: S.of(context).Loyalty, controller: SingleLoyalty),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ProductTextForm(
                            labelText: S.of(context).Min,
                            controller: SingleMin),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ProductTextForm(
                            labelText: S.of(context).Max,
                            controller: SingleMax),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ProductTextForm(
                            labelText: S.of(context).Unit,
                            controller: SingleUnit),
                      ),
                    ),
                  ],
                ):SizedBox.shrink(),
                (ShowSingledesign || widget.qparams!['fromScreen'].toString() == "searchBarcode"?data[0]['type'] == "1" :data['type'] == "1")?Column(
                //  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ProductTextForm(
                            labelText: S.of(context).Increment, controller: SingleIncrement),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ProductTextForm(
                            labelText: S.of(context).mrp,
                            controller: SingleMRP),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ProductTextForm(
                            labelText: S.of(context).selling_price,
                            controller: SingleSellingPrice),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ProductTextForm(
                            labelText: S.of(context).membership_price,
                            controller: SingleMembership),
                      ),
                    ),
                  ],
                ):SizedBox.shrink(),
                (ShowSingledesign || widget.qparams!['fromScreen'].toString() == "searchBarcode"?data[0]['type'] == "1" :data['type'] == "1")?Column(
                 // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ProductTextForm(
                            labelText: S.of(context).HSN, controller: SingleHSN),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ProductTextForm(
                            labelText: S.of(context).Short_Note,
                            controller: SingleShortNote),
                      ),
                    ),

                  ],
                ):SizedBox.shrink(),
                (/*!ShowSingledesign ||*/ ((widget.qparams!['fromScreen'].toString() == "searchBarcode")?data[0]['type'] == "0":data['type'] == "0"))?Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    // color: Colors.green.shade50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).Item_Variation,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),),

                      ],
                    ),
                  ),
                ):SizedBox.shrink(),
                (/*!ShowSingledesign ||*/ ((widget.qparams!['fromScreen'].toString() == "searchBarcode")?data[0]['type'] == "0":data['type'] == "0"))?
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.,
                    children:  [
                      Expanded(
                          child: Text(
                            S.of(context).variation_name,
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          )),
                      Expanded(
                          child: Text(
                            S.of(context).mrp,
                            style: TextStyle(
                                color: Colors.black, fontSize: 18),
                          )),

                      Expanded(
                          child: Text(
                            "Price",
                            style: TextStyle(
                                color: Colors.black, fontSize: 18),
                          )),
                      // Expanded(child: Text("Variation Images",style: TextStyle(color: Colors.black,fontSize:18),)),
                      Expanded(
                          child: Text(
                            "Membership Price",
                            style: TextStyle(
                                color: Colors.black, fontSize: 18),
                          )),
                      // Expanded(
                      //     child: Text(
                      //       "",
                      //       style: TextStyle(
                      //           color: Colors.black, fontSize: 18),
                      //     )),
                    ],
                  ),
                ):SizedBox.shrink(),
                (/*!ShowSingledesign||*/ ((widget.qparams!['fromScreen'].toString() == "searchBarcode")?data[0]['type'] == "0":data['type'] == "0"))? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Divider(color: Colors.black12,thickness: 1,),
                ):SizedBox.shrink(),
                (/*!ShowSingledesign||*/ ((widget.qparams!['fromScreen'].toString() == "searchBarcode")?data[0]['type'] == "0":data['type'] == "0"))?
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.,
                    children:  [
                      Expanded(
                          child: Text(
                            (widget.qparams!['fromScreen'].toString() == "searchBarcode")?data[0]['price_variation'][0]['variation_name'].toString() :data['price_variation'][0]['variation_name'].toString(),
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          )),
                      Expanded(
                          child: Text(
                            (widget.qparams!['fromScreen'].toString() == "searchBarcode")?data[0]['price_variation'][0]['mrp'].toString() :data['price_variation'][0]['mrp'].toString(),
                            style: TextStyle(
                                color: Colors.black, fontSize: 18),
                          )),

                      Expanded(
                          child: Text(
                            (widget.qparams!['fromScreen'].toString() == "searchBarcode")?data[0]['price_variation'][0]['price'].toString() :data['price_variation'][0]['price'].toString(),
                            style: TextStyle(
                                color: Colors.black, fontSize: 18),
                          )),

                      Expanded(
                          child: Text(
                            (widget.qparams!['fromScreen'].toString() == "searchBarcode")?data[0]['price_variation'][0]['membership_price'].toString() :data['price_variation'][0]['membership_price'].toString(),
                            style: TextStyle(
                                color: Colors.black, fontSize: 18),
                          )),
                      // Expanded(child: Text("Variation Images",style: TextStyle(color: Colors.black,fontSize:18),)),
                      // Expanded(
                      //     child: Text(
                      //       S.of(context).edit,
                      //       style: TextStyle(
                      //           color: Colors.black, fontSize: 18),
                      //     )),
                      // Expanded(
                      //     child: Text(
                      //       "",
                      //       style: TextStyle(
                      //           color: Colors.black, fontSize: 18),
                      //     )),
                    ],
                  ),
                )
                // Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: BlocConsumer<VendorProductVariationBloc,
                //         VendorProductVariationState>(
                //         listener: (context, state) {
                //           if (state is VendorProductVariationStateSucsess) {}
                //         }, builder: (context, state) {
                //       if (state is VendorProductVariationStateInitial) {
                //         //return VariationList(variationsdata: variationsarray);
                //       }
                //       if (state is VendorProductVariationStateLoading) {}
                //       if (state is VendorProductVariationStateSucsess && (sl<SharedPreferences>().getString("load") =="1")) {
                //         print("variations loaded length before"+variationsarray.length.toString());
                //
                //         variationsarray.add(state.data);
                //
                //
                //         print("variations loaded length after"+variationsarray.length.toString());
                //
                //       }
                //       if (variationsarray.length == 0) {
                //         return Center(
                //           child: Text(S.of(context).no_variations),
                //         );
                //       } else {
                //         return VariationList(variationsdata: variationsarray);
                //       }
                //     }
                //
                //       // TODO: implement listener
                //
                //     ))
                    :SizedBox.shrink(),
                (/*!ShowSingledesign||*/ ((widget.qparams!['fromScreen'].toString() == "searchBarcode")?data[0]['type'] == "0":data['type'] == "0"))?  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Divider(color: Colors.black12,thickness: 1,),
                ):SizedBox.shrink(),




              ],
            ),
          ),
        ),
      )
      :SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Row(
                      children: [
                         Text(
                          S.of(context).Create_Item,
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        Transform.scale(
                          scale: 0.7,
                          child: CupertinoSwitch(
                            value: _itemactiveswitchValue,
                            onChanged: (bool value) {
                              setState(() {
                                _itemactiveswitchValue = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      flex: 1,
                      child: MaterialButton(
                        child: Text(
                          S.of(context).SAVE,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        onPressed: () {
                        //  debugPrint("Save tapped");
                          product_obj.isActive = _itemactiveswitchValue ? 1 : 0;
                          product_obj.itemName = ItemName.text;
                          // product_obj.item_name_hindi = ItemNameHindi.text;
                          product_obj.type =
                              int.parse((StockType == "Multi SKU") ? "0" : "1");
                          product_obj
                              .delivery = /*DeliveryDuration*/ "slot"; //currently hardcoding;
                          product_obj.productType = 1; //hardcoding
                          product_obj.vegType = (VegType == "Standard")
                              ? "none"
                              : (VegType == "Fish")
                              ? "fish"
                              : (VegType == "Meat")
                              ? "meat"
                              : (VegType == "Offer")
                              ? "offer"
                              : (VegType == "Liqour")
                              ? "liquour"
                              : "addon";
                          //product_obj.st = StockNotify.text;
                          product_obj.duration = (ReturnDuration == "3 Hours")
                              ? 3
                              : (ReturnDuration == "6 Hours")
                              ? 6
                              : (ReturnDuration == "12 Hours")
                              ? 12
                              : (ReturnDuration == "1 Day")
                              ? 24
                              : (ReturnDuration == "2 Day")
                              ? 48
                              : (ReturnDuration == "3 Day")
                              ? 144
                              : (ReturnDuration == "4 Day")
                              ? 192
                              : (ReturnDuration ==
                              "5 Day")
                              ? 240
                              : (ReturnDuration ==
                              "6 Day")
                              ? 288
                              : (ReturnDuration ==
                              "1 Week")
                              ? 336
                              : 0;
                          product_obj.salesTax = int.parse(Tax.text);
                          //product_obj.express_eligible =
                          (ExpressEligible == "Yes") ? "1" : "0";
                          product_obj.itemDescription = ItemDescription.text;
                          //product_obj.manufacturer_description =
                          ManufacturerDescription.text;
                          product_obj.itemPriority =
                              int.parse(ItemPriority.text);
                          product_obj.country = CountryOfOrigin.text;
                          product_obj.isSubscription =
                          (SubscriptionProduct == "Yes") ? 1 : 0;
                          product_obj.seller = 0 /*int.parse(Vendor)*/;
                          product_obj.brand = 235 /*int.parse(Brand)*/;
                          product_obj.variation = variationsarray;

                          debugPrint("product model:" +
                              product_obj.itemName.toString());
                          debugPrint("stocktype" + product_obj.type.toString());
                          debugPrint(
                              "del_dur" + product_obj.delivery.toString());
                          debugPrint(
                              "ptype" + product_obj.productType.toString());
                          // debugPrint("snotify" + product_obj.stock_notify.toString());
                          debugPrint(
                              "ret_dur" + product_obj.duration.toString());
                          debugPrint("tax" + product_obj.salesTax.toString());
                          //debugPrint("exp_del" + product_obj.express_eligible.toString());
                          debugPrint("i_desc" +
                              product_obj.itemDescription.toString());
                          //debugPrint("m_desc" + product_obj.manufacturer_description.toString());
                          debugPrint("i_priority" +
                              product_obj.itemPriority.toString());
                          debugPrint(
                              "country" + product_obj.country.toString());
                          debugPrint("s_product" +
                              product_obj.isSubscription.toString());
                          debugPrint("vendor" + product_obj.seller.toString());
                          debugPrint("brand" + product_obj.brand.toString());
                          product_obj.singleBarcode = (SingleBarcode.text != "") ? SingleBarcode.text:"0";
                          product_obj.singleHsn =(SingleHSN.text != "") ? SingleHSN.text:"0";
                          product_obj.singleIncrementVal = (SingleIncrement.text != "") ? SingleIncrement.text:"0";
                          product_obj.singleLoyalty = (SingleLoyalty.text != "") ? SingleLoyalty.text:"0";
                          product_obj.singleMaxItem = (SingleMax.text != "") ? SingleMax.text:"0";
                          product_obj.singleMinItem = (SingleMin.text != "") ? SingleMin.text:"0";
                          product_obj.singleMembershipPrice = (SingleMembership.text != "") ? SingleMembership.text:"0";
                          product_obj.singleMrp = (SingleMRP.text != "") ? SingleMRP.text:"0";
                          product_obj.singleNetweight = (SingleNetweight.text != "") ? SingleNetweight.text:"0";
                          product_obj.singleshortNote = (SingleShortNote.text != "") ? SingleShortNote.text:"0";
                          product_obj.singleSku = (SingleSKU.text != "")?SingleSKU.text:"0";
                          product_obj.singleSellingPrice = (SingleSellingPrice.text != "")?SingleSellingPrice.text:"0";
                          product_obj.singleUnit = (SingleUnit.text != "")?SingleUnit.text:"0";

                          product_obj.fishprice = "0";
                          product_obj.topping = "0";

                          BlocProvider.of<VendorProductBloc>(context)
                              .add(OnProductAdd(product_obj));
                        },
                        color: Colors.green,
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductTextForm(
                          labelText: S.of(context).item_name, controller: ItemName),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductTextForm(
                          labelText: S.of(context).item_name_in_hindi,
                          controller: ItemNameHindi),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropDownformfield(
                          labelText: S.of(context).stock_type,
                          DropdownItems: stock_types,
                          controller: StockType,parentfunction: setdropdownValue,),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropDownformfield(
                          labelText: S.of(context).delivery_duration,
                          DropdownItems: delivery_duration,
                          controller: DeliveryDuration,parentfunction: setdropdownValue),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropDownformfield(
                          labelText: S.of(context).product_type,
                          DropdownItems: veg_type,
                          controller: VegType,parentfunction: setdropdownValue),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductTextForm(
                          labelText: S.of(context).stock_notify, controller: StockNotify),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropDownformfield(
                          labelText: S.of(context).return_duration,
                          DropdownItems: return_duration,
                          controller: ReturnDuration,parentfunction: setdropdownValue),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductTextForm(labelText: S.of(context).Tax, controller: Tax),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropDownformfield(
                          labelText: S.of(context).express_delivery_eligible,
                          DropdownItems: express_delivery_eligible,
                          controller: ExpressEligible,parentfunction: setdropdownValue),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductTextField(
                          labelText: S.of(context).item_description,
                          controller: ItemDescription),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductTextField(
                          labelText: S.of(context).manufacturer_description,
                          controller: ManufacturerDescription),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductTextForm(
                          labelText: S.of(context).item_priority, controller: ItemPriority),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductTextForm(
                          labelText: S.of(context).country_of_origin,
                          controller: CountryOfOrigin),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropDownformfield(
                          labelText: S.of(context).subscription_product,
                          DropdownItems: subscription_product,
                          controller: SubscriptionProduct,parentfunction: setdropdownValue),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropDownformfield(
                          labelText: S.of(context).select_vendor,
                          DropdownItems: vendor_list,
                          controller: Vendor,parentfunction: setdropdownValue),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ProductImagePicker(),
                      ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Expanded(
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: DropDownformfield(labelText: 'Category',DropdownItems: category_list,),
                  //   ),
                  // ),
                  // Expanded(
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: DropDownformfield(labelText: 'Search Tags',),
                  //   ),
                  // ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropDownformfield(
                          labelText: S.of(context).Brand,
                          DropdownItems: brand_list,
                          controller: Brand,parentfunction: setdropdownValue),
                    ),
                  ),
                ],
              ),


              ///Single SKU Design changes

              (ShowSingledesign|| widget.qparams!['fromScreen'].toString() == "searchBarcode"?data[0]['type'] == "1" :data['type'] == "1")?Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductTextForm(
                          labelText: S.of(context).Stock, controller: SingleStock),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductTextForm(
                          labelText: S.of(context).SKU,
                          controller: SingleSKU),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductTextForm(
                          labelText: S.of(context).net_weight,
                          controller: SingleNetweight),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductTextForm(
                          labelText: S.of(context).Barcode,
                          controller: SingleBarcode),
                    ),
                  ),
                ],
              ):SizedBox.shrink(),
              (ShowSingledesign || widget.qparams!['fromScreen'].toString() == "searchBarcode"?data[0]['type'] == "1" :data['type'] == "1")?Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductTextForm(
                          labelText: S.of(context).Loyalty, controller: SingleLoyalty),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductTextForm(
                          labelText: S.of(context).Min,
                          controller: SingleMin),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductTextForm(
                          labelText: S.of(context).Max,
                          controller: SingleMax),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductTextForm(
                          labelText: S.of(context).Unit,
                          controller: SingleUnit),
                    ),
                  ),
                ],
              ):SizedBox.shrink(),
              (ShowSingledesign || widget.qparams!['fromScreen'].toString() == "searchBarcode"?data[0]['type'] == "1" :data['type'] == "1")?Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductTextForm(
                          labelText: S.of(context).Increment, controller: SingleIncrement),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductTextForm(
                          labelText: S.of(context).mrp,
                          controller: SingleMRP),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductTextForm(
                          labelText: S.of(context).selling_price,
                          controller: SingleSellingPrice),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductTextForm(
                          labelText: S.of(context).membership_price,
                          controller: SingleMembership),
                    ),
                  ),
                ],
              ):SizedBox.shrink(),
              (ShowSingledesign || widget.qparams!['fromScreen'].toString() == "searchBarcode"?data[0]['type'] == "1" :data['type'] == "1")?Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductTextForm(
                          labelText: S.of(context).HSN, controller: SingleHSN),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductTextForm(
                          labelText: S.of(context).Short_Note,
                          controller: SingleShortNote),
                    ),
                  ),

                ],
              ):SizedBox.shrink(),

              (!ShowSingledesign || data['type'] == "1")?Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.green.shade50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          S.of(context).Item_Variation,
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.green)),
                          child: MaterialButton(
                            onPressed: () {
                              sl<SharedPreferences>().setString("load", "0");
                              Navigation(context,
                                  navigatore: NavigatoreTyp.push,
                                  name: Routename.VendorProductVariation);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  S.of(context).add_vartiant,
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ):SizedBox.shrink(),
              (!ShowSingledesign || data['type'] == "1")?Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                          child: Text(
                            S.of(context).variation_name,
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          )),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: Text(
                                      S.of(context).mrp,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                    )),
                                Expanded(
                                    child: Text(
                                      S.of(context).discounted_price,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: Text(
                                      S.of(context).membership_price,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                    )),
                                Expanded(
                                    child: Text(
                                      S.of(context).priority,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: Text(
                                     S.of(context).Status,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                    )),
                                // Expanded(child: Text("Variation Images",style: TextStyle(color: Colors.black,fontSize:18),)),
                                Expanded(
                                    child: Text(
                                     S.of(context).edit,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ):SizedBox.shrink(),
              (!ShowSingledesign)?Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BlocConsumer<VendorProductVariationBloc,
                      VendorProductVariationState>(
                      listener: (context, state) {
                        if (state is VendorProductVariationStateSucsess) {}
                      }, builder: (context, state) {
                    if (state is VendorProductVariationStateInitial) {
                      //return VariationList(variationsdata: variationsarray);
                    }
                    if (state is VendorProductVariationStateLoading) {}
                    if (state is VendorProductVariationStateSucsess && (sl<SharedPreferences>().getString("load") =="1")) {
                      print("variations loaded length before"+variationsarray.length.toString());

                      variationsarray.add(state.data);


                      print("variations loaded length after"+variationsarray.length.toString());

                    }
                    if (variationsarray.length == 0) {
                      return  Center(
                        child: Text(S.of(context).no_variations),
                      );
                    } else {
                      return VariationList(variationsdata: variationsarray);
                    }
                  }

                    // TODO: implement listener

                  )):SizedBox.shrink(),



            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: !LayoutView(context).isMobile || (widget.qparams!['fromScreen'].toString() == "editProduct") || (widget.qparams!['fromScreen'].toString() == "searchBarcode")?SizedBox.shrink():   GestureDetector(
        onTap: (){
          debugPrint("Save tapped");

          product_obj.isActive = _itemactiveswitchValue ? 1 : 0;
          product_obj.itemName = ItemName.text;
          // product_obj.item_name_hindi = ItemNameHindi.text;
          product_obj.type =
              int.parse((StockType == "Multi SKU") ? "0" : "1");
          product_obj
              .delivery = /*DeliveryDuration*/ "slot"; //currently hardcoding;
          product_obj.productType = 1; //hardcoding
          product_obj.vegType = (VegType == "Standard")
              ? "none"
              : (VegType == "Fish")
              ? "fish"
              : (VegType == "Meat")
              ? "meat"
              : (VegType == "Offer")
              ? "offer"
              : (VegType == "Liqour")
              ? "liquour"
              : "addon";
          //product_obj.st = StockNotify.text;
          product_obj.duration = (ReturnDuration == "3 Hours")
              ? 3
              : (ReturnDuration == "6 Hours")
              ? 6
              : (ReturnDuration == "12 Hours")
              ? 12
              : (ReturnDuration == "1 Day")
              ? 24
              : (ReturnDuration == "2 Day")
              ? 48
              : (ReturnDuration == "3 Day")
              ? 144
              : (ReturnDuration == "4 Day")
              ? 192
              : (ReturnDuration ==
              "5 Day")
              ? 240
              : (ReturnDuration ==
              "6 Day")
              ? 288
              : (ReturnDuration ==
              "1 Week")
              ? 336
              : 0;
          product_obj.salesTax = int.parse(Tax.text);
          //product_obj.express_eligible =
          (ExpressEligible == "Yes") ? "1" : "0";
          product_obj.itemDescription = ItemDescription.text;
          //product_obj.manufacturer_description =
          ManufacturerDescription.text;
          product_obj.itemPriority =
              int.parse(ItemPriority.text);
          product_obj.country = CountryOfOrigin.text;
          product_obj.isSubscription =
          (SubscriptionProduct == "Yes") ? 1 : 0;
          product_obj.seller = 0 /*int.parse(Vendor)*/;
          product_obj.brand = 235 /*int.parse(Brand)*/;
          product_obj.variation = variationsarray;

          debugPrint("product model:" +
              product_obj.itemName.toString());
          debugPrint("stocktype" + product_obj.type.toString());
          debugPrint(
              "del_dur" + product_obj.delivery.toString());
          debugPrint(
              "ptype" + product_obj.productType.toString());
          // debugPrint("snotify" + product_obj.stock_notify.toString());
          debugPrint(
              "ret_dur" + product_obj.duration.toString());
          debugPrint("tax" + product_obj.salesTax.toString());
          //debugPrint("exp_del" + product_obj.express_eligible.toString());
          debugPrint("i_desc" +
              product_obj.itemDescription.toString());
          //debugPrint("m_desc" + product_obj.manufacturer_description.toString());
          debugPrint("i_priority" +
              product_obj.itemPriority.toString());
          debugPrint(
              "country" + product_obj.country.toString());
          debugPrint("s_product" +
              product_obj.isSubscription.toString());
          debugPrint("vendor" + product_obj.seller.toString());
          debugPrint("brand" + product_obj.brand.toString());
          product_obj.singleBarcode = (SingleBarcode.text != "") ? SingleBarcode.text:"0";
          product_obj.singleHsn =(SingleHSN.text != "") ? SingleHSN.text:"0";
          product_obj.singleIncrementVal = (SingleIncrement.text != "") ? SingleIncrement.text:"0";
          product_obj.singleLoyalty = (SingleLoyalty.text != "") ? SingleLoyalty.text:"0";
          product_obj.singleMaxItem = (SingleMax.text != "") ? SingleMax.text:"0";
          product_obj.singleMinItem = (SingleMin.text != "") ? SingleMin.text:"0";
          product_obj.singleMembershipPrice = (SingleMembership.text != "") ? SingleMembership.text:"0";
          product_obj.singleMrp = (SingleMRP.text != "") ? SingleMRP.text:"0";
          product_obj.singleNetweight = (SingleNetweight.text != "") ? SingleNetweight.text:"0";
          product_obj.singleshortNote = (SingleShortNote.text != "") ? SingleShortNote.text:"0";
          product_obj.singleSku = (SingleSKU.text != "")?SingleSKU.text:"0";
          product_obj.singleSellingPrice = (SingleSellingPrice.text != "")?SingleSellingPrice.text:"0";
          product_obj.singleUnit = (SingleUnit.text != "")?SingleUnit.text:"0";

          product_obj.fishprice = "0";
          product_obj.topping = "0";
          dialogForCircularprogress();
          BlocProvider.of<VendorProductBloc>(context)
              .add(OnProductAdd(product_obj));
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(10.0),
          height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              color: Theme.of(context).primaryColor,
            ),
          // color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          child:
          BlocListener<VendorProductBloc,VendorProductState>(
              listener: (context, state1) {

                if(state1 is VendorProductSucsess){
                  print("moved inside....."+state1.toString());
                  ItemName.text = "";
                  ItemNameHindi.text = "";
                  StockNotify.text = "";
                  Tax.text = "";
                  ItemDescription.text = "";
                  ManufacturerDescription.text = "";
                  ItemPriority.text = "";
                  CountryOfOrigin.text = "";

                  Navigator.pop(context);
                }
              },
              child: Center(
                child: Text(
                  S.of(context).SAVE,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),

              ),

          )
        ),
      ),
    );
  }

  dialogForCircularprogress() {
    return showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AbsorbPointer(
              child: Container(
                color: Colors.transparent,
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              ),
            );
          });
        });
  }
}
