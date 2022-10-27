// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `clicked`
  String get clicked {
    return Intl.message(
      'clicked',
      name: 'clicked',
      desc: '',
      args: [],
    );
  }

  /// `Search For Products`
  String get search_for_prod {
    return Intl.message(
      'Search For Products',
      name: 'search_for_prod',
      desc: '',
      args: [],
    );
  }

  /// `Multi SKU`
  String get multi_sku {
    return Intl.message(
      'Multi SKU',
      name: 'multi_sku',
      desc: '',
      args: [],
    );
  }

  /// `Single SKU`
  String get single_sku {
    return Intl.message(
      'Single SKU',
      name: 'single_sku',
      desc: '',
      args: [],
    );
  }

  /// `Slot Based Delivery`
  String get slot_based_deli {
    return Intl.message(
      'Slot Based Delivery',
      name: 'slot_based_deli',
      desc: '',
      args: [],
    );
  }

  /// `Standard`
  String get standard {
    return Intl.message(
      'Standard',
      name: 'standard',
      desc: '',
      args: [],
    );
  }

  /// `No Return`
  String get no_return {
    return Intl.message(
      'No Return',
      name: 'no_return',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `No Vendor`
  String get no_vendor {
    return Intl.message(
      'No Vendor',
      name: 'no_vendor',
      desc: '',
      args: [],
    );
  }

  /// `PREPARING`
  String get preparing {
    return Intl.message(
      'PREPARING',
      name: 'preparing',
      desc: '',
      args: [],
    );
  }

  /// `Originally Ordered Qty`
  String get original_ord_qty {
    return Intl.message(
      'Originally Ordered Qty',
      name: 'original_ord_qty',
      desc: '',
      args: [],
    );
  }

  /// `Updated Item Qty`
  String get updated_item_qty {
    return Intl.message(
      'Updated Item Qty',
      name: 'updated_item_qty',
      desc: '',
      args: [],
    );
  }

  /// `Edit weight`
  String get edit_weight {
    return Intl.message(
      'Edit weight',
      name: 'edit_weight',
      desc: '',
      args: [],
    );
  }

  /// `Reason for editing`
  String get reason_for_editing {
    return Intl.message(
      'Reason for editing',
      name: 'reason_for_editing',
      desc: '',
      args: [],
    );
  }

  /// `Wrong item price`
  String get wrong_item_price {
    return Intl.message(
      'Wrong item price',
      name: 'wrong_item_price',
      desc: '',
      args: [],
    );
  }

  /// `Their is some difference in current price`
  String get some_difference_in_current_price {
    return Intl.message(
      'Their is some difference in current price',
      name: 'some_difference_in_current_price',
      desc: '',
      args: [],
    );
  }

  /// `Out of Stock`
  String get out_of_stock {
    return Intl.message(
      'Out of Stock',
      name: 'out_of_stock',
      desc: '',
      args: [],
    );
  }

  /// `Item is not on the shelf`
  String get item_is_not_on_the_shelf {
    return Intl.message(
      'Item is not on the shelf',
      name: 'item_is_not_on_the_shelf',
      desc: '',
      args: [],
    );
  }

  /// `Poor Quality`
  String get poor_quality {
    return Intl.message(
      'Poor Quality',
      name: 'poor_quality',
      desc: '',
      args: [],
    );
  }

  /// `Item is in a bad condition`
  String get item_is_in_a_bad_condition {
    return Intl.message(
      'Item is in a bad condition',
      name: 'item_is_in_a_bad_condition',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Issue`
  String get please_enter_issue {
    return Intl.message(
      'Please Enter Issue',
      name: 'please_enter_issue',
      desc: '',
      args: [],
    );
  }

  /// `UPDATE`
  String get update {
    return Intl.message(
      'UPDATE',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `DELIVERY TYPE`
  String get delivery_type {
    return Intl.message(
      'DELIVERY TYPE',
      name: 'delivery_type',
      desc: '',
      args: [],
    );
  }

  /// `DELIVERY`
  String get delivery {
    return Intl.message(
      'DELIVERY',
      name: 'delivery',
      desc: '',
      args: [],
    );
  }

  /// `GRAND TOTAL`
  String get grand_total {
    return Intl.message(
      'GRAND TOTAL',
      name: 'grand_total',
      desc: '',
      args: [],
    );
  }

  /// `Assign to Delivery Partner`
  String get assign_to_delivery_partner {
    return Intl.message(
      'Assign to Delivery Partner',
      name: 'assign_to_delivery_partner',
      desc: '',
      args: [],
    );
  }

  /// `Order updated successfully`
  String get order_updated_successfully {
    return Intl.message(
      'Order updated successfully',
      name: 'order_updated_successfully',
      desc: '',
      args: [],
    );
  }

  /// `ORDER READY`
  String get order_ready {
    return Intl.message(
      'ORDER READY',
      name: 'order_ready',
      desc: '',
      args: [],
    );
  }

  /// `Order`
  String get order {
    return Intl.message(
      'Order',
      name: 'order',
      desc: '',
      args: [],
    );
  }

  /// `Items`
  String get items {
    return Intl.message(
      'Items',
      name: 'items',
      desc: '',
      args: [],
    );
  }

  /// `Assign to picker`
  String get assign_to_picker {
    return Intl.message(
      'Assign to picker',
      name: 'assign_to_picker',
      desc: '',
      args: [],
    );
  }

  /// `Are you Sure you want to assign order to`
  String get are_you_sure {
    return Intl.message(
      'Are you Sure you want to assign order to',
      name: 'are_you_sure',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Prepared`
  String get prepared {
    return Intl.message(
      'Prepared',
      name: 'prepared',
      desc: '',
      args: [],
    );
  }

  /// `Find customer by Name, Phone`
  String get find_customer {
    return Intl.message(
      'Find customer by Name, Phone',
      name: 'find_customer',
      desc: '',
      args: [],
    );
  }

  /// `Add Customer`
  String get add_customer {
    return Intl.message(
      'Add Customer',
      name: 'add_customer',
      desc: '',
      args: [],
    );
  }

  /// `Please Select User`
  String get please_select_user {
    return Intl.message(
      'Please Select User',
      name: 'please_select_user',
      desc: '',
      args: [],
    );
  }

  /// `PROCEED`
  String get proceed {
    return Intl.message(
      'PROCEED',
      name: 'proceed',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Vendor`
  String get vendor {
    return Intl.message(
      'Vendor',
      name: 'vendor',
      desc: '',
      args: [],
    );
  }

  /// `Yesterday`
  String get yesterday {
    return Intl.message(
      'Yesterday',
      name: 'yesterday',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get today {
    return Intl.message(
      'Today',
      name: 'today',
      desc: '',
      args: [],
    );
  }

  /// `Week`
  String get week {
    return Intl.message(
      'Week',
      name: 'week',
      desc: '',
      args: [],
    );
  }

  /// `Month`
  String get month {
    return Intl.message(
      'Month',
      name: 'month',
      desc: '',
      args: [],
    );
  }

  /// `Year`
  String get year {
    return Intl.message(
      'Year',
      name: 'year',
      desc: '',
      args: [],
    );
  }

  /// `Failed`
  String get failed {
    return Intl.message(
      'Failed',
      name: 'failed',
      desc: '',
      args: [],
    );
  }

  /// `Delivered`
  String get delivered {
    return Intl.message(
      'Delivered',
      name: 'delivered',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back!`
  String get welcome {
    return Intl.message(
      'Welcome Back!',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Please sign in to continue`
  String get please_sign {
    return Intl.message(
      'Please sign in to continue',
      name: 'please_sign',
      desc: '',
      args: [],
    );
  }

  /// `Email*`
  String get email {
    return Intl.message(
      'Email*',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `mai@website.com`
  String get mai {
    return Intl.message(
      'mai@website.com',
      name: 'mai',
      desc: '',
      args: [],
    );
  }

  /// `Password*`
  String get password {
    return Intl.message(
      'Password*',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Enter Password`
  String get enter {
    return Intl.message(
      'Enter Password',
      name: 'enter',
      desc: '',
      args: [],
    );
  }

  /// `ALL`
  String get ALL {
    return Intl.message(
      'ALL',
      name: 'ALL',
      desc: '',
      args: [],
    );
  }

  /// `Received`
  String get Received {
    return Intl.message(
      'Received',
      name: 'Received',
      desc: '',
      args: [],
    );
  }

  /// `Preparing`
  String get Preparing {
    return Intl.message(
      'Preparing',
      name: 'Preparing',
      desc: '',
      args: [],
    );
  }

  /// `Ready`
  String get Ready {
    return Intl.message(
      'Ready',
      name: 'Ready',
      desc: '',
      args: [],
    );
  }

  /// `Delivering`
  String get Delivering {
    return Intl.message(
      'Delivering',
      name: 'Delivering',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get Completed {
    return Intl.message(
      'Completed',
      name: 'Completed',
      desc: '',
      args: [],
    );
  }

  /// `Cancelled`
  String get Canceled {
    return Intl.message(
      'Cancelled',
      name: 'Canceled',
      desc: '',
      args: [],
    );
  }

  /// `avg`
  String get avg {
    return Intl.message(
      'avg',
      name: 'avg',
      desc: '',
      args: [],
    );
  }

  /// `Create Order`
  String get create_order {
    return Intl.message(
      'Create Order',
      name: 'create_order',
      desc: '',
      args: [],
    );
  }

  /// `Category Product Loading...`
  String get category_product {
    return Intl.message(
      'Category Product Loading...',
      name: 'category_product',
      desc: '',
      args: [],
    );
  }

  /// `No Product`
  String get no_product {
    return Intl.message(
      'No Product',
      name: 'no_product',
      desc: '',
      args: [],
    );
  }

  /// `Item`
  String get Item {
    return Intl.message(
      'Item',
      name: 'Item',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get Amount {
    return Intl.message(
      'Amount',
      name: 'Amount',
      desc: '',
      args: [],
    );
  }

  /// `Item Available`
  String get item_available {
    return Intl.message(
      'Item Available',
      name: 'item_available',
      desc: '',
      args: [],
    );
  }

  /// `Categories Loading...`
  String get categories_loading {
    return Intl.message(
      'Categories Loading...',
      name: 'categories_loading',
      desc: '',
      args: [],
    );
  }

  /// `Apply Promo Code`
  String get apply_promo {
    return Intl.message(
      'Apply Promo Code',
      name: 'apply_promo',
      desc: '',
      args: [],
    );
  }

  /// `member`
  String get member {
    return Intl.message(
      'member',
      name: 'member',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get Profile {
    return Intl.message(
      'Profile',
      name: 'Profile',
      desc: '',
      args: [],
    );
  }

  /// `Create Personal information`
  String get create_personal {
    return Intl.message(
      'Create Personal information',
      name: 'create_personal',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Number`
  String get mobile_number {
    return Intl.message(
      'Mobile Number',
      name: 'mobile_number',
      desc: '',
      args: [],
    );
  }

  /// `Email(optional)`
  String get email_opt {
    return Intl.message(
      'Email(optional)',
      name: 'email_opt',
      desc: '',
      args: [],
    );
  }

  /// `Name(optional)`
  String get name_opt {
    return Intl.message(
      'Name(optional)',
      name: 'name_opt',
      desc: '',
      args: [],
    );
  }

  /// `Guest User`
  String get Guest_User {
    return Intl.message(
      'Guest User',
      name: 'Guest_User',
      desc: '',
      args: [],
    );
  }

  /// `Order Created`
  String get Order_Created {
    return Intl.message(
      'Order Created',
      name: 'Order_Created',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get Create {
    return Intl.message(
      'Create',
      name: 'Create',
      desc: '',
      args: [],
    );
  }

  /// `Loading`
  String get Loading {
    return Intl.message(
      'Loading',
      name: 'Loading',
      desc: '',
      args: [],
    );
  }

  /// `All Sale`
  String get all_sale {
    return Intl.message(
      'All Sale',
      name: 'all_sale',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the fields`
  String get please_enter_the_fields {
    return Intl.message(
      'Please enter the fields',
      name: 'please_enter_the_fields',
      desc: '',
      args: [],
    );
  }

  /// `Invalid credentials`
  String get invalid_credentials {
    return Intl.message(
      'Invalid credentials',
      name: 'invalid_credentials',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get Login {
    return Intl.message(
      'Login',
      name: 'Login',
      desc: '',
      args: [],
    );
  }

  /// `Pending Order`
  String get pending_order {
    return Intl.message(
      'Pending Order',
      name: 'pending_order',
      desc: '',
      args: [],
    );
  }

  /// `No Product found....`
  String get No_Product_found {
    return Intl.message(
      'No Product found....',
      name: 'No_Product_found',
      desc: '',
      args: [],
    );
  }

  /// `ADD NEW VARIATION`
  String get add_vartiation {
    return Intl.message(
      'ADD NEW VARIATION',
      name: 'add_vartiation',
      desc: '',
      args: [],
    );
  }

  /// `Variation Name`
  String get variation_name {
    return Intl.message(
      'Variation Name',
      name: 'variation_name',
      desc: '',
      args: [],
    );
  }

  /// `Priority`
  String get priority {
    return Intl.message(
      'Priority',
      name: 'priority',
      desc: '',
      args: [],
    );
  }

  /// `Wholesale`
  String get Wholesale {
    return Intl.message(
      'Wholesale',
      name: 'Wholesale',
      desc: '',
      args: [],
    );
  }

  /// `Barcode`
  String get Barcode {
    return Intl.message(
      'Barcode',
      name: 'Barcode',
      desc: '',
      args: [],
    );
  }

  /// `HSN`
  String get HSN {
    return Intl.message(
      'HSN',
      name: 'HSN',
      desc: '',
      args: [],
    );
  }

  /// `Loyalty Points`
  String get loyalty_points {
    return Intl.message(
      'Loyalty Points',
      name: 'loyalty_points',
      desc: '',
      args: [],
    );
  }

  /// `Gross Weight(in kg)`
  String get gross_weight {
    return Intl.message(
      'Gross Weight(in kg)',
      name: 'gross_weight',
      desc: '',
      args: [],
    );
  }

  /// `Minimum Order Qty`
  String get minimum_order_qty {
    return Intl.message(
      'Minimum Order Qty',
      name: 'minimum_order_qty',
      desc: '',
      args: [],
    );
  }

  /// `Maximum Order Qty`
  String get maximum_order_qty {
    return Intl.message(
      'Maximum Order Qty',
      name: 'maximum_order_qty',
      desc: '',
      args: [],
    );
  }

  /// `Min-Max Expiry(Hours)`
  String get min_max_expiry {
    return Intl.message(
      'Min-Max Expiry(Hours)',
      name: 'min_max_expiry',
      desc: '',
      args: [],
    );
  }

  /// `Price Per Unit`
  String get price_per_unit {
    return Intl.message(
      'Price Per Unit',
      name: 'price_per_unit',
      desc: '',
      args: [],
    );
  }

  /// `Actual Price`
  String get actual_price {
    return Intl.message(
      'Actual Price',
      name: 'actual_price',
      desc: '',
      args: [],
    );
  }

  /// `Discounted Price`
  String get discounted_price {
    return Intl.message(
      'Discounted Price',
      name: 'discounted_price',
      desc: '',
      args: [],
    );
  }

  /// `Membership Price`
  String get membership_price {
    return Intl.message(
      'Membership Price',
      name: 'membership_price',
      desc: '',
      args: [],
    );
  }

  /// `Stock`
  String get Stock {
    return Intl.message(
      'Stock',
      name: 'Stock',
      desc: '',
      args: [],
    );
  }

  /// `SAVE`
  String get SAVE {
    return Intl.message(
      'SAVE',
      name: 'SAVE',
      desc: '',
      args: [],
    );
  }

  /// `No variations`
  String get no_variations {
    return Intl.message(
      'No variations',
      name: 'no_variations',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get Language {
    return Intl.message(
      'Language',
      name: 'Language',
      desc: '',
      args: [],
    );
  }

  /// `Picker`
  String get Picker {
    return Intl.message(
      'Picker',
      name: 'Picker',
      desc: '',
      args: [],
    );
  }

  /// `Assign to Driver`
  String get Assigned_Delivery {
    return Intl.message(
      'Assign to Driver',
      name: 'Assigned_Delivery',
      desc: '',
      args: [],
    );
  }

  /// `Create Item`
  String get Create_Item {
    return Intl.message(
      'Create Item',
      name: 'Create_Item',
      desc: '',
      args: [],
    );
  }

  /// `Item Variation`
  String get Item_Variation {
    return Intl.message(
      'Item Variation',
      name: 'Item_Variation',
      desc: '',
      args: [],
    );
  }

  /// `MRP`
  String get mrp {
    return Intl.message(
      'MRP',
      name: 'mrp',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get Status {
    return Intl.message(
      'Status',
      name: 'Status',
      desc: '',
      args: [],
    );
  }

  /// `Item Name`
  String get item_name {
    return Intl.message(
      'Item Name',
      name: 'item_name',
      desc: '',
      args: [],
    );
  }

  /// `Item Name in Hindi`
  String get item_name_in_hindi {
    return Intl.message(
      'Item Name in Hindi',
      name: 'item_name_in_hindi',
      desc: '',
      args: [],
    );
  }

  /// `Stock Type`
  String get stock_type {
    return Intl.message(
      'Stock Type',
      name: 'stock_type',
      desc: '',
      args: [],
    );
  }

  /// `Delivery Duration`
  String get delivery_duration {
    return Intl.message(
      'Delivery Duration',
      name: 'delivery_duration',
      desc: '',
      args: [],
    );
  }

  /// `Product Type`
  String get product_type {
    return Intl.message(
      'Product Type',
      name: 'product_type',
      desc: '',
      args: [],
    );
  }

  /// `Stock Notify`
  String get stock_notify {
    return Intl.message(
      'Stock Notify',
      name: 'stock_notify',
      desc: '',
      args: [],
    );
  }

  /// `Return Duration`
  String get return_duration {
    return Intl.message(
      'Return Duration',
      name: 'return_duration',
      desc: '',
      args: [],
    );
  }

  /// `Tax`
  String get Tax {
    return Intl.message(
      'Tax',
      name: 'Tax',
      desc: '',
      args: [],
    );
  }

  /// `Express Delivery Eligible`
  String get express_delivery_eligible {
    return Intl.message(
      'Express Delivery Eligible',
      name: 'express_delivery_eligible',
      desc: '',
      args: [],
    );
  }

  /// `Item Description`
  String get item_description {
    return Intl.message(
      'Item Description',
      name: 'item_description',
      desc: '',
      args: [],
    );
  }

  /// `Manufacturer Description`
  String get manufacturer_description {
    return Intl.message(
      'Manufacturer Description',
      name: 'manufacturer_description',
      desc: '',
      args: [],
    );
  }

  /// `Item Priority`
  String get item_priority {
    return Intl.message(
      'Item Priority',
      name: 'item_priority',
      desc: '',
      args: [],
    );
  }

  /// `Country of Origin`
  String get country_of_origin {
    return Intl.message(
      'Country of Origin',
      name: 'country_of_origin',
      desc: '',
      args: [],
    );
  }

  /// `Subscription Product`
  String get subscription_product {
    return Intl.message(
      'Subscription Product',
      name: 'subscription_product',
      desc: '',
      args: [],
    );
  }

  /// `Select Vendor`
  String get select_vendor {
    return Intl.message(
      'Select Vendor',
      name: 'select_vendor',
      desc: '',
      args: [],
    );
  }

  /// `Brand`
  String get Brand {
    return Intl.message(
      'Brand',
      name: 'Brand',
      desc: '',
      args: [],
    );
  }

  /// `SKU`
  String get SKU {
    return Intl.message(
      'SKU',
      name: 'SKU',
      desc: '',
      args: [],
    );
  }

  /// `Net Weight`
  String get net_weight {
    return Intl.message(
      'Net Weight',
      name: 'net_weight',
      desc: '',
      args: [],
    );
  }

  /// `Loyalty`
  String get Loyalty {
    return Intl.message(
      'Loyalty',
      name: 'Loyalty',
      desc: '',
      args: [],
    );
  }

  /// `Min`
  String get Min {
    return Intl.message(
      'Min',
      name: 'Min',
      desc: '',
      args: [],
    );
  }

  /// `Max`
  String get Max {
    return Intl.message(
      'Max',
      name: 'Max',
      desc: '',
      args: [],
    );
  }

  /// `Unit`
  String get Unit {
    return Intl.message(
      'Unit',
      name: 'Unit',
      desc: '',
      args: [],
    );
  }

  /// `Increment`
  String get Increment {
    return Intl.message(
      'Increment',
      name: 'Increment',
      desc: '',
      args: [],
    );
  }

  /// `Selling Price`
  String get selling_price {
    return Intl.message(
      'Selling Price',
      name: 'selling_price',
      desc: '',
      args: [],
    );
  }

  /// `Short Note`
  String get Short_Note {
    return Intl.message(
      'Short Note',
      name: 'Short_Note',
      desc: '',
      args: [],
    );
  }

  /// `Item Variations`
  String get item_variations {
    return Intl.message(
      'Item Variations',
      name: 'item_variations',
      desc: '',
      args: [],
    );
  }

  /// `ADD NEW VARIANT`
  String get add_vartiant {
    return Intl.message(
      'ADD NEW VARIANT',
      name: 'add_vartiant',
      desc: '',
      args: [],
    );
  }

  /// `You can't Edit more than `
  String get cant_edit_more {
    return Intl.message(
      'You can\'t Edit more than ',
      name: 'cant_edit_more',
      desc: '',
      args: [],
    );
  }

  /// `READY`
  String get READY {
    return Intl.message(
      'READY',
      name: 'READY',
      desc: '',
      args: [],
    );
  }

  /// `COMPLETED`
  String get COMPLETED {
    return Intl.message(
      'COMPLETED',
      name: 'COMPLETED',
      desc: '',
      args: [],
    );
  }

  /// `PICK`
  String get PICK {
    return Intl.message(
      'PICK',
      name: 'PICK',
      desc: '',
      args: [],
    );
  }

  /// `RECEIVED`
  String get RECEIVED {
    return Intl.message(
      'RECEIVED',
      name: 'RECEIVED',
      desc: '',
      args: [],
    );
  }

  /// `All items need to be prepared to update the order`
  String get all_item_need {
    return Intl.message(
      'All items need to be prepared to update the order',
      name: 'all_item_need',
      desc: '',
      args: [],
    );
  }

  /// `There is no Delivery boy `
  String get there_is_no_delivery {
    return Intl.message(
      'There is no Delivery boy ',
      name: 'there_is_no_delivery',
      desc: '',
      args: [],
    );
  }

  /// `DISPATCHED`
  String get DISPATCHED {
    return Intl.message(
      'DISPATCHED',
      name: 'DISPATCHED',
      desc: '',
      args: [],
    );
  }

  /// `ORDER COMPLETE`
  String get order_completed {
    return Intl.message(
      'ORDER COMPLETE',
      name: 'order_completed',
      desc: '',
      args: [],
    );
  }

  /// `Scan`
  String get Print {
    return Intl.message(
      'Scan',
      name: 'Print',
      desc: '',
      args: [],
    );
  }

  /// `cod`
  String get cod {
    return Intl.message(
      'cod',
      name: 'cod',
      desc: '',
      args: [],
    );
  }

  /// `sod`
  String get sod {
    return Intl.message(
      'sod',
      name: 'sod',
      desc: '',
      args: [],
    );
  }

  /// `online`
  String get online {
    return Intl.message(
      'online',
      name: 'online',
      desc: '',
      args: [],
    );
  }

  /// `CANCELLED`
  String get CANCELLED {
    return Intl.message(
      'CANCELLED',
      name: 'CANCELLED',
      desc: '',
      args: [],
    );
  }

  /// `Search For Order Id`
  String get Search_For_Order_Id {
    return Intl.message(
      'Search For Order Id',
      name: 'Search_For_Order_Id',
      desc: '',
      args: [],
    );
  }

  /// `OFFLINE`
  String get OFFLINE {
    return Intl.message(
      'OFFLINE',
      name: 'OFFLINE',
      desc: '',
      args: [],
    );
  }

  /// `ONLINE`
  String get ONLINE {
    return Intl.message(
      'ONLINE',
      name: 'ONLINE',
      desc: '',
      args: [],
    );
  }

  /// `DASHBOARD`
  String get DASHBOARD {
    return Intl.message(
      'DASHBOARD',
      name: 'DASHBOARD',
      desc: '',
      args: [],
    );
  }

  /// `ORDERS`
  String get ORDERS {
    return Intl.message(
      'ORDERS',
      name: 'ORDERS',
      desc: '',
      args: [],
    );
  }

  /// `MENU`
  String get MENU {
    return Intl.message(
      'MENU',
      name: 'MENU',
      desc: '',
      args: [],
    );
  }

  /// `INSIGHTS`
  String get INSIGHTS {
    return Intl.message(
      'INSIGHTS',
      name: 'INSIGHTS',
      desc: '',
      args: [],
    );
  }

  /// `SETTINGS`
  String get SETTINGS {
    return Intl.message(
      'SETTINGS',
      name: 'SETTINGS',
      desc: '',
      args: [],
    );
  }

  /// `updateOrder`
  String get update_order {
    return Intl.message(
      'updateOrder',
      name: 'update_order',
      desc: '',
      args: [],
    );
  }

  /// `Create Order`
  String get Create_Order {
    return Intl.message(
      'Create Order',
      name: 'Create_Order',
      desc: '',
      args: [],
    );
  }

  /// `Out For Delivery`
  String get Out_for_Delivery {
    return Intl.message(
      'Out For Delivery',
      name: 'Out_for_Delivery',
      desc: '',
      args: [],
    );
  }

  /// `onway`
  String get onway {
    return Intl.message(
      'onway',
      name: 'onway',
      desc: '',
      args: [],
    );
  }

  /// `updateOrderPos`
  String get update_order_pos {
    return Intl.message(
      'updateOrderPos',
      name: 'update_order_pos',
      desc: '',
      args: [],
    );
  }

  /// `Search by order details`
  String get search_by_order {
    return Intl.message(
      'Search by order details',
      name: 'search_by_order',
      desc: '',
      args: [],
    );
  }

  /// `New`
  String get new_delivery {
    return Intl.message(
      'New',
      name: 'new_delivery',
      desc: '',
      args: [],
    );
  }

  /// `Processing / Picking`
  String get processing_picking {
    return Intl.message(
      'Processing / Picking',
      name: 'processing_picking',
      desc: '',
      args: [],
    );
  }

  /// `Ready for delivery / Pickup`
  String get ready_delivery {
    return Intl.message(
      'Ready for delivery / Pickup',
      name: 'ready_delivery',
      desc: '',
      args: [],
    );
  }

  /// `Assigned`
  String get assigned {
    return Intl.message(
      'Assigned',
      name: 'assigned',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'tr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
