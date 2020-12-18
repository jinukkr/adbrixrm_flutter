import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

enum AdBrixLogLevel { NONE, VERBOSE, DEBUG, INFO, WARNING, ERROR }

enum AdBrixEventUploadCountInterval { MIN, NORMAL, MAX }

enum AdBrixEventUploadTimeInterval { MIN, NORMAL, MAX }

enum AdBrixGender { FEMALE, MALE, UNKNOWN }

enum AdBrixCurrency {
  KR_KRW,
  US_USD,
  JP_JPY,
  EU_EUR,
  UK_GBP,
  CH_CNY,
  TW_TWD,
  HK_HKD,
  ID_IDR, //Indonesia
  IN_INR, //India
  RU_RUB, //Russia
  TH_THB, //Thailand
  VN_VND, //Vietnam
  MY_MYR //Malaysia
}

enum AdBrixPaymentMethod { CreditCard, BankTransfer, MobilePayment, ETC }

enum AdBrixSharingChannel {
  FACEBOOK,
  KAKAOTALK,
  KAKAOSTORY,
  LINE,
  WHATSAPP,
  QQ,
  WECHAT,
  SMS,
  EMAIL,
  COPYURL,
  ETC
}

enum AdBrixSignUpChannel {
  Kakao,
  Naver,
  Line,
  Google,
  Facebook,
  Twitter,
  WhatsApp,
  QQ,
  WeChat,
  UserId,
  ETC
}

enum AdBrixInviteChannel {
  Kakao,
  Naver,
  Line,
  Google,
  Facebook,
  Twitter,
  WhatsApp,
  QQ,
  WeChat,
  ETC
}

class AdBrixRm {
  static const MethodChannel _channel = const MethodChannel('adbrixrm_flutter');

  static void sdkInit({@required String appKey, @required String secretKey}) {
    Map<String, String> param = <String, String>{
      'AppKey': appKey,
      'SecretKey': secretKey
    };

    _channel.invokeMethod('sdkInit', param);
  }

  static Future<String> get adbrixDeferredDeeplink async {
    String deferredDeeplink =
        await _channel.invokeMethod('adbrixDeferredDeeplink');

    if (deferredDeeplink != null) {
      return deferredDeeplink;
    }
  }

  static Future<String> get adbrixDeeplink async {
    String deeplink = await _channel.invokeMethod('adbrixDeeplink');

    if (deeplink != null) {
      return deeplink;
    }
  }

  static void startGettingIDFA() {
    _channel.invokeMethod('startGettingIDFA');
  }

  static void stopGettingIDFA() {
    _channel.invokeMethod('stopGettingIDFA');
  }

  // Additional SDK setup

  static void setLogLevel({@required AdBrixLogLevel logLevel}) {
    _channel.invokeMethod('setLogLevel', logLevel.toString().split('.').last);

    print(logLevel.toString().split('.').last);
  }

  static void setEventUploadCountInterval(
      {@required AdBrixEventUploadCountInterval interval}) {
    _channel.invokeMethod(
        'setEventUploadCountInterval', interval.toString().split('.').last);
  }

  static void setEventUploadTimeInterval(
      {@required AdBrixEventUploadTimeInterval interval}) {
    _channel.invokeMethod(
        'setEventUploadTimeInterval', interval.toString().split('.').last);
  }

  // GDPR Setup

  static void gdprForgetMe() {
    _channel.invokeMethod('gdprForgetMe');
  }

  // UserProperties Setup

  static void setAge({@required int age}) {
    _channel.invokeMethod('setAge', age);
  }

  static void setGender({@required AdBrixGender gender}) {
    _channel.invokeMethod('setGender', gender.toString().split('.').last);
  }

  static void setUserProperties({@required Map<String, dynamic> properties}) {
    _channel.invokeMethod('setUserProperties', properties);
  }

  // Custom Event

