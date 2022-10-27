import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocbay_pos/core/util/presentation/styles/screen_size_rario.dart';
import 'package:grocbay_pos/feautures/grocbay_pos/presentation/bloc/getAllCount/get_All_Count_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../core/util/presentation/constants/ic_constants.dart';
import '../../../../../../injection_container.dart';
import '../../../../domain/entities/getAllCountModel.dart';
import '../../../../domain/entities/pos_ordersearch_model.dart';
import '../../../bloc/order/order_managment_bloc.dart';
import '../../widgte/sales_data.dart';

class OrderAnalitics extends StatefulWidget {
  const OrderAnalitics({
    Key? key,
  }) : super(key: key);

  @override
  State<OrderAnalitics> createState() => _OrderAnaliticsState();
}

class _OrderAnaliticsState extends State<OrderAnalitics> {
  int completedcount = 0;
  int activecount = 0;
  int returncount = 0;
  int outfordelcount = 0;
  int pendingcount = 0;
 List count = [];
  @override
  void initState() {
    // TODO: implement initState
   // BlocProvider.of<OrderManagmentBloc>(context).add(const FetchOrder(query: '',start: 0));
    BlocProvider.of<GetAllCountBloc>(context).add(OnGetAllCountEvent(sl<SharedPreferences>().getString(Prefrence.BRANCH)??''));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {


    return BlocBuilder<GetAllCountBloc, GetAllCountState>(
      builder: (context, state) {
      //  print("order data home");
        if(state is GetAllCountLoading){
          return Center(child: CircularProgressIndicator());
        }
        if(state is GetAllCountSucsess<List<PosGetAllCount>>) {
          return Wrap(
            direction: Axis.horizontal,
            children: [

              SalesData(ic_color: Color(0xff39827E),leading_box_enable: true,text:(LayoutView(context).isWeb || LayoutView(context).isTab)?"Active Order":"Active\nOrders",count:state.data.first.activeorderscount),
              SalesData(ic_color: Color(0xff26384B),leading_box_enable: true,text:(LayoutView(context).isWeb || LayoutView(context).isTab)?"Ticket Waiting":"Ticket\nWaiting",count:0),
              //   SalesData(ic_color: Colors.brown,leading_box_enable: true,text:"Stock Low",count:activecount),
              SalesData(ic_color: Color(0xff006395),leading_box_enable: true,text:(LayoutView(context).isWeb || LayoutView(context).isTab)?"Return Ready":"Return\nReady",count:state.data.first.returnorderscount),
              SalesData(ic_color: Color(0xff32BDB9),leading_box_enable: true,text:(LayoutView(context).isWeb || LayoutView(context).isTab)?"Out For Delivery":"Out For\nDelivery",count:state.data.first.dispatchedorderscount),
              SalesData(ic_color: Color(0xffEC965D),leading_box_enable: true,text:(LayoutView(context).isWeb || LayoutView(context).isTab)?"Stock Low":"Stock\nLow",count:0),
              SalesData(ic_color: Color(0xff039746),leading_box_enable: true,text:(LayoutView(context).isWeb || LayoutView(context).isTab)?"Completed Order":"Completed\nOrder",count:state.data.first.deliveredorderscount),
           //   SalesData(ic_color: Colors.black,leading_box_enable: true,text:"Ticket Waiting",count:state.data.where((element) => element.oStatus == "ready").length),

            ],
          );
        }

        else{
          return SizedBox.shrink();
        }
      },
    );




  }
}