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

  static Future<void> sdkInit(
      {@required String appKey, @required String secretKey}) async {
    Map<String, String> param = <String, String>{
      'AppKey': appKey,
      'SecretKey': secretKey
    };

    await _channel.invokeMethod('sdkInit', param);
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

  // Additional SDK setup

  static Future<void> setLogLevel({@required AdBrixLogLevel logLevel}) async {
    await _channel.invokeMethod(
        'setLogLevel', logLevel.toString().split('.').last);

    print(logLevel.toString().split('.').last);
  }

  static Future<void> setEventUploadCountInterval(
      {@required AdBrixEventUploadCountInterval interval}) async {
    await _channel.invokeMethod(
        'setEventUploadCountInterval', interval.toString().split('.').last);
  }

  static Future<void> setEventUploadTimeInterval(
      {@required AdBrixEventUploadTimeInterval interval}) async {
    await _channel.invokeMethod(
        'setEventUploadTimeInterval', interval.toString().split('.').last);
  }

  //DeeplinkOpen

  static Future<void> deeplinkEvent({@required String deeplink}) async {
    await _channel.invokeMethod('deeplinkEvent', deeplink);
  }

  // GDPR Setup

  static Future<void> gdprForgetMe() async {
    await _channel.invokeMethod('gdprForgetMe');
  }

  // UserProperties Setup

  static Future<void> setAge({@required int age}) async {
    await _channel.invokeMethod('setAge', age);
  }

  static Future<void> setGender({@required AdBrixGender gender}) async {
    await _channel.invokeMethod('setGender', gender.toString().split('.').last);
  }

  static Future<void> setUserProperties(
      {@required Map<String, dynamic> properties}) async {
    await _channel.invokeMethod('setUserProperties', properties);
  }

  // Custom Event

  static Future<void> events(
      {@required String eventName, Map<String, dynamic> attr}) async {
    if (attr != null) {
      Map<String, dynamic> params = <String, dynamic>{
        'eventName': eventName,
        'attr': attr
      };
      await _channel.invokeMethod('events', params);
    } else {
      Map<String, dynamic> params = <String, dynamic>{
        'eventName': eventName,
      };

      await _channel.invokeMethod('events', params);
    }
  }

  // Login

  static Future<void> login({@required String userId}) async {
    Map<String, dynamic> params = <String, dynamic>{
      'userId': userId,
    };

    await _channel.invokeMethod('login', params);
  }

  // Logout
  static Future<void> logout() async{
    await _channel.invokeMethod('logout');
  }

  // commonSignUp

  static Future<void> commonSignUp(
      {@required AdBrixSignUpChannel channel,
        Map<String, dynamic> attr}) async {
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

      await _channel.invokeMethod('commonSignUp', params);
    } else {
      Map<String, dynamic> params = <String, dynamic>{
        'channel': channelValue,
      };

      await _channel.invokeMethod('commonSignUp', params);
    }
  }

  //AppUpdate

  static Future<void> commonAppUpdate(
      {@required String preVersion,
        @required String currVersion,
        Map<String, dynamic> attr}) async {
    if (attr != null) {
      Map<String, dynamic> params = <String, dynamic>{
        'preVersion': preVersion,
        'currVersion': currVersion,
        'attr': attr
      };

      await _channel.invokeMethod('appUpdate', params);
    } else {
      Map<String, dynamic> params = <String, dynamic>{
        'preVersion': preVersion,
        'currVersion': currVersion,
      };

      await _channel.invokeMethod('appUpdate', params);
    }
  }

  // UserInvite

  static Future<void> commonUserInvite(
      {@required AdBrixInviteChannel inviteChannel,
        Map<String, dynamic> attr}) async {
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

      await _channel.invokeMethod('userInvite', params);
    } else {
      Map<String, dynamic> params = <String, dynamic>{
        'inviteChannel': channelValue
      };

      await _channel.invokeMethod('userInvite', params);
    }
  }

  //useCredit

  static Future<void> commonUseCredit({Map<String, dynamic> attr}) async {
    if (attr != null) {
      Map<String, dynamic> params = <String, dynamic>{'attr': attr};

      await _channel.invokeMethod('useCredit', params);
    } else {
      await _channel.invokeMethod('useCredit');
    }
  }

  //gameTutorialComplete

  static Future<void> gameTutorialComplete(
      {@required bool isSkip, Map<String, dynamic> attr}) async {
    if (attr != null) {
      Map<String, dynamic> param = <String, dynamic>{
        'isSkip': isSkip,
        'attr': attr
      };

      await _channel.invokeMethod('gameTutorialComplete', param);
    } else {
      Map<String, dynamic> param = <String, dynamic>{'isSkip': isSkip};

      await _channel.invokeMethod('gameTutorialComplete', param);
    }
  }

  //gameCharacterCreated

  static Future<void> gameCharacterCreated({Map<String, dynamic> attr}) async {
    if (attr != null) {
      Map<String, dynamic> params = <String, dynamic>{
        'attr': attr,
      };

      await _channel.invokeMethod('gameCharacterCreated', params);
    } else {
      await _channel.invokeMethod('gameCharacterCreated');
    }
  }

  //gameStageCleared

  static Future<void> gameStageCleared({
    @required String stageName,
    Map<String, dynamic> attr,
  }) async {
    if (attr != null) {
      Map<String, dynamic> params = <String, dynamic>{
        'stageName': stageName,
        'attr': attr,
      };

      await _channel.invokeMethod('gameStageCleared', params);
    } else {
      Map<String, dynamic> params = <String, dynamic>{
        'stageName': stageName,
      };

      await _channel.invokeMethod('gameStageCleared', params);
    }
  }

  //levelAchieved

  static Future<void> gameLevelAchieved(
      {@required int levelAchieved, Map<String, dynamic> attr}) async {
    if (attr != null) {
      Map<String, dynamic> params = <String, dynamic>{
        'levelAchieved': levelAchieved,
        'attr': attr,
      };

      await _channel.invokeMethod('gameLevelAchieved', params);
    } else {
      Map<String, dynamic> params = <String, dynamic>{
        'levelAchieved': levelAchieved
      };

      await _channel.invokeMethod('gameLevelAchieved', params);
    }
  }

