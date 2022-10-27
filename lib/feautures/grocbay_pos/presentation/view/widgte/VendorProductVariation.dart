import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocbay_pos/core/util/presentation/controller/product_add_controller.dart';
import 'package:grocbay_pos/feautures/grocbay_pos/domain/usecases/VendorProduct_usecase.dart';
import 'package:grocbay_pos/feautures/grocbay_pos/presentation/bloc/VendorProductVariation/VendorProductVariation.dart';
import 'package:grocbay_pos/feautures/grocbay_pos/presentation/rought_genrator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/util/presentation/styles/screen_size_rario.dart';
import '../../../../../injection_container.dart';
import 'ProductDropdownTextform.dart';
import 'ProductTextForm.dart';

class VendorProductVariation extends StatefulWidget {
  VendorProductVariation({
    Key? key,
  }) : super(key: key);

  @override
  _VendorProductVariationState createState() => _VendorProductVariationState();
}

class _VendorProductVariationState extends State<VendorProductVariation>
    with Navigations {
  bool _wholesaleswitchValue = false;
  List<Variation> variationsarray = [];
  AddProductController obj = AddProductController();
  Variation variationdata = Variation();
  var VariationName = TextEditingController();
  var Unit = TextEditingController();
  var Priority = TextEditingController();
  var SKU = TextEditingController();
  var HSN = TextEditingController();
  var Barcode = TextEditingController();
  var LoyaltyPoints = TextEditingController();
  var GWeight = TextEditingController();
  var MinOrderQty = TextEditingController();
  var MaxOrderQty = TextEditingController();
  var MinMaxExpiry = '';
  var PricePerUnit = TextEditingController();
  var ActualPrice = TextEditingController();
  var DiscountPrice = TextEditingController();
  var MembershipPrice = TextEditingController();
  var Stock = TextEditingController();




  List<String> min_max_expiry = [];

  @override
  void initState() {
     variationdata = Variation();
    min_max_expiry = ["3 Hours", "6 Hours", "12 Hours", "24 Hours"];
    //MinMaxExpiry = min_max_expiry[0];
    // TODO: implement initState
    super.initState();
  }

  setdropdownValue(){
    setState(() {
debugPrint("setstate called");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:(LayoutView(context).isMobile)? AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Theme.of(context).primaryColor),
            onPressed: () {
              Navigator.of(context).pop();

            }),
        titleSpacing: 0,
        title: Row(
          children: [
            Text(
              "Variations",
              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 24),
            ),
          ],
        ),
      ):null,
      body: (LayoutView(context).isMobile)?
      SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: const Text(
                          'Add New Variation',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      // Column(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     const Text(
                      //       'Wholesale',
                      //       style: TextStyle(
                      //         color: Colors.green,
                      //         fontSize: 20,
                      //       ),
                      //     ),
                      //     Transform.scale(
                      //       scale: 0.7,
                      //       child: CupertinoSwitch(
                      //         value: _wholesaleswitchValue,
                      //         onChanged: (bool value) {
                      //           setState(() {
                      //             _wholesaleswitchValue = value;
                      //           });
                      //         },
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                  Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ProductTextForm(
                              labelText: 'Variation Name',
                              controller: VariationName),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                          ProductTextForm(labelText: 'Unit', controller: Unit),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ProductTextForm(
                              labelText: 'Priority', controller: Priority),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ProductTextForm(labelText: 'SKU', controller: SKU),
                        ),
                      ),
                    ],
                  ),
                  Column(
                  //  mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ProductTextForm(labelText: 'HSN', controller: HSN),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ProductTextForm(
                              labelText: 'Barcode', controller: Barcode),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ProductTextForm(
                              labelText: 'Loyalty Points',
                              controller: LoyaltyPoints),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ProductTextForm(
                              labelText: 'Gross Weight(in kg)',
                              controller: GWeight),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ProductTextForm(
                              labelText: 'Minimum Order Qty',
                              controller: MinOrderQty),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ProductTextForm(
                              labelText: 'Maximum Order Qty*',
                              controller: MaxOrderQty),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropDownformfield(
                              labelText: 'Min-Max Expiry(Hours)',
                              DropdownItems: min_max_expiry,
                              controller: MinMaxExpiry,parentfunction: setdropdownValue),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ProductTextForm(
                              labelText: 'Price Per Unit',
                              controller: PricePerUnit),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      // Expanded(
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(8.0),
                      //     child: DropDownformfield(labelText: 'Select Customizables',),
                      //   ),
                      // ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ProductTextForm(
                              labelText: 'Actual Price*', controller: ActualPrice),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ProductTextForm(
                              labelText: 'Discounted Price*',
                              controller: DiscountPrice),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ProductTextForm(
                              labelText: 'Membership Price*',
                              controller: MembershipPrice),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ProductTextForm(
                              labelText: 'Stock*', controller: Stock),
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: 60,)
                ],
              )),
        ),
      )
      : SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'ADD NEW VARIATION',
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'Wholesale',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 20,
                        ),
                      ),
                      Transform.scale(
                        scale: 0.7,
                        child: CupertinoSwitch(
                          value: _wholesaleswitchValue,
                          onChanged: (bool value) {
                            setState(() {
                              _wholesaleswitchValue = value;
                            });
                          },
                        ),
                      ),
                    ],
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
                          labelText: 'Variation Name',
                          controller: VariationName),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                      ProductTextForm(labelText: 'Unit', controller: Unit),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductTextForm(
                          labelText: 'Priority', controller: Priority),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductTextForm(labelText: 'SKU', controller: SKU),
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
                      child: ProductTextForm(labelText: 'HSN', controller: HSN),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductTextForm(
                          labelText: 'Barcode', controller: Barcode),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductTextForm(
                          labelText: 'Loyalty Points',
                          controller: LoyaltyPoints),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductTextForm(
                          labelText: 'Gross Weight(in kg)',
                          controller: GWeight),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductTextForm(
                          labelText: 'Minimum Order Qty',
                          controller: MinOrderQty),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductTextForm(
                          labelText: 'Maximum Order Qty*',
                          controller: MaxOrderQty),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropDownformfield(
                          labelText: 'Min-Max Expiry(Hours)',
                          DropdownItems: min_max_expiry,
                          controller: MinMaxExpiry,parentfunction: setdropdownValue),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductTextForm(
                          labelText: 'Price Per Unit',
                          controller: PricePerUnit),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  // Expanded(
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: DropDownformfield(labelText: 'Select Customizables',),
                  //   ),
                  // ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductTextForm(
                          labelText: 'Actual Price*', controller: ActualPrice),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductTextForm(
                          labelText: 'Discounted Price*',
                          controller: DiscountPrice),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductTextForm(
                          labelText: 'Membership Price*',
                          controller: MembershipPrice),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductTextForm(
                          labelText: 'Stock*', controller: Stock),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: MaterialButton(
                      child: Text(
                        'SAVE',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      onPressed: () {
                        debugPrint("Save tapped");

                        //  debugPrint("variation name while saving"+VariationsList.variationname.toString());

                        List<Variation> list = [];
                        variationdata.variationName = VariationName.text;
                        variationdata.unit = Unit.text;
                        variationdata.priority = int.parse(Priority.text);
                        variationdata.sku = 0; //hardcoding for now
                        variationdata.hsn = int.parse(HSN.text);
                        variationdata.barcode = int.parse(Barcode.text);
                        variationdata.loyalty = int.parse(LoyaltyPoints.text);
                        variationdata.weight = int.parse(GWeight.text);
                        variationdata.min = int.parse(MinOrderQty.text);
                        variationdata.max = int.parse(MaxOrderQty.text);
                        variationdata.cartexpiry =
                            int.parse((MinMaxExpiry == "3 Hours")
                                ? "3"
                                : (MinMaxExpiry == "6 Hours")
                                ? "6"
                                : (MinMaxExpiry == "12 Hours")
                                ? "12"
                                : "24");
                        variationdata.priceperunit =
                            int.parse(PricePerUnit.text);
                        variationdata.mrp = int.parse(ActualPrice.text);
                        variationdata.price = int.parse(DiscountPrice.text);
                        variationdata.membership =
                            int.parse(MembershipPrice.text);
                        variationdata.quantity = int.parse(Stock.text);
                        variationdata.brand = 920;
                        variationdata.category = "1398,22";
                        variationdata.wholesale = _wholesaleswitchValue? 1:0;
                        //need to check
                        //list.add(variationdata);
                        Navigation(
                          context,
                          navigatore: NavigatoreTyp.pop,
                          name: Routename.EditVendorProduct,
                        );
                        BlocProvider.of<VendorProductVariationBloc>(context)
                            .add(VariationEventInitial(variationdata));
                       variationdata = Variation();
                        sl<SharedPreferences>().setString("load", "1");
                        //debugPrint("variationslist" + list.toString());
                        debugPrint("List Length" + list.length.toString());
                      },
                      color: Colors.green,
                    ),
                  )
                ],
              )
            ],
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: !LayoutView(context).isMobile?SizedBox.shrink():   Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(10.0),
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            color: Theme.of(context).primaryColor,
          ),
          // color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          child:
          GestureDetector(
            onTap: () {
              debugPrint("Save tapped");

              //  debugPrint("variation name while saving"+VariationsList.variationname.toString());

              List<Variation> list = [];
              variationdata.variationName = VariationName.text;
              variationdata.unit = Unit.text;
              variationdata.priority = int.parse(Priority.text);
              variationdata.sku = 0; //hardcoding for now
              variationdata.hsn = int.parse(HSN.text);
              variationdata.barcode = int.parse(Barcode.text);
              variationdata.loyalty = int.parse(LoyaltyPoints.text);
              variationdata.weight = int.parse(GWeight.text);
              variationdata.min = int.parse(MinOrderQty.text);
              variationdata.max = int.parse(MaxOrderQty.text);
              variationdata.cartexpiry =
                  int.parse((MinMaxExpiry == "3 Hours")
                      ? "3"
                      : (MinMaxExpiry == "6 Hours")
                      ? "6"
                      : (MinMaxExpiry == "12 Hours")
                      ? "12"
                      : "24");
              variationdata.priceperunit =
                  int.parse(PricePerUnit.text);
              variationdata.mrp = int.parse(ActualPrice.text);
              variationdata.price = int.parse(DiscountPrice.text);
              variationdata.membership =
                  int.parse(MembershipPrice.text);
              variationdata.quantity = int.parse(Stock.text);
              variationdata.brand = 920;
              variationdata.category = "1398,22";
              variationdata.wholesale = _wholesaleswitchValue? 1:0;
              //need to check
              //list.add(variationdata);
              Navigation(
                context,
                navigatore: NavigatoreTyp.pop,
                name: Routename.EditVendorProduct,
              );
              BlocProvider.of<VendorProductVariationBloc>(context)
                  .add(VariationEventInitial(variationdata));
              variationdata = Variation();
              sl<SharedPreferences>().setString("load", "1");
              //debugPrint("variationslist" + list.toString());
              debugPrint("List Length" + list.length.toString());
            },
            child: Center(
              child: Text(
                'ADD',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          )
      ),
    );
  }
}