  static void events(
      {@required String eventName, Map<String, dynamic> attr}) async {
    if (attr != null) {
      Map<String, dynamic> params = <String, dynamic>{
        'eventName': eventName,
        'attr': attr
      };
      _channel.invokeMethod('events', params);
    } else {
      Map<String, dynamic> params = <String, dynamic>{
        'eventName': eventName,
      };

      _channel.invokeMethod('events', params);
    }
  }

  // Login

  static void login({@required String userId}) {
    Map<String, dynamic> params = <String, dynamic>{
      'userId': userId,
    };

    _channel.invokeMethod('login', params);
  }

  // Logout
  static void logout() {
    _channel.invokeMethod('logout');
  }

  // commonSignUp

  static void commonSignUp(
      {@required AdBrixSignUpChannel channel, Map<String, dynamic> attr}) {
    int channelValue;
    String channelString = channel.toString().split('.').last;

    switch (channelString) {
      case "Kakao":
        {
          channelValue = 1;
        }
        break;
      case "Naver":
        {
          channelValue = 2;
        }
        break;
      case "Line":
        {
          channelValue = 3;
        }
        break;
      case "Google":
        {
          channelValue = 4;
        }
        break;
      case "Facebook":
        {
          channelValue = 5;
        }
        break;
      case "Twitter":
        {
          channelValue = 6;
        }
        break;
      case "WhatsApp":
        {
          channelValue = 7;
        }
        break;
      case "QQ":
        {
          channelValue = 8;
        }
        break;
      case "WeChat":
        {
          channelValue = 9;
        }
        break;
      case "UserId":
        {
          channelValue = 10;
        }
        break;
      case "ETC":
        {
          channelValue = 11;
        }
    }

    if (attr != null) {
      Map<String, dynamic> params = <String, dynamic>{
        'channel': channelValue,
        'attr': attr
      };

      _channel.invokeMethod('commonSignUp', params);
    } else {
      Map<String, dynamic> params = <String, dynamic>{
        'channel': channelValue,
      };

      _channel.invokeMethod('commonSignUp', params);
    }
  }

  //AppUpdate

  static void commonAppUpdate(
      {@required String preVersion,
      @required String currVersion,
      Map<String, dynamic> attr}) {
    if (attr != null) {
      Map<String, dynamic> params = <String, dynamic>{
        'preVersion': preVersion,
        'currVersion': currVersion,
        'attr': attr
      };

      _channel.invokeMethod('appUpdate', params);
    } else {
      Map<String, dynamic> params = <String, dynamic>{
        'preVersion': preVersion,
        'currVersion': currVersion,
      };

      _channel.invokeMethod('appUpdate', params);
    }
  }

  // UserInvite

  static void commonUserInvite(
      {@required AdBrixInviteChannel inviteChannel,
      Map<String, dynamic> attr}) {
    int channelValue;
    String channelString = inviteChannel.toString().split('.').last;

    switch (channelString) {
      case "Kakao":
        {
          channelValue = 1;
        }
        break;
      case "Naver":
        {
          channelValue = 2;
        }
        break;
      case "Line":
        {
          channelValue = 3;
        }
        break;
      case "Google":
        {
          channelValue = 4;
        }
        break;
      case "Facebook":
        {
          channelValue = 5;
        }
        break;
      case "Twitter":
        {
          channelValue = 6;
        }
        break;
      case "WhatsApp":
        {
          channelValue = 7;
        }
        break;
      case "QQ":
        {
          channelValue = 8;
        }
        break;
      case "WeChat":
        {
          channelValue = 9;
        }
        break;
      case "ETC":
        {
          channelValue = 10;
        }
    }

    if (attr != null) {
      Map<String, dynamic> params = <String, dynamic>{
        'inviteChannel': channelValue,
        'attr': attr
      };

      _channel.invokeMethod('userInvite', params);
    } else {
      Map<String, dynamic> params = <String, dynamic>{
        'inviteChannel': channelValue
      };

      _channel.invokeMethod('userInvite', params);
    }
  }

  //useCredit