//commerceViewHome

  static Future<void> commerceViewHome() async {
    await _channel.invokeMethod('commerceViewHome');
  }

// commerceProductView

  static Future<void> commerceProductView(
      {@required AdBrixRmCommerceProductModel productModel,
        Map<String, dynamic> attr}) async {
    if (attr != null) {
      Map<String, dynamic> params = <String, dynamic>{
        'productModel': productModel.getProductModel(),
        'attr': attr
      };

      await _channel.invokeMethod('commerceProductView', params);
    } else {
      Map<String, dynamic> params = <String, dynamic>{
        'productModel': productModel.getProductModel()
      };

      await _channel.invokeMethod('commerceProductView', params);
    }
  }

  // commerceAddToWishList

  static Future<void> commerceAddToWishList(
      {@required AdBrixRmCommerceProductModel productModel,
        Map<String, dynamic> attr}) async {
    if (attr != null) {
      Map<String, dynamic> params = <String, dynamic>{
        'productModel': productModel.getProductModel(),
        'attr': attr
      };

      await _channel.invokeMethod('commerceAddToWishList', params);
    } else {
      Map<String, dynamic> params = <String, dynamic>{
        'productModel': productModel.getProductModel()
      };

      await _channel.invokeMethod('commerceAddToWishList', params);
    }
  }

