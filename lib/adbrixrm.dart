import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

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

enum AdBrixEventUploadCountInterval { MIN, NORMAL, MAX }

enum AdBrixEventUploadTimeInterval { MIN, NORMAL, MAX }

enum AdBrixGender { FEMALE, MALE, UNKNOWN }

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

enum AdBrixLogLevel { NONE, VERBOSE, DEBUG, INFO, WARNING, ERROR }

enum AdBrixPaymentMethod { CreditCard, BankTransfer, MobilePayment, ETC }

class AdBrixRm {
  static const MethodChannel _channel = const MethodChannel('adbrixrm_flutter');

  static Future<String?> get adbrixDeeplink async {
    String? deeplink = await _channel.invokeMethod('adbrixDeeplink');
    return deeplink;
  }

  static Future<String?> get adbrixDeferredDeeplink async {
    String? deferredDeeplink =
        await _channel.invokeMethod('adbrixDeferredDeeplink');
    return deferredDeeplink;
  }

  static void commerceAddToCart(
      {required List<AdBrixRmCommerceProductModel> productList,
      Map<String, dynamic>? attr}) {
    List<Map<String, dynamic>> getProductList = [];

    for (int i = 0; i < productList.length; i++) {
      Map<String, dynamic> product = mappingProductModel(productList[i]);
      getProductList.add(product);
    }
    if (attr != null) {
      _attrBoolChanger(attr);

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

  static void commerceAddToWishList(
      {required AdBrixRmCommerceProductModel productModel,
      Map<String, dynamic>? attr}) {
    if (attr != null) {
      _attrBoolChanger(attr);

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

  static void commerceCartView(
      {required List<AdBrixRmCommerceProductModel> productList,
      Map<String, dynamic>? attr}) {
    List<Map<String, dynamic>> getProductList = [];

    for (int i = 0; i < productList.length; i++) {
      Map<String, dynamic> product = mappingProductModel(productList[i]);
      getProductList.add(product);
    }

    if (attr != null) {
      _attrBoolChanger(attr);

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

  static void commerceCategoryView(
      {required AdBrixRmCommerceCategoryModel categoryModel,
      required List<AdBrixRmCommerceProductModel> productList,
      Map<String, dynamic>? attr}) {
    List<Map<String, dynamic>> getProductList = [];

    for (int i = 0; i < productList.length; i++) {
      Map<String, dynamic> product = mappingProductModel(productList[i]);
      getProductList.add(product);
    }

    if (attr != null) {
      _attrBoolChanger(attr);

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

  static void commerceListView(
      {required List<AdBrixRmCommerceProductModel> productList,
      Map<String, dynamic>? attr}) {
    List<Map<String, dynamic>> getProductList = [];

    for (int i = 0; i < productList.length; i++) {
      Map<String, dynamic> product = mappingProductModel(productList[i]);
      getProductList.add(product);
    }

    if (attr != null) {
      _attrBoolChanger(attr);

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

  static void commercePaymentInfoAdd({Map<String, dynamic>? attr}) {
    if (attr != null) {
      _attrBoolChanger(attr);

      Map<String, dynamic> params = <String, dynamic>{'attr': attr};

      _channel.invokeMethod('commercePaymentInfoAdd', params);
    } else {
      _channel.invokeMethod('commercePaymentInfoAdd');
    }
  }

  static void commerceProductView(
      {required AdBrixRmCommerceProductModel productModel,
      Map<String, dynamic>? attr}) {
    if (attr != null) {
      _attrBoolChanger(attr);

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

  static void commerceRefund(
      {required String orderId,
      required List<AdBrixRmCommerceProductModel> productList,
      required double penaltyCharge,
      Map<String, dynamic>? attr}) {
    List<Map<String, dynamic>> getProductList = [];

    for (int i = 0; i < productList.length; i++) {
      Map<String, dynamic> product = mappingProductModel(productList[i]);
      getProductList.add(product);
    }

    if (attr != null) {
      _attrBoolChanger(attr);

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

  static void commerceReviewOrder(
      {required String orderId,
      required List<AdBrixRmCommerceProductModel> productList,
      required double discount,
      required double deliveryCharge,
      Map<String, dynamic>? attr}) {
    List<Map<String, dynamic>> getProductList = [];

    for (int i = 0; i < productList.length; i++) {
      Map<String, dynamic> product = mappingProductModel(productList[i]);
      getProductList.add(product);
    }

    if (attr != null) {
      _attrBoolChanger(attr);

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

  static void commerceSearch(
      {required String keyword,
      required List<AdBrixRmCommerceProductModel> productList,
      Map<String, dynamic>? attr}) {
    List<Map<String, dynamic>> getProductList = [];

    for (int i = 0; i < productList.length; i++) {
      Map<String, dynamic> product = mappingProductModel(productList[i]);
      getProductList.add(product);
    }

    if (attr != null) {
      _attrBoolChanger(attr);

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

  static void commerceShare(
      {required AdBrixSharingChannel sharingChannel,
      required AdBrixRmCommerceProductModel productModel,
      Map<String, dynamic>? attr}) {
    if (attr != null) {
      _attrBoolChanger(attr);

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

  static void commerceViewHome() {
    _channel.invokeMethod('commerceViewHome');
  }

  static void commonAppUpdate(
      {required String preVersion,
      required String currVersion,
      Map<String, dynamic>? attr}) {
    if (attr != null) {
      _attrBoolChanger(attr);

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

  static void commonPurchase(
      {required String orderId,
      required List<AdBrixRmCommerceProductModel> productList,
      required double orderSale,
      required double discount,
      required double deliveryCharge,
      required AdBrixPaymentMethod paymentMethod,
      Map<String, dynamic>? attr}) {
    List<Map<String, dynamic>> getProductList = [];

    for (int i = 0; i < productList.length; i++) {
      Map<String, dynamic> product = mappingProductModel(productList[i]);
      getProductList.add(product);
    }

    if (attr != null) {
      _attrBoolChanger(attr);

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

  static void commonSignUp(
      {required AdBrixSignUpChannel channel, Map<String, dynamic>? attr}) {
    int channelValue = 0;
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
        break;
      case "SkTid":
        {
          channelValue = 12;
        }
        break;
      case "AppleId" :
        {
          channelValue = 13;
        }
    }

    if (attr != null) {
      _attrBoolChanger(attr);

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

  static void commonUseCredit({Map<String, dynamic>? attr}) {
    if (attr != null) {
      _attrBoolChanger(attr);

      Map<String, dynamic> params = <String, dynamic>{'attr': attr};

      _channel.invokeMethod('useCredit', params);
    } else {
      _channel.invokeMethod('useCredit');
    }
  }

  static void commonUserInvite(
      {required AdBrixInviteChannel inviteChannel,
      Map<String, dynamic>? attr}) {
    int channelValue = 0;
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
      _attrBoolChanger(attr);

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

  static void events(
      {required String eventName, Map<String, dynamic>? attr}) async {
    if (attr != null) {
      _attrBoolChanger(attr);

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

  static void gameCharacterCreated({Map<String, dynamic>? attr}) {
    if (attr != null) {
      _attrBoolChanger(attr);

      Map<String, dynamic> params = <String, dynamic>{
        'attr': attr,
      };

      _channel.invokeMethod('gameCharacterCreated', params);
    } else {
      _channel.invokeMethod('gameCharacterCreated');
    }
  }

  static void gameLevelAchieved(
      {required int levelAchieved, Map<String, dynamic>? attr}) {
    if (attr != null) {
      _attrBoolChanger(attr);

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

  static void gameStageCleared({
    required String stageName,
    Map<String, dynamic>? attr,
  }) {
    if (attr != null) {
      _attrBoolChanger(attr);

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

  static void gameTutorialComplete(
      {required bool isSkip, Map<String, dynamic>? attr}) {
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

  static void gdprForgetMe() {
    _channel.invokeMethod('gdprForgetMe');
  }

  static void login({required String userId}) {
    Map<String, dynamic> params = <String, dynamic>{
      'userId': userId,
    };

    _channel.invokeMethod('login', params);
  }

  static void logout() {
    _channel.invokeMethod('logout');
  }

  static Map<String, dynamic> mappingProductModel(
      AdBrixRmCommerceProductModel item) {
    Map<String, dynamic> dic = item.getProductModel();

    return dic;
  }

  static void sdkInit(
      {required String appKey, required String secretKey, int? delayTime}) {
    Map<String, dynamic> param = {};

    if (Platform.isIOS) {
      if (delayTime != null) {
        param = {
          'AppKey': appKey,
          'SecretKey': secretKey,
          'DelayTime': delayTime
        };
      } else {
        param = {'AppKey': appKey, 'SecretKey': secretKey};
      }
    } else {
      param = {'AppKey': appKey, 'SecretKey': secretKey};
    }
    _channel.invokeMethod('sdkInit', param);
  }

  static void setAge({required int age}) {
    _channel.invokeMethod('setAge', age);
  }

  static void setCiProperties({required Map<String, dynamic> properties}) {
    _channel.invokeMethod('setCiProperties', properties);
  }

  static void setEventUploadCountInterval(
      {required AdBrixEventUploadCountInterval interval}) {
    _channel.invokeMethod(
        'setEventUploadCountInterval', interval.toString().split('.').last);
  }

  static void setEventUploadTimeInterval(
      {required AdBrixEventUploadTimeInterval interval}) {
    _channel.invokeMethod(
        'setEventUploadTimeInterval', interval.toString().split('.').last);
  }

  static void setGender({required AdBrixGender gender}) {
    _channel.invokeMethod('setGender', gender.toString().split('.').last);
  }

  static void setLogLevel({required AdBrixLogLevel logLevel}) {
    _channel.invokeMethod('setLogLevel', logLevel.toString().split('.').last);

    print(logLevel.toString().split('.').last);
  }

  static void setKakaoId({required String kakaoId}) {
    _channel.invokeMethod('setKakaoId', kakaoId);
  }

  static void setUserProperties({required Map<String, dynamic> properties}) {
    _channel.invokeMethod('setUserProperties', properties);
  }

  static void startGettingIDFA() {
    _channel.invokeMethod('startGettingIDFA');
  }

  static void stopGettingIDFA() {
    _channel.invokeMethod('stopGettingIDFA');
  }

  static void _attrBoolChanger(Map<String, dynamic> attr) {
    if (Platform.isIOS) {
      attr.entries.forEach((e) {
        if (e.value.runtimeType == bool) {
          String boolValueString = e.value.toString();
          attr.update(e.key, (value) => boolValueString);
        }
      });
    }
  }
}

class AdBrixRmCommerceCategoryModel {
  String category1 = "";
  String category2 = "";
  String category3 = "";
  String category4 = "";
  String category5 = "";
  List<String> _getList = [];

  AdBrixRmCommerceCategoryModel(String category1, String? category2,
      String? category3, String? category4, String? category5) {
    if ((category2 != null) &&
        (category3 != null) &&
        (category4 != null) &&
        (category5 != null)) {
      this.category1 = category1;
      this.category2 = category2;
      this.category3 = category3;
      this.category4 = category4;
      this.category5 = category5;

      this.setCategoryList(
          [category1, category2, category3, category4, category5]);
    } else if ((category2 != null) &&
        (category3 != null) &&
        (category4 != null)) {
      this.category1 = category1;
      this.category2 = category2;
      this.category3 = category3;
      this.category4 = category4;

      this.setCategoryList([category1, category2, category3, category4]);
    } else if ((category2 != null) && (category3 != null)) {
      this.category1 = category1;
      this.category2 = category2;
      this.category3 = category3;

      this.setCategoryList([category1, category2, category3]);
    } else if ((category2 != null)) {
      this.category1 = category1;
      this.category2 = category2;

      this.setCategoryList([category1, category2]);
    } else {
      this.category1 = category1;

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
      {required String category1,
      String? category2,
      String? category3,
      String? category4,
      String? category5}) {
    return new AdBrixRmCommerceCategoryModel(
        category1, category2, category3, category4, category5);
  }
}

class AdBrixRmCommerceProductModel {
  String productId = "";
  String productName = "";
  double price = 0.0;
  double discount = 0.0;
  int quantity = 0;
  String currency = "";
  List<String> category = [];
  Map<String, dynamic> productAttr = {};

  Map<String, dynamic> _productParameter = {};

  AdBrixRmCommerceProductModel(
      {required String productId,
      required String productName,
      required double price,
      required double discount,
      required int quantity,
      required AdBrixCurrency currency,
      required AdBrixRmCommerceCategoryModel category,
      Map<String, dynamic>? productAttr}) {
    if (productAttr != null) {
      this.productId = productId;
      this.productName = productName;
      this.price = price;
      this.discount = discount;
      this.quantity = quantity;
      this.currency = currency.toString().split('.').last;
      this.category = category.getCategoryList();
      this.productAttr = productAttr;

      _attrBoolChanger(productAttr);

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
      this.productId = productId;
      this.productName = productName;
      this.price = price;
      this.discount = discount;
      this.quantity = quantity;
      this.currency = currency.toString().split('.').last;
      this.category = category.getCategoryList();

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
      {required String productId,
      required String productName,
      required double price,
      required double discount,
      required int quantity,
      required AdBrixCurrency currency,
      required AdBrixRmCommerceCategoryModel category,
      Map<String, dynamic>? productAttr}) {
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

  static void _attrBoolChanger(Map<String, dynamic> attr) {
    if (Platform.isIOS) {
      attr.entries.forEach((e) {
        if (e.value.runtimeType == bool) {
          String boolValueString = e.value.toString();
          attr.update(e.key, (value) => boolValueString);
        }
      });
    }
  }
}

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
  ETC,
  SkTid,
  AppleId
}