  static void commonUseCredit({Map<String, dynamic> attr}) {
    if (attr != null) {
      Map<String, dynamic> params = <String, dynamic>{'attr': attr};

      _channel.invokeMethod('useCredit', params);
    } else {
      _channel.invokeMethod('useCredit');
    }
  }

  //gameTutorialComplete

  static void gameTutorialComplete(
      {@required bool isSkip, Map<String, dynamic> attr}) {
    if (attr != null) {
      Map<String, dynamic> param = <String, dynamic>{
        'isSkip': isSkip,
        'attr': attr
      };

      _channel.invokeMethod('gameTutorialComplete', param);
    } else {
      Map<String, dynamic> param = <String, dynamic>{'isSkip': isSkip};

      _channel.invokeMethod('gameTutorialComplete', param);
    }
  }

  //gameCharacterCreated

  static void gameCharacterCreated({Map<String, dynamic> attr}) {
    if (attr != null) {
      Map<String, dynamic> params = <String, dynamic>{
        'attr': attr,
      };

      _channel.invokeMethod('gameCharacterCreated', params);
    } else {
      _channel.invokeMethod('gameCharacterCreated');
    }
  }

  //gameStageCleared

  static void gameStageCleared({
    @required String stageName,
    Map<String, dynamic> attr,
  }) {
    if (attr != null) {
      Map<String, dynamic> params = <String, dynamic>{
        'stageName': stageName,
        'attr': attr,
      };

      _channel.invokeMethod('gameStageCleared', params);
    } else {
      Map<String, dynamic> params = <String, dynamic>{
        'stageName': stageName,
      };

      _channel.invokeMethod('gameStageCleared', params);
    }
  }

  //levelAchieved

  static void gameLevelAchieved(
      {@required int levelAchieved, Map<String, dynamic> attr}) {
    if (attr != null) {
      Map<String, dynamic> params = <String, dynamic>{
        'levelAchieved': levelAchieved,
        'attr': attr,
      };

      _channel.invokeMethod('gameLevelAchieved', params);
    } else {
      Map<String, dynamic> params = <String, dynamic>{
        'levelAchieved': levelAchieved
      };

      _channel.invokeMethod('gameLevelAchieved', params);
    }
  }

//commerceViewHome

  static void commerceViewHome() {
    _channel.invokeMethod('commerceViewHome');
  }

// commerceProductView

  static void commerceProductView(
      {@required AdBrixRmCommerceProductModel productModel,
      Map<String, dynamic> attr}) {
    if (attr != null) {
      Map<String, dynamic> params = <String, dynamic>{
        'productModel': productModel.getProductModel(),
        'attr': attr
      };

      _channel.invokeMethod('commerceProductView', params);
    } else {
      Map<String, dynamic> params = <String, dynamic>{
        'productModel': productModel.getProductModel()
      };

      _channel.invokeMethod('commerceProductView', params);
    }
  }

  // commerceAddToWishList

  static void commerceAddToWishList(
      {@required AdBrixRmCommerceProductModel productModel,
      Map<String, dynamic> attr}) {
    if (attr != null) {
      Map<String, dynamic> params = <String, dynamic>{
        'productModel': productModel.getProductModel(),
        'attr': attr
      };

      _channel.invokeMethod('commerceAddToWishList', params);
    } else {
      Map<String, dynamic> params = <String, dynamic>{
        'productModel': productModel.getProductModel()
      };

      _channel.invokeMethod('commerceAddToWishList', params);
    }
  }

// commerceShare

  static void commerceShare(
      {@required AdBrixSharingChannel sharingChannel,
      @required AdBrixRmCommerceProductModel productModel,
      Map<String, dynamic> attr}) {
    if (attr != null) {
      Map<String, dynamic> params = <String, dynamic>{
        'sharingChannel': sharingChannel.toString().split('.').last,
        'productModel': productModel.getProductModel(),
        'attr': attr
      };

      _channel.invokeMethod('commerceShare', params);
    } else {
      Map<String, dynamic> params = <String, dynamic>{
        'sharingChannel': sharingChannel.toString().split('.').last,
        'productModel': productModel.getProductModel()
      };

      _channel.invokeMethod('commerceShare', params);
    }
  }