// commerceShare

  static Future<void> commerceShare(
      {@required AdBrixSharingChannel sharingChannel,
        @required AdBrixRmCommerceProductModel productModel,
        Map<String, dynamic> attr}) async {
    if (attr != null) {
      Map<String, dynamic> params = <String, dynamic>{
        'sharingChannel': sharingChannel.toString().split('.').last,
        'productModel': productModel.getProductModel(),
        'attr': attr
      };

      await _channel.invokeMethod('commerceShare', params);
    } else {
      Map<String, dynamic> params = <String, dynamic>{
        'sharingChannel': sharingChannel.toString().split('.').last,
        'productModel': productModel.getProductModel()
      };

      await _channel.invokeMethod('commerceShare', params);
    }
  }

  // paymentInfoAdd

  static Future<void> commercePaymentInfoAdd(
      {Map<String, dynamic> attr}) async {
    if (attr != null) {
      Map<String, dynamic> params = <String, dynamic>{'attr': attr};

      await _channel.invokeMethod('commercePaymentInfoAdd', params);
    } else {
      await _channel.invokeMethod('commercePaymentInfoAdd');
    }
  }

  //commonPurchase

  static Future<void> commonPurchase(
      {@required String orderId,
        @required List<AdBrixRmCommerceProductModel> productList,
        @required double orderSale,
        @required double discount,
        @required double deliveryCharge,
        @required AdBrixPaymentMethod paymentMethod,
        Map<String, dynamic> attr}) async {
    List<Map<String, dynamic>> getProductList = List<Map<String, dynamic>>();

    for (int i = 0; i < productList.length; i++) {
      Map<String, dynamic> product = mappingProductModel(productList[i]);
      getProductList.add(product);
    }

    if (attr != null) {
      Map<String, dynamic> params = <String, dynamic>{
        'orderId': orderId,
        'productList': getProductList,
        'orderSale' : orderSale,
        'discount': discount,
        'deliveryCharge': deliveryCharge,
        'paymentMethod': paymentMethod.toString().split('.').last,
        'attr': attr,
      };

      await _channel.invokeMethod('commonPurchase', params);
    } else {
      Map<String, dynamic> params = <String, dynamic>{
        'orderId': orderId,
        'productList': getProductList,
        'orderSale' : orderSale,
        'discount': discount,
        'deliveryCharge': deliveryCharge,
        'paymentMethod': paymentMethod.toString().split('.').last
      };

      await _channel.invokeMethod('commonPurchase', params);
    }
  }

  // commerceCategoryView

  static Future<void> commerceCategoryView(
      {@required AdBrixRmCommerceCategoryModel categoryModel,
        @required List<AdBrixRmCommerceProductModel> productList,
        Map<String, dynamic> attr}) async {
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

      await _channel.invokeMethod('commerceCategoryView', params);
    } else {
      Map<String, dynamic> params = <String, dynamic>{
        'categoryModel': categoryModel.getCategoryList(),
        'productList': getProductList
      };

      await _channel.invokeMethod('commerceCategoryView', params);
    }
  }

  // commerceAddToCart

  static Future<void> commerceAddToCart(
      {@required List<AdBrixRmCommerceProductModel> productList,
        Map<String, dynamic> attr}) async {
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

      await _channel.invokeMethod('commerceAddToCart', params);
    } else {
      Map<String, dynamic> params = <String, dynamic>{
        'productList': getProductList,
      };

      await _channel.invokeMethod('commerceAddToCart', params);
    }
  }

  // commerceReviewOrder

  static Future<void> commerceReviewOrder(
      {@required String orderId,
        @required List<AdBrixRmCommerceProductModel> productList,
        @required double discount,
        @required double deliveryCharge,
        Map<String, dynamic> attr}) async {
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

      await _channel.invokeMethod('commerceReviewOrder', params);
    } else {
      Map<String, dynamic> params = <String, dynamic>{
        'orderId': orderId,
        'productList': getProductList,
        'discount': discount,
        'deliveryCharge': deliveryCharge,
      };

      await _channel.invokeMethod('commerceReviewOrder', params);
    }
  }

  //commerceRefund

  static Future<void> commerceRefund(
      {@required String orderId,
        @required List<AdBrixRmCommerceProductModel> productList,
        @required double penaltyCharge,
        Map<String, dynamic> attr}) async {
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

      await _channel.invokeMethod('commerceRefund', params);
    } else {
      Map<String, dynamic> params = <String, dynamic>{
        'orderId': orderId,
        'productList': getProductList,
        'penaltyCharge': penaltyCharge
      };

      await _channel.invokeMethod('commerceRefund', params);
    }
  }

  // commerceSearch

  static Future<void> commerceSearch(
      {@required String keyword,
        @required List<AdBrixRmCommerceProductModel> productList,
        Map<String, dynamic> attr}) async {
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

      await _channel.invokeMethod('commerceSearch', params);
    } else {
      Map<String, dynamic> params = <String, dynamic>{
        'keyword': keyword,
        'productList': getProductList
      };

      await _channel.invokeMethod('commerceSearch', params);
    }
  }

  //commerceListView

  static Future<void> commerceListView(
      {@required List<AdBrixRmCommerceProductModel> productList,
        Map<String, dynamic> attr}) async {
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

      await _channel.invokeMethod('commerceListView', params);
    } else {
      Map<String, dynamic> params = <String, dynamic>{
        'productList': getProductList
      };

      await _channel.invokeMethod('commerceListView', params);
    }
  }

  // commerceCartView

  static Future<void> commerceCartView(
      {@required List<AdBrixRmCommerceProductModel> productList,
        Map<String, dynamic> attr}) async {
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

      await _channel.invokeMethod('commerceCartView', params);
    } else {
      Map<String, dynamic> params = <String, dynamic>{
        'productList': getProductList
      };

      await _channel.invokeMethod('commerceCartView', params);
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

