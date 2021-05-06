import 'package:adbrixrm_flutter/adbrixrm.dart';
import 'package:flutter/material.dart';

class commerceView extends StatefulWidget {
  @override
  _commerceViewState createState() => _commerceViewState();
}

class _commerceViewState extends State<commerceView> {
  Future<void> addToWishList() async {
    Map<String, dynamic> prooductproperties = <String, dynamic>{
      'productcateory': '지오다노 온 세',
      'limited': 35000,
      'currentsale': 3000,
      'salesleft': 0.30,
      'sale': false
    };

    Map<String, dynamic> eventproperties = <String, dynamic>{
      'string': '경기도 안양시 동안구 호계동 목련 아파트',
      'money': 500000,
      'height': 180.50,
      'married': false
    };

    AdBrixRmCommerceProductModel adBrixRmCommerceProductModel =
    AdBrixRmCommerceProductModel.create(
        productId: 'productIDfortEst',
        productName: 'productNametest',
        price: 1,
        discount: 0,
        quantity: 1,
        currency: AdBrixCurrency.KR_KRW,
        category: AdBrixRmCommerceCategoryModel.create(
            category1: 'categoryTest1',
            category2: 'categoryTest2',
            category3: 'categoryTest3'),
        productAttr: prooductproperties);


    AdBrixRm.commerceAddToWishList(
        productModel: adBrixRmCommerceProductModel,
        attr: eventproperties);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("commerceEvent"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    child: Text('viewHome'),
                    onPressed: viewHome,
                    padding: EdgeInsets.all(8.0),
                  ),
                  RaisedButton(
                    child: Text('productView'),
                    onPressed: productView,
                    padding: EdgeInsets.all(8.0),
                  ),
                  RaisedButton(
                    child: Text('addToWishList'),
                    onPressed: addToWishList,
                    padding: EdgeInsets.all(8.0),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    child: Text('share'),
                    onPressed: commerceShare,
                    padding: EdgeInsets.all(8.0),
                  ),
                  RaisedButton(
                    child: Text('paymentInfo'),
                    onPressed: commercePaymentInfo,
                    padding: EdgeInsets.all(8.0),
                  ),
                  RaisedButton(
                    child: Text('purchase'),
                    onPressed: purchase,
                    padding: EdgeInsets.all(8.0),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    child: Text('CategoryView'),
                    onPressed: commerceCategoryView,
                    padding: EdgeInsets.all(8.0),
                  ),
                  RaisedButton(
                    child: Text('addToCart'),
                    onPressed: commerceAddToCart,
                    padding: EdgeInsets.all(8.0),
                  ),
                  RaisedButton(
                    child: Text('ReviewOrder'),
                    onPressed: commerceReviewOrder,
                    padding: EdgeInsets.all(8.0),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    child: Text('Refund'),
                    onPressed: commerceRefund,
                    padding: EdgeInsets.all(8.0),
                  ),
                  RaisedButton(
                    child: Text('Search'),
                    onPressed: commerceSearch,
                    padding: EdgeInsets.all(8.0),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    child: Text('ListView'),
                    onPressed: commerceListView,
                    padding: EdgeInsets.all(8.0),
                  ),
                  RaisedButton(
                    child: Text('cartView'),
                    onPressed: commerceCartview,
                    padding: EdgeInsets.all(8.0),
                  )
                ],
              )
            ],
          ),
        ));
  }

  Future<void> commerceAddToCart() async {
    Map<String, dynamic> eventproperties = <String, dynamic>{
      'string': '경기도 안양시 동안구 호계동 목련 아파트',
      'money': 500000,
      'height': 180.50,
      'married': false
    };

    AdBrixRmCommerceProductModel adBrixRmCommerceProductModel1 =
    AdBrixRmCommerceProductModel.create(
        productId: 'productIDfortEst',
        productName: 'productNametest',
        price: 1,
        discount: 0,
        quantity: 1,
        currency: AdBrixCurrency.KR_KRW,
        category: AdBrixRmCommerceCategoryModel.create(
            category1: 'categoryTest1'));

    AdBrixRmCommerceProductModel adBrixRmCommerceProductModel2 =
    AdBrixRmCommerceProductModel.create(
        productId: 'product2',
        productName: '프로덕트 2',
        price: 15000.0,
        discount: 2500.0,
        quantity: 3,
        currency: AdBrixCurrency.US_USD,
        category: AdBrixRmCommerceCategoryModel.create(category1: '프로덕트2'));

    AdBrixRmCommerceProductModel adBrixRmCommerceProductModel3 =
    AdBrixRmCommerceProductModel.create(
        productId: 'product3',
        productName: '프로덕트 3',
        price: 2333.0,
        discount: 111.0,
        quantity: 3,
        currency: AdBrixCurrency.JP_JPY,
        category:
        AdBrixRmCommerceCategoryModel.create(category1: '프로덕트34'));

    List<AdBrixRmCommerceProductModel> productlist =
    List<AdBrixRmCommerceProductModel>();
    productlist.add(adBrixRmCommerceProductModel1);
    productlist.add(adBrixRmCommerceProductModel2);
    productlist.add(adBrixRmCommerceProductModel3);


    AdBrixRm.commerceAddToCart(
        productList: productlist,attr: eventproperties);
  }

  Future<void> commerceCartview() async {
    Map<String, dynamic> eventproperties = <String, dynamic>{
      'string': '경기도 안양시 동안구 호계동 목련 아파트',
      'money': 500000,
      'height': 180.50,
      'married': false
    };

    AdBrixRmCommerceProductModel adBrixRmCommerceProductModel1 =
    AdBrixRmCommerceProductModel.create(
        productId: 'productIDfortEst',
        productName: 'productNametest',
        price: 1,
        discount: 0,
        quantity: 1,
        currency: AdBrixCurrency.KR_KRW,
        category: AdBrixRmCommerceCategoryModel.create(
            category1: 'categoryTest1'));

    AdBrixRmCommerceProductModel adBrixRmCommerceProductModel2 =
    AdBrixRmCommerceProductModel.create(
        productId: 'product2',
        productName: '프로덕트 2',
        price: 15000.0,
        discount: 2500.0,
        quantity: 3,
        currency: AdBrixCurrency.US_USD,
        category: AdBrixRmCommerceCategoryModel.create(category1: '프로덕트2'));

    AdBrixRmCommerceProductModel adBrixRmCommerceProductModel3 =
    AdBrixRmCommerceProductModel.create(
        productId: 'product3',
        productName: '프로덕트 3',
        price: 2333.0,
        discount: 111.0,
        quantity: 3,
        currency: AdBrixCurrency.JP_JPY,
        category:
        AdBrixRmCommerceCategoryModel.create(category1: '프로덕트34'));

    List<AdBrixRmCommerceProductModel> productlist =
    List<AdBrixRmCommerceProductModel>();
    productlist.add(adBrixRmCommerceProductModel1);
    productlist.add(adBrixRmCommerceProductModel2);
    productlist.add(adBrixRmCommerceProductModel3);


    AdBrixRm.commerceCartView(
        productList: productlist,attr: eventproperties);
  }

  Future<void> commerceCategoryView() async {
    Map<String, dynamic> eventproperties = <String, dynamic>{
      'string': '경기도 안양시 동안구 호계동 목련 아파트',
      'money': 500000,
      'height': 180.50,
      'married': false
    };

    AdBrixRmCommerceProductModel adBrixRmCommerceProductModel1 =
    AdBrixRmCommerceProductModel.create(
        productId: 'productIDfortEst',
        productName: 'productNametest',
        price: 1,
        discount: 0,
        quantity: 1,
        currency: AdBrixCurrency.KR_KRW,
        category: AdBrixRmCommerceCategoryModel.create(
            category1: 'categoryTest1'));

    AdBrixRmCommerceProductModel adBrixRmCommerceProductModel2 =
    AdBrixRmCommerceProductModel.create(
        productId: 'product2',
        productName: '프로덕트 2',
        price: 15000.0,
        discount: 2500.0,
        quantity: 3,
        currency: AdBrixCurrency.US_USD,
        category: AdBrixRmCommerceCategoryModel.create(category1: '프로덕트2'));

    AdBrixRmCommerceProductModel adBrixRmCommerceProductModel3 =
    AdBrixRmCommerceProductModel.create(
        productId: 'product3',
        productName: '프로덕트 3',
        price: 2333.0,
        discount: 111.0,
        quantity: 3,
        currency: AdBrixCurrency.JP_JPY,
        category:
        AdBrixRmCommerceCategoryModel.create(category1: '프로덕트34'));

    List<AdBrixRmCommerceProductModel> productlist =
    List<AdBrixRmCommerceProductModel>();
    productlist.add(adBrixRmCommerceProductModel1);
    productlist.add(adBrixRmCommerceProductModel2);
    productlist.add(adBrixRmCommerceProductModel3);


    AdBrixRmCommerceCategoryModel eventCategoryModel =
    AdBrixRmCommerceCategoryModel.create(
        category1: 'eventcategory1',
        category2: 'eventcategory2',
        category3: 'eventcategory3',
        category4: 'eventCategory4',
        category5: 'eventCategory5');

    AdBrixRm.commerceCategoryView(
        categoryModel: eventCategoryModel,
        productList: productlist,attr: eventproperties);
  }

  Future<void> commerceListView() async {
    Map<String, dynamic> eventproperties = <String, dynamic>{
      'string': '경기도 안양시 동안구 호계동 목련 아파트',
      'money': 500000,
      'height': 180.50,
      'married': false
    };

    AdBrixRmCommerceProductModel adBrixRmCommerceProductModel1 =
    AdBrixRmCommerceProductModel.create(
        productId: 'productIDfortEst',
        productName: 'productNametest',
        price: 1,
        discount: 0,
        quantity: 1,
        currency: AdBrixCurrency.KR_KRW,
        category: AdBrixRmCommerceCategoryModel.create(
            category1: 'categoryTest1'));

    AdBrixRmCommerceProductModel adBrixRmCommerceProductModel2 =
    AdBrixRmCommerceProductModel.create(
        productId: 'product2',
        productName: '프로덕트 2',
        price: 15000.0,
        discount: 2500.0,
        quantity: 3,
        currency: AdBrixCurrency.US_USD,
        category: AdBrixRmCommerceCategoryModel.create(category1: '프로덕트2'));

    AdBrixRmCommerceProductModel adBrixRmCommerceProductModel3 =
    AdBrixRmCommerceProductModel.create(
        productId: 'product3',
        productName: '프로덕트 3',
        price: 2333.0,
        discount: 111.0,
        quantity: 3,
        currency: AdBrixCurrency.JP_JPY,
        category:
        AdBrixRmCommerceCategoryModel.create(category1: '프로덕트34'));

    List<AdBrixRmCommerceProductModel> productlist =
    List<AdBrixRmCommerceProductModel>();
    productlist.add(adBrixRmCommerceProductModel1);
    productlist.add(adBrixRmCommerceProductModel2);
    productlist.add(adBrixRmCommerceProductModel3);


    AdBrixRm.commerceListView(
        productList: productlist,attr: eventproperties);
  }

  Future<void> commercePaymentInfo() async {
    Map<String, dynamic> eventproperties = <String, dynamic>{
      'string': '경기도 안양시 동안구 호계동 목련 아파트',
      'money': 500000,
      'height': 180.50,
      'married': false
    };


    AdBrixRm.commercePaymentInfoAdd(
        attr: eventproperties);
  }

  Future<void> commerceRefund() async {
    Map<String, dynamic> eventproperties = <String, dynamic>{
      'string': '경기도 안양시 동안구 호계동 목련 아파트',
      'money': 500000,
      'height': 180.50,
      'married': false
    };

    AdBrixRmCommerceProductModel adBrixRmCommerceProductModel1 =
    AdBrixRmCommerceProductModel.create(
        productId: 'productIDfortEst',
        productName: 'productNametest',
        price: 1,
        discount: 0,
        quantity: 1,
        currency: AdBrixCurrency.KR_KRW,
        category: AdBrixRmCommerceCategoryModel.create(
            category1: 'categoryTest1'));

    AdBrixRmCommerceProductModel adBrixRmCommerceProductModel2 =
    AdBrixRmCommerceProductModel.create(
        productId: 'product2',
        productName: '프로덕트 2',
        price: 15000.0,
        discount: 2500.0,
        quantity: 3,
        currency: AdBrixCurrency.US_USD,
        category: AdBrixRmCommerceCategoryModel.create(category1: '프로덕트2'));

    AdBrixRmCommerceProductModel adBrixRmCommerceProductModel3 =
    AdBrixRmCommerceProductModel.create(
        productId: 'product3',
        productName: '프로덕트 3',
        price: 2333.0,
        discount: 111.0,
        quantity: 3,
        currency: AdBrixCurrency.JP_JPY,
        category:
        AdBrixRmCommerceCategoryModel.create(category1: '프로덕트34'));

    List<AdBrixRmCommerceProductModel> productlist =
    List<AdBrixRmCommerceProductModel>();
    productlist.add(adBrixRmCommerceProductModel1);
    productlist.add(adBrixRmCommerceProductModel2);
    productlist.add(adBrixRmCommerceProductModel3);


    AdBrixRm.commerceRefund(
        orderId: 'testOrderID1234',
        productList: productlist,
        penaltyCharge: 4000.0,attr: eventproperties);
  }

  Future<void> commerceReviewOrder() async {
    Map<String, dynamic> eventproperties = <String, dynamic>{
      'string': '경기도 안양시 동안구 호계동 목련 아파트',
      'money': 500000,
      'height': 180.50,
      'married': false
    };

    AdBrixRmCommerceProductModel adBrixRmCommerceProductModel1 =
    AdBrixRmCommerceProductModel.create(
        productId: 'productIDfortEst',
        productName: 'productNametest',
        price: 1,
        discount: 0,
        quantity: 1,
        currency: AdBrixCurrency.KR_KRW,
        category: AdBrixRmCommerceCategoryModel.create(
            category1: 'categoryTest1'));

    AdBrixRmCommerceProductModel adBrixRmCommerceProductModel2 =
    AdBrixRmCommerceProductModel.create(
        productId: 'product2',
        productName: '프로덕트 2',
        price: 15000.0,
        discount: 2500.0,
        quantity: 3,
        currency: AdBrixCurrency.US_USD,
        category: AdBrixRmCommerceCategoryModel.create(category1: '프로덕트2'));

    AdBrixRmCommerceProductModel adBrixRmCommerceProductModel3 =
    AdBrixRmCommerceProductModel.create(
        productId: 'product3',
        productName: '프로덕트 3',
        price: 2333.0,
        discount: 111.0,
        quantity: 3,
        currency: AdBrixCurrency.JP_JPY,
        category:
        AdBrixRmCommerceCategoryModel.create(category1: '프로덕트34'));

    List<AdBrixRmCommerceProductModel> productlist =
    List<AdBrixRmCommerceProductModel>();
    productlist.add(adBrixRmCommerceProductModel1);
    productlist.add(adBrixRmCommerceProductModel2);
    productlist.add(adBrixRmCommerceProductModel3);


    AdBrixRm.commerceReviewOrder(
        orderId: 'testorderid1111',
        productList: productlist,
        discount: 5000.0,
        deliveryCharge: 2500.0,attr: eventproperties);
  }

  Future<void> commerceSearch() async {
    Map<String, dynamic> eventproperties = <String, dynamic>{
      'string': '경기도 안양시 동안구 호계동 목련 아파트',
      'money': 500000,
      'height': 180.50,
      'married': false
    };

    AdBrixRmCommerceProductModel adBrixRmCommerceProductModel1 =
    AdBrixRmCommerceProductModel.create(
        productId: 'productIDfortEst',
        productName: 'productNametest',
        price: 1,
        discount: 0,
        quantity: 1,
        currency: AdBrixCurrency.KR_KRW,
        category: AdBrixRmCommerceCategoryModel.create(
            category1: 'categoryTest1'));

    AdBrixRmCommerceProductModel adBrixRmCommerceProductModel2 =
    AdBrixRmCommerceProductModel.create(
        productId: 'product2',
        productName: '프로덕트 2',
        price: 15000.0,
        discount: 2500.0,
        quantity: 3,
        currency: AdBrixCurrency.US_USD,
        category: AdBrixRmCommerceCategoryModel.create(category1: '프로덕트2'));

    AdBrixRmCommerceProductModel adBrixRmCommerceProductModel3 =
    AdBrixRmCommerceProductModel.create(
        productId: 'product3',
        productName: '프로덕트 3',
        price: 2333.0,
        discount: 111.0,
        quantity: 3,
        currency: AdBrixCurrency.JP_JPY,
        category:
        AdBrixRmCommerceCategoryModel.create(category1: '프로덕트34'));

    List<AdBrixRmCommerceProductModel> productlist =
    List<AdBrixRmCommerceProductModel>();
    productlist.add(adBrixRmCommerceProductModel1);
    productlist.add(adBrixRmCommerceProductModel2);
    productlist.add(adBrixRmCommerceProductModel3);

    AdBrixRm.commerceSearch(
        keyword: 'searchKeyword',
        productList: productlist,attr: eventproperties);
  }

  Future<void> commerceShare() async {
    Map<String, dynamic> prooductproperties = <String, dynamic>{
      'productcateory': '지오다노 온 세',
      'limited': 35000,
      'currentsale': 3000,
      'salesleft': 0.30,
      'sale': false
    };

    Map<String, dynamic> eventproperties = <String, dynamic>{
      'string': '경기도 안양시 동안구 호계동 목련 아파트',
      'money': 500000,
      'height': 180.50,
      'married': false
    };

    AdBrixRmCommerceProductModel adBrixRmCommerceProductModel =
    AdBrixRmCommerceProductModel.create(
        productId: 'productIDfortEst',
        productName: 'productNametest',
        price: 1,
        discount: 0,
        quantity: 1,
        currency: AdBrixCurrency.KR_KRW,
        category: AdBrixRmCommerceCategoryModel.create(
            category1: 'categoryTest1',
            category2: 'categoryTest2',
            category3: 'categoryTest3'),
        productAttr: prooductproperties);


    AdBrixRm.commerceShare(
        sharingChannel: AdBrixSharingChannel.KAKAOSTORY,
        productModel: adBrixRmCommerceProductModel,
        attr: eventproperties);
  }

  Future<void> productView() async {
    Map<String, dynamic> prooductproperties = <String, dynamic>{
      'productcateory': '지오다노 온 세',
      'limited': 35000,
      'currentsale': 3000,
      'salesleft': 0.30,
      'sale': true
    };

    Map<String, dynamic> eventproperties = <String, dynamic>{
      'string': '경기도 안양시 동안구 호계동 목련 아파트',
      'money': 500000,
      'height': 180.50,
      'married': false
    };

    AdBrixRmCommerceProductModel adBrixRmCommerceProductModel =
    AdBrixRmCommerceProductModel.create(
        productId: 'productIDfortEst',
        productName: 'productNametest',
        price: 100000.0,
        discount: 2500.0,
        quantity: 2,
        currency: AdBrixCurrency.JP_JPY,
        category: AdBrixRmCommerceCategoryModel.create(
            category1: 'categoryTest11',
            category2: 'categoryTest22',
            category3: 'categoryTest33'),
        productAttr: prooductproperties);

    AdBrixRm.commerceProductView(
        productModel: adBrixRmCommerceProductModel,
        attr: eventproperties);

  }

  Future<void> purchase() async {
    Map<String, dynamic> prooductproperties = <String, dynamic>{
      'productcateory': '지오다노 온 세',
      'limited': 35000,
      'currentsale': 3000,
      'salesleft': 0.30,
      'sale': false
    };

    Map<String, dynamic> eventproperties = <String, dynamic>{
      'string': '경기도 안양시 동안구 호계동 목련 아파트',
      'money': 500000,
      'height': 180.50,
      'married': false
    };

    AdBrixRmCommerceProductModel adBrixRmCommerceProductModel1 =
    AdBrixRmCommerceProductModel.create(
        productId: 'productIDfortEst',
        productName: 'productNametest',
        price: 1.0,
        discount: 0.0,
        quantity: 1,
        currency: AdBrixCurrency.KR_KRW,
        category: AdBrixRmCommerceCategoryModel.create(
            category1: 'categoryTest1'),
        productAttr: prooductproperties);

    AdBrixRmCommerceProductModel adBrixRmCommerceProductModel2 =
    AdBrixRmCommerceProductModel.create(
        productId: 'product2',
        productName: '프로덕트 2',
        price: 15000.0,
        discount: 2500.0,
        quantity: 3,
        currency: AdBrixCurrency.US_USD,
        category: AdBrixRmCommerceCategoryModel.create(category1: '프로덕트2'));

    AdBrixRmCommerceProductModel adBrixRmCommerceProductModel3 =
    AdBrixRmCommerceProductModel.create(
        productId: 'product3',
        productName: '프로덕트 3',
        price: 2333.0,
        discount: 111.0,
        quantity: 3,
        currency: AdBrixCurrency.JP_JPY,
        category:
        AdBrixRmCommerceCategoryModel.create(category1: '프로덕트34'));

    List<AdBrixRmCommerceProductModel> productlist =[];
    productlist.add(adBrixRmCommerceProductModel1);
    productlist.add(adBrixRmCommerceProductModel2);
    productlist.add(adBrixRmCommerceProductModel3);

    AdBrixRm.commonPurchase(
        orderId: 'orderidTest',
        productList: productlist,
        discount: 1000.0,
        deliveryCharge: 2500.0,
        paymentMethod: AdBrixPaymentMethod.MobilePayment,
        attr: eventproperties, orderSale: 20000.00);

  }

  Future<void> viewHome() async {
    AdBrixRm.commerceViewHome();
  }
}