  // paymentInfoAdd

  static void commercePaymentInfoAdd({Map<String, dynamic> attr}) {
    if (attr != null) {
      Map<String, dynamic> params = <String, dynamic>{'attr': attr};

      _channel.invokeMethod('commercePaymentInfoAdd', params);
    } else {
      _channel.invokeMethod('commercePaymentInfoAdd');
    }
  }

  //commonPurchase

  static void commonPurchase(
      {@required String orderId,
      @required List<AdBrixRmCommerceProductModel> productList,
      @required double orderSale,
      @required double discount,
      @required double deliveryCharge,
      @required AdBrixPaymentMethod paymentMethod,
      Map<String, dynamic> attr}) {
    List<Map<String, dynamic>> getProductList = List<Map<String, dynamic>>();

    for (int i = 0; i < productList.length; i++) {
      Map<String, dynamic> product = mappingProductModel(productList[i]);
      getProductList.add(product);
    }

    if (attr != null) {
      Map<String, dynamic> params = <String, dynamic>{
        'orderId': orderId,
        'productList': getProductList,
        'orderSale': orderSale,
        'discount': discount,
        'deliveryCharge': deliveryCharge,
        'paymentMethod': paymentMethod.toString().split('.').last,
        'attr': attr,
      };

      _channel.invokeMethod('commonPurchase', params);
    } else {
      Map<String, dynamic> params = <String, dynamic>{
        'orderId': orderId,
        'productList': getProductList,
        'orderSale': orderSale,
        'discount': discount,
        'deliveryCharge': deliveryCharge,
        'paymentMethod': paymentMethod.toString().split('.').last
      };

      _channel.invokeMethod('commonPurchase', params);
    }
  }

  // commerceCategoryView

  static void commerceCategoryView(
      {@required AdBrixRmCommerceCategoryModel categoryModel,
      @required List<AdBrixRmCommerceProductModel> productList,
      Map<String, dynamic> attr}) {
    List<Map<String, dynamic>> getProductList = List<Map<String, dynamic>>();

    for (int i = 0; i < productList.length; i++) {
      Map<String, dynamic> product = mappingProductModel(productList[i]);
      getProductList.add(product);
    }

    if (attr != null) {
      Map<String, dynamic> params = <String, dynamic>{
        'categoryModel': categoryModel.getCategoryList(),
        'productList': getProductList,
        'attr': attr,
      };

      _channel.invokeMethod('commerceCategoryView', params);
    } else {
      Map<String, dynamic> params = <String, dynamic>{
        'categoryModel': categoryModel.getCategoryList(),
        'productList': getProductList
      };

      _channel.invokeMethod('commerceCategoryView', params);
    }
  }

  // commerceAddToCart

  static void commerceAddToCart(
      {@required List<AdBrixRmCommerceProductModel> productList,
      Map<String, dynamic> attr}) {
    List<Map<String, dynamic>> getProductList = List<Map<String, dynamic>>();

    for (int i = 0; i < productList.length; i++) {
      Map<String, dynamic> product = mappingProductModel(productList[i]);
      getProductList.add(product);
    }
    if (attr != null) {
      Map<String, dynamic> params = <String, dynamic>{
        'productList': getProductList,
        'attr': attr,
      };

      _channel.invokeMethod('commerceAddToCart', params);
    } else {
      Map<String, dynamic> params = <String, dynamic>{
        'productList': getProductList,
      };

      _channel.invokeMethod('commerceAddToCart', params);
    }
  }

  // commerceReviewOrder

  static void commerceReviewOrder(
      {@required String orderId,
      @required List<AdBrixRmCommerceProductModel> productList,
      @required double discount,
      @required double deliveryCharge,
      Map<String, dynamic> attr}) {
    List<Map<String, dynamic>> getProductList = List<Map<String, dynamic>>();

    for (int i = 0; i < productList.length; i++) {
      Map<String, dynamic> product = mappingProductModel(productList[i]);
      getProductList.add(product);
    }

    if (attr != null) {
      Map<String, dynamic> params = <String, dynamic>{
        'orderId': orderId,
        'productList': getProductList,
        'discount': discount,
        'deliveryCharge': deliveryCharge,
        'attr': attr
      };

      _channel.invokeMethod('commerceReviewOrder', params);
    } else {
      Map<String, dynamic> params = <String, dynamic>{
        'orderId': orderId,
        'productList': getProductList,
        'discount': discount,
        'deliveryCharge': deliveryCharge,
      };

      _channel.invokeMethod('commerceReviewOrder', params);
    }
  }

  //commerceRefund

  static void commerceRefund(
      {@required String orderId,
      @required List<AdBrixRmCommerceProductModel> productList,
      @required double penaltyCharge,
      Map<String, dynamic> attr}) {
    List<Map<String, dynamic>> getProductList = List<Map<String, dynamic>>();

    for (int i = 0; i < productList.length; i++) {
      Map<String, dynamic> product = mappingProductModel(productList[i]);
      getProductList.add(product);
    }

    if (attr != null) {
      Map<String, dynamic> params = <String, dynamic>{
        'orderId': orderId,
        'productList': getProductList,
        'penaltyCharge': penaltyCharge,
        'attr': attr,
      };

      _channel.invokeMethod('commerceRefund', params);
    } else {
      Map<String, dynamic> params = <String, dynamic>{
        'orderId': orderId,
        'productList': getProductList,
        'penaltyCharge': penaltyCharge
      };

      _channel.invokeMethod('commerceRefund', params);
    }
  }

  // commerceSearch

  static void commerceSearch(
      {@required String keyword,
      @required List<AdBrixRmCommerceProductModel> productList,
      Map<String, dynamic> attr}) {
    List<Map<String, dynamic>> getProductList = List<Map<String, dynamic>>();

    for (int i = 0; i < productList.length; i++) {
      Map<String, dynamic> product = mappingProductModel(productList[i]);
      getProductList.add(product);
    }

    if (attr != null) {
      Map<String, dynamic> params = <String, dynamic>{
        'keyword': keyword,
        'productList': getProductList,
        'attr': attr
      };

      _channel.invokeMethod('commerceSearch', params);
    } else {
      Map<String, dynamic> params = <String, dynamic>{
        'keyword': keyword,
        'productList': getProductList
      };

      _channel.invokeMethod('commerceSearch', params);
    }
  }

  //commerceListView

  static void commerceListView(
      {@required List<AdBrixRmCommerceProductModel> productList,
      Map<String, dynamic> attr}) {
    List<Map<String, dynamic>> getProductList = List<Map<String, dynamic>>();

    for (int i = 0; i < productList.length; i++) {
      Map<String, dynamic> product = mappingProductModel(productList[i]);
      getProductList.add(product);
    }

    if (attr != null) {
      Map<String, dynamic> params = <String, dynamic>{
        'productList': getProductList,
        'attr': attr
      };

      _channel.invokeMethod('commerceListView', params);
    } else {
      Map<String, dynamic> params = <String, dynamic>{
        'productList': getProductList
      };

      _channel.invokeMethod('commerceListView', params);
    }
  }

  // commerceCartView

  static void commerceCartView(
      {@required List<AdBrixRmCommerceProductModel> productList,
      Map<String, dynamic> attr}) {
    List<Map<String, dynamic>> getProductList = List<Map<String, dynamic>>();

    for (int i = 0; i < productList.length; i++) {
      Map<String, dynamic> product = mappingProductModel(productList[i]);
      getProductList.add(product);
    }

    if (attr != null) {
      Map<String, dynamic> params = <String, dynamic>{
        'productList': getProductList,
        'attr': attr
      };

      _channel.invokeMethod('commerceCartView', params);
    } else {
      Map<String, dynamic> params = <String, dynamic>{
        'productList': getProductList
      };

      _channel.invokeMethod('commerceCartView', params);
    }
  }

  // AdBrixRm Event Utility

  static Map<String, dynamic> mappingProductModel(
      AdBrixRmCommerceProductModel item) {
    Map<String, dynamic> dic = item.getProductModel();

    return dic;
  }
}

class AdBrixRmCommerceCategoryModel {
  String category1;
  String category2;
  String category3;
  String category4;
  String category5;
  List<String> _getList;

  AdBrixRmCommerceCategoryModel(
      {String category1,
      String category2,
      String category3,
      String category4,
      String category5}) {
    this.category1 = category1;
    this.category2 = category2;
    this.category3 = category3;
    this.category4 = category4;
    this.category5 = category5;

    if ((category1 != null) &&
        (category2 != null) &&
        (category3 != null) &&
        (category4 != null) &&
        (category5 != null)) {
      this.setCategoryList(
          [category1, category2, category3, category4, category5]);
    } else if ((category1 != null) &&
        (category2 != null) &&
        (category3 != null) &&
        (category4 != null)) {
      this.setCategoryList([category1, category2, category3, category4]);
    } else if ((category1 != null) &&
        (category2 != null) &&
        (category3 != null)) {
      this.setCategoryList([category1, category2, category3]);
    } else if ((category1 != null) && (category2 != null)) {
      this.setCategoryList([category1, category2]);
    } else {
      this.setCategoryList([category1]);
    }
  }

  List<String> getCategoryList() {
    return _getList;
  }

  void setCategoryList(List<String> getList) {
    this._getList = getList;
  }

  static AdBrixRmCommerceCategoryModel create(
      {@required String category1,
      String category2,
      String category3,
      String category4,
      String category5}) {
    return new AdBrixRmCommerceCategoryModel(
        category1: category1,
        category2: category2,
        category3: category3,
        category4: category4,
        category5: category5);
  }
}

class AdBrixRmCommerceProductModel {
  String productId;
  String productName;
  double price;
  double discount;
  int quantity;
  String currency;
  List<String> category;
  Map<String, dynamic> productAttr;

  Map<String, dynamic> _productParameter;

  AdBrixRmCommerceProductModel(
      {String productId,
      String productName,
      double price,
      double discount,
      int quantity,
      AdBrixCurrency currency,
      AdBrixRmCommerceCategoryModel category,
      Map<String, dynamic> productAttr}) {
    this.productId = productId;
    this.productName = productName;
    this.price = price;
    this.discount = discount;
    this.quantity = quantity;
    this.currency = currency.toString().split('.').last;
    this.category = category.getCategoryList();
    this.productAttr = productAttr;

    if (productAttr != null) {
      Map<String, dynamic> setProduct = <String, dynamic>{
        'productId': productId,
        'productName': productName,
        'price': price,
        'discount': discount,
        'quantity': quantity,
        'currency': currency.toString().split('.').last,
        'category': category.getCategoryList(),
        'productAttr': productAttr
      };

      this.setProductModel(setProduct);
    } else {
      Map<String, dynamic> setProduct = <String, dynamic>{
        'productId': productId,
        'productName': productName,
        'price': price,
        'discount': discount,
        'quantity': quantity,
        'currency': currency.toString().split('.').last,
        'category': category.getCategoryList(),
      };

      this.setProductModel(setProduct);
    }
  }

  Map<String, dynamic> getProductModel() {
    return _productParameter;
  }

  void setProductModel(Map<String, dynamic> setupProduct) {
    this._productParameter = setupProduct;
  }

  static AdBrixRmCommerceProductModel create(
      {@required String productId,
      @required String productName,
      @required double price,
      @required double discount,
      @required int quantity,
      @required AdBrixCurrency currency,
      @required AdBrixRmCommerceCategoryModel category,
      Map<String, dynamic> productAttr}) {
    return new AdBrixRmCommerceProductModel(
        productId: productId,
        productName: productName,
        price: price,
        discount: discount,
        quantity: quantity,
        currency: currency,
        category: category,
        productAttr: productAttr);
  }
}