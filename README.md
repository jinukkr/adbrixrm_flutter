# adbrixflutter

AdBrixRM Plugin for Flutter Project

## Support Platform

- Android 4.1 +
- iOS 10 +

## Current SDK version

- Android :  1.1.2110
- iOS : 1.6.5102

## Install the Plugin

Add dependencies on pubspec.yaml

```
dependencies:
  adbrixflutter: ^1.0.0
```

## Initialize SDK
To initialize SDK add this api on main.dart initState().
You can get AppKey and SecretKey from AdBrix Console. (https://console.adbrix.io)

    import 'package:adbrixflutter/adbrixrm.dart
    .
    .
    .
        @override
        void  initState() {
    	  WidgetsBinding.instance.addObserver(this);
    	  super.initState();

    	  AdBrixRm.sdkInit(appKey:  'your_appKey', secretKey:  'your_secretKey');

    	}

### Additional SDK Setting

To set additional SDK Setting like SDK logLevel and Event upload interval add this api after the sdkInit api.

    //Event upload by event count
    AdBrixRm.setEventUploadCountInterval(interval:  AdBrixEventUploadCountInterval.MIN);

    //Event Uplad by after few seconds.
    AdBrixRm.setEventUploadTimeInterval( interval:  AdBrixEventUploadTimeInterval.MIN);

    // Set SDK logLevel
    AdBrixRm.setLogLevel(logLevel:  AdBrixLogLevel.Error);


## Add API

### Deeplink and DeferredDeeplink

#### Deeplink
To track the Deeplink open event, set a deeplink scheme and set apis on each platform.

 - Android

  Add android scheme and path Activity that have MAIN and LAUNCHER on Androidmanifest.xml. You can find Androidmanifest.xml file on Android -> app -> src folder.

        <intent-filter>
	        <action android:name="android.intent.action.VIEW" />
	        <category android:name="android.intent.category.DEFAULT" />
	        <category android:name="android.intent.category.BROWSABLE" />
	        <!--Add your deeplink scheme and host -->
	        <data android:scheme="your_scheme" android:host="your_host" />
        </intent-filter>


Open the MainActivity and add this code.


        public class MainActivity extends FlutterActivity {

	        @Override
	        protected void onCreate(Bundle savedInstanceState){
	            super.onCreate(savedInstanceState);
	            onNewIntent(this.getIntent());
	        }

		@Override
	        protected void onNewIntent(Intent intent) {
	            super.onNewIntent(intent);
	            setIntent(intent);
	        }
	}


- iOS

 Add iOS URL scheme on Xcode.
![](https://help.adbrix.io/hc/article_attachments/360003729934/image.png)


Open the AppDelegate.swift and add this code.

        import AdBrixRM

	    override func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {

		let** adBrix = AdBrixRM.getInstance
		adBrix.deepLinkOpen(url: url)

		return false
	    }



- Flutter

 After all setting use AdBrixRm.adbrixDeeplink api to receive deeplink data.


	     @override
	      void initState() {
	        super.initState();
	        WidgetsBinding.instance.addObserver(this);

		// receive Deeplink data from after App start.
	        getDeeplink();

	     }

	      @override
	       void didChangeAppLifecycleState(AppLifecycleState currentState) {
		if (currentState == AppLifecycleState.resumed) {

		   // receive Deeplink data from after App is onResume.
		   getDeeplink();

	        }
	      }

	          // Add getDeeplink
		  Future <void> getDeeplink () async {

		      String deeplink;

		          try {
			    deeplink = await AdBrixRm.adbrixDeeplink;
			    } on PlatformException {
				 print("there is no deeplink");
			  }
		 }


#### Deferred Deeplink
Deferred Deeplink is for open the specify page when app is opened after it installed. To use this, add this code on main.dart initState after SDKinit api.


	     @override
	      void initState() {
	        super.initState();
	        WidgetsBinding.instance.addObserver(this);

			  // receive DeferredDeeplink data from after App start.
			  // receiving DeferredDeeplink may takes time due to server's condition.
			  // We recommend make some delay time.
			  Time(Duration(seconds :3),() {
		          getDeferredDeeplink();
	          });

	     }

	      // Add getDeferredDeeplink
		  Future <void> getDeferredDeeplink () async {

		      String deferreddeeplink;

		          try {
			    deferreddeeplink = await AdBrixRm.adbrixDeeplink;
			     } on PlatformException {
			       print("there is no deferred deeplink");
			 }
		}


### Event

#### User Event

 - Login

	   void  userid()  {

	    AdBrixRm.login(userId:  'userID');

	   }

- User Information

      void userInfo() {

		// set user Age
		AdBrixRm.setAge(age:  18);
		// Set user Gender
		AdBrixRm.setGender(gender:  AdBrixGender.MALE);

	       // set Addtional User Info
	       // Note : Don't use capital letter or special characters on Key String.
		   Map<String,  dynamic> properties =  <String,  dynamic>{
			    'address':  'Seoul',
			    'money':  500000,
			    'height':  180.50,
		    };

		    AdBrixRm.setUserProperties(properties: properties);
      }

#### Custom Event
This event is for event that not pre-defined from AdBrix. You can write your own event name on this event API.

    void customEvent () {

	    	//set Addtional Event Value (Optional)
		//Note : Don't use capital letter or special characters on Key String.
		Map<String, dynamic> attr = <String, dyanamic>{
		'local' : 'Seoul',
		'age' : 36,
		'height' : 180.00
		}

		AdBrixRm.events(eventName : 'your_event_name', attr : attr);

    }

#### Common Event

 - Sign Up


	   void  signUp()  {

	    	//set Addtional Event Value (Optional)
		//Note : Don't use capital letter or special characters on Key String.
		Map<String,  dynamic> properties =  <String,  dynamic>{
			    'local':  'Seoul',
			    'age':  36,
			    'height':  180.50,

		};

		AdBrixRm.commonSignUp( channel:  AdBrixSignUpChannel.Naver, attr: properties);

	    }

 - App Update

	   void  appUpdate()  {

	    	     //set Addtional Event Value (Optional)
		    //Note : Don't use capital letter or special characters on Key String.
		    Map<String,  dynamic> properties =  <String,  dynamic>{
			    'local':  'Seoul',
			    'age':  36,
			    'height':  180.50,

			 };

		    AdBrixRm.commonAppUpdate(preVersion:'2.0.0', currVersion:'3.0.0', attr: properties);

	    }

 - User Invite

 	   void  userInvite()  {

	    	    //set Addtional Event Value (Optional)
		    //Note : Don't use capital letter or special characters on Key String.
		    Map<String,  dynamic> properties =  <String,  dynamic>{
			    'local':  'Seoul',
			    'age':  36,
			    'height':  180.50,

			 };

		    AdBrixRm.commonUserInvite(inviteChannel: AdBrixInviteChannel.Kakao, attr: properties);

	    }
 - Use Credit

  	   void  useCredit()  {

	    	   //set Addtional Event Value (Optional)
		   //Note : Don't use capital letter or special characters on Key String.
		    Map<String,  dynamic> properties =  <String,  dynamic>{
			    'local':  'Seoul',
			    'age':  36,
			    'height':  180.50,
			    'credituserd' : 200.0

			 };

		    AdBrixRm.commonUseCredit(attr: properties);

	    }

 - Purchase

	    void  purchase()  {

		    // Set Product
		    // product info (Optional)
		    // Note : Don't use capital letter or special characters on Key String.
		    Map<String,  dynamic> productInfo=  <String,  dynamic>{
			    'productbrand':  'AIR_Product',
			    'limited':  35000,
			    'currentsale':  3000,
			    'salesleft':  0.30,
			    'sale':  false
		    };

			 // Create Product
		    AdBrixRmCommerceProductModel adBrixRmCommerceProductModel1 =
			    AdBrixRmCommerceProductModel.create(
				    productId:  'myproductId',
				    productName:  'productNametest',
				    price:  1000000.0,
				    discount:  250000.0,
				    quantity:  1,
				    currency:  AdBrixCurrency.KR_KRW,
				    category:  AdBrixRmCommerceCategoryModel.create(
				    category1:  'categoryTest1'),
				    productAttr: prooductproperties);

		    AdBrixRmCommerceProductModel adBrixRmCommerceProductModel2 =
			    AdBrixRmCommerceProductModel.create(
				    productId:  'productID 2',
				    productName: productName2',
				    price:  15000.0,
				    discount:  2500.0,
				    quantity:  3,
				    currency:  AdBrixCurrency.KR_KRW,
				    category:  AdBrixRmCommerceCategoryModel.create(category1:  'categoryTest1'));

	       // Make a List for ProductModel
		    List<AdBrixRmCommerceProductModel> productlist = List<AdBrixRmCommerceProductModel>();
		    productlist.add(adBrixRmCommerceProductModel1);
		    productlist.add(adBrixRmCommerceProductModel2);

	    	 //set Addtional Event Value (Optional)
			 //Note : Don't use capital letter or special characters on Key String.
		    Map<String,  dynamic> eventproperties =  <String,  dynamic>{
			    'local':  'Seoul',
			    'age':  36,
			    'height':  180.50,

			 };

		    AdBrixRm.commonPurchase(
			    orderId:'myorderid',
			    productList: productlist,
			    discount:  1000.0,
			    deliveryCharge:  2500.0,
			    paymentMethod:  AdBrixPaymentMethod.MobilePayment,
			    attr: eventproperties);
	    }


#### Commerce Event

This is a event list for commonly use on Open market and Commerce App.

 - viewHome


		void  viewHome()  {

			AdBrixRm.commerceViewHome();

		}


 - catagoryView

	    void  categoryView()  {

		    // Set Product
		    // product info (Optional)
		    // Note : Don't use capital letter or special characters on Key String.
		    Map<String,  dynamic> productInfo=  <String,  dynamic>{
			    'productbrand':  'AIR_Product',
			    'limited':  35000,
			    'currentsale':  3000,
			    'salesleft':  0.30,
			    'sale':  false
		    };

			 // Create Product
		    AdBrixRmCommerceProductModel adBrixRmCommerceProductModel1 =
			    AdBrixRmCommerceProductModel.create(
				    productId:  'myproductId',
				    productName:  'productNametest',
				    price:  1000000.0,
				    discount:  250000.0,
				    quantity:  1,
				    currency:  AdBrixCurrency.KR_KRW,
				    category:  AdBrixRmCommerceCategoryModel.create(
				    category1:  'categoryTest1'),
				    productAttr: prooductproperties);

		    AdBrixRmCommerceProductModel adBrixRmCommerceProductModel2 =
			    AdBrixRmCommerceProductModel.create(
				    productId:  'productID 2',
				    productName: productName2',
				    price:  15000.0,
				    discount:  2500.0,
				    quantity:  3,
				    currency:  AdBrixCurrency.KR_KRW,
				    category:  AdBrixRmCommerceCategoryModel.create(category1:  'categoryTest1'));

	      	 // Make a List for ProductModel
		    List<AdBrixRmCommerceProductModel> productlist = List<AdBrixRmCommerceProductModel>();
		    productlist.add(adBrixRmCommerceProductModel1);
		    productlist.add(adBrixRmCommerceProductModel2);

	    	 //set Addtional Event Value (Optional)
			 //Note : Don't use capital letter or special characters on Key String.
		    Map<String,  dynamic> eventproperties =  <String,  dynamic>{
			    'local':  'Seoul',
			    'age':  36,
			    'height':  180.50,

			 };

			// Make CategoryList for catagoryView Event
			 AdBrixRmCommerceCategoryModel eventCategoryModel = AdBrixRmCommerceCategoryModel.create(
				category1:  'eventcategory1',
				category2:  'eventcategory2',
				category3:  'eventcategory3',
				category4:  'eventCategory4',
				category5:  'eventCategory5');

		    AdBrixRm.commerceCategoryView(
			    categoryModel: eventCategoryModel,
			    productList: productlist,
			    attr: eventproperties);
	    }

 - productView

	    void  productView()  {

		    // Set Product
		    // product info (Optional)
		    // Note : Don't use capital letter or special characters on Key String.
		    Map<String,  dynamic> productInfo=  <String,  dynamic>{
			    'productbrand':  'AIR_Product',
			    'limited':  35000,
			    'currentsale':  3000,
			    'salesleft':  0.30,
			    'sale':  false
		    };

			 // Create Product
		    AdBrixRmCommerceProductModel adBrixRmCommerceProductModel1 =
			    AdBrixRmCommerceProductModel.create(
				    productId:  'myproductId',
				    productName:  'productNametest',
				    price:  1000000.0,
				    discount:  250000.0,
				    quantity:  1,
				    currency:  AdBrixCurrency.KR_KRW,
				    category:  AdBrixRmCommerceCategoryModel.create(
				    category1:  'categoryTest1'),
				    productAttr: prooductproperties);

	    	 //set Addtional Event Value (Optional)
			 //Note : Don't use capital letter or special characters on Key String.
		    Map<String,  dynamic> eventproperties =  <String,  dynamic>{
			    'local':  'Seoul',
			    'age':  36,
			    'height':  180.50,

			 };

		    AdBrixRm.commerceProductView(
				productModel: adBrixRmCommerceProductModel1,
			    attr: eventproperties);
	    }


 - addToCart

	    void  addToCart()  {

		    // Set Product
		    // product info (Optional)
		    // Note : Don't use capital letter or special characters on Key String.
		    Map<String,  dynamic> productInfo=  <String,  dynamic>{
			    'productbrand':  'AIR_Product',
			    'limited':  35000,
			    'currentsale':  3000,
			    'salesleft':  0.30,
			    'sale':  false
		    };

			 // Create Product
		    AdBrixRmCommerceProductModel adBrixRmCommerceProductModel1 =
			    AdBrixRmCommerceProductModel.create(
				    productId:  'myproductId',
				    productName:  'productNametest',
				    price:  1000000.0,
				    discount:  250000.0,
				    quantity:  1,
				    currency:  AdBrixCurrency.KR_KRW,
				    category:  AdBrixRmCommerceCategoryModel.create(
				    category1:  'categoryTest1'),
				    productAttr: prooductproperties);

		    AdBrixRmCommerceProductModel adBrixRmCommerceProductModel2 =
			    AdBrixRmCommerceProductModel.create(
				    productId:  'productID 2',
				    productName: productName2',
				    price:  15000.0,
				    discount:  2500.0,
				    quantity:  3,
				    currency:  AdBrixCurrency.KR_KRW,
				    category:  AdBrixRmCommerceCategoryModel.create(category1:  'categoryTest1'));

	      	 // Make a List for ProductModel
		    List<AdBrixRmCommerceProductModel> productlist = List<AdBrixRmCommerceProductModel>();
		    productlist.add(adBrixRmCommerceProductModel1);
		    productlist.add(adBrixRmCommerceProductModel2);

	    	 //set Addtional Event Value (Optional)
			 //Note : Don't use capital letter or special characters on Key String.
		    Map<String,  dynamic> eventproperties =  <String,  dynamic>{
			    'local':  'Seoul',
			    'age':  36,
			    'height':  180.50,

			 };

		    AdBrixRm.commerceAddToCart(productList: productlist, attr: eventproperties);
	    }

 - addToWishList

	    void  addToWishList()  {

		    // Set Product
		    // product info (Optional)
		    // Note : Don't use capital letter or special characters on Key String.
		    Map<String,  dynamic> productInfo=  <String,  dynamic>{
			    'productbrand':  'AIR_Product',
			    'limited':  35000,
			    'currentsale':  3000,
			    'salesleft':  0.30,
			    'sale':  false
		    };

			 // Create Product
		    AdBrixRmCommerceProductModel adBrixRmCommerceProductModel1 =
			    AdBrixRmCommerceProductModel.create(
				    productId:  'myproductId',
				    productName:  'productNametest',
				    price:  1000000.0,
				    discount:  250000.0,
				    quantity:  1,
				    currency:  AdBrixCurrency.KR_KRW,
				    category:  AdBrixRmCommerceCategoryModel.create(
				    category1:  'categoryTest1'),
				    productAttr: prooductproperties);

	    	 //set Addtional Event Value (Optional)
			 //Note : Don't use capital letter or special characters on Key String.
		    Map<String,  dynamic> eventproperties =  <String,  dynamic>{
			    'local':  'Seoul',
			    'age':  36,
			    'height':  180.50,

			 };

		    AdBrixRm.commerceAddToWishList(
				productModel: adBrixRmCommerceProductModel1,
			    attr: eventproperties);
	    }



 - reviewOrder

	    void  reviewOrder()  {

		    // Set Product
		    // product info (Optional)
		    // Note : Don't use capital letter or special characters on Key String.
		    Map<String,  dynamic> productInfo=  <String,  dynamic>{
			    'productbrand':  'AIR_Product',
			    'limited':  35000,
			    'currentsale':  3000,
			    'salesleft':  0.30,
			    'sale':  false
		    };

			 // Create Product
		    AdBrixRmCommerceProductModel adBrixRmCommerceProductModel1 =
			    AdBrixRmCommerceProductModel.create(
				    productId:  'myproductId',
				    productName:  'productNametest',
				    price:  1000000.0,
				    discount:  250000.0,
				    quantity:  1,
				    currency:  AdBrixCurrency.KR_KRW,
				    category:  AdBrixRmCommerceCategoryModel.create(
				    category1:  'categoryTest1'),
				    productAttr: prooductproperties);

		    AdBrixRmCommerceProductModel adBrixRmCommerceProductModel2 =
			    AdBrixRmCommerceProductModel.create(
				    productId:  'productID 2',
				    productName: productName2',
				    price:  15000.0,
				    discount:  2500.0,
				    quantity:  3,
				    currency:  AdBrixCurrency.KR_KRW,
				    category:  AdBrixRmCommerceCategoryModel.create(category1:  'categoryTest1'));

	      	 // Make a List for ProductModel
		    List<AdBrixRmCommerceProductModel> productlist = List<AdBrixRmCommerceProductModel>();
		    productlist.add(adBrixRmCommerceProductModel1);
		    productlist.add(adBrixRmCommerceProductModel2);

	    	 //set Addtional Event Value (Optional)
			 //Note : Don't use capital letter or special characters on Key String.
		    Map<String,  dynamic> eventproperties =  <String,  dynamic>{
			    'local':  'Seoul',
			    'age':  36,
			    'height':  180.50,

			 };

		    AdBrixRm.commerceReviewOrder(
			    orderId:  'myOrderID',
				productList: productlist,
				discount:  5000.0,
				deliveryCharge:  2500.0,
				attr: eventproperties);
	    }


 - refund

	    void  refund()  {

		    // Set Product
		    // product info (Optional)
		    // Note : Don't use capital letter or special characters on Key String.
		    Map<String,  dynamic> productInfo=  <String,  dynamic>{
			    'productbrand':  'AIR_Product',
			    'limited':  35000,
			    'currentsale':  3000,
			    'salesleft':  0.30,
			    'sale':  false
		    };

			 // Create Product
		    AdBrixRmCommerceProductModel adBrixRmCommerceProductModel1 =
			    AdBrixRmCommerceProductModel.create(
				    productId:  'myproductId',
				    productName:  'productNametest',
				    price:  1000000.0,
				    discount:  250000.0,
				    quantity:  1,
				    currency:  AdBrixCurrency.KR_KRW,
				    category:  AdBrixRmCommerceCategoryModel.create(
				    category1:  'categoryTest1'),
				    productAttr: prooductproperties);

		    AdBrixRmCommerceProductModel adBrixRmCommerceProductModel2 =
			    AdBrixRmCommerceProductModel.create(
				    productId:  'productID 2',
				    productName: productName2',
				    price:  15000.0,
				    discount:  2500.0,
				    quantity:  3,
				    currency:  AdBrixCurrency.KR_KRW,
				    category:  AdBrixRmCommerceCategoryModel.create(category1:  'categoryTest1'));

	      	 // Make a List for ProductModel
		    List<AdBrixRmCommerceProductModel> productlist = List<AdBrixRmCommerceProductModel>();
		    productlist.add(adBrixRmCommerceProductModel1);
		    productlist.add(adBrixRmCommerceProductModel2);

	    	 //set Addtional Event Value (Optional)
			 //Note : Don't use capital letter or special characters on Key String.
		    Map<String,  dynamic> eventproperties =  <String,  dynamic>{
			    'local':  'Seoul',
			    'age':  36,
			    'height':  180.50,

			 };

		    AdBrixRm.commerceRefund(
			    orderId:  'myOrderID',
				productList: productlist,
				penaltyCharge:  5000.0,
				attr: eventproperties);
	    }


 - search

 	    void  search()  {

		    // Set Product
		    // product info (Optional)
		    // Note : Don't use capital letter or special characters on Key String.
		    Map<String,  dynamic> productInfo=  <String,  dynamic>{
			    'productbrand':  'AIR_Product',
			    'limited':  35000,
			    'currentsale':  3000,
			    'salesleft':  0.30,
			    'sale':  false
		    };

			 // Create Product
		    AdBrixRmCommerceProductModel adBrixRmCommerceProductModel1 =
			    AdBrixRmCommerceProductModel.create(
				    productId:  'myproductId',
				    productName:  'productNametest',
				    price:  1000000.0,
				    discount:  250000.0,
				    quantity:  1,
				    currency:  AdBrixCurrency.KR_KRW,
				    category:  AdBrixRmCommerceCategoryModel.create(
				    category1:  'categoryTest1'),
				    productAttr: prooductproperties);

		    AdBrixRmCommerceProductModel adBrixRmCommerceProductModel2 =
			    AdBrixRmCommerceProductModel.create(
				    productId:  'productID 2',
				    productName: productName2',
				    price:  15000.0,
				    discount:  2500.0,
				    quantity:  3,
				    currency:  AdBrixCurrency.KR_KRW,
				    category:  AdBrixRmCommerceCategoryModel.create(category1:  'categoryTest1'));

	      	 // Make a List for ProductModel
		    List<AdBrixRmCommerceProductModel> productlist = List<AdBrixRmCommerceProductModel>();
		    productlist.add(adBrixRmCommerceProductModel1);
		    productlist.add(adBrixRmCommerceProductModel2);

	    	 //set Addtional Event Value (Optional)
			 //Note : Don't use capital letter or special characters on Key String.
		    Map<String,  dynamic> eventproperties =  <String,  dynamic>{
			    'local':  'Seoul',
			    'age':  36,
			    'height':  180.50,

			 };

		    AdBrixRm.commerceSearch(keyword:  'searchKeyword', productList: productlist, attr: eventproperties);

 - share

	    void  share()  {

		    // Set Product
		    // product info (Optional)
		    // Note : Don't use capital letter or special characters on Key String.
		    Map<String,  dynamic> productInfo=  <String,  dynamic>{
			    'productbrand':  'AIR_Product',
			    'limited':  35000,
			    'currentsale':  3000,
			    'salesleft':  0.30,
			    'sale':  false
		    };

			 // Create Product
		    AdBrixRmCommerceProductModel adBrixRmCommerceProductModel1 =
			    AdBrixRmCommerceProductModel.create(
				    productId:  'myproductId',
				    productName:  'productNametest',
				    price:  1000000.0,
				    discount:  250000.0,
				    quantity:  1,
				    currency:  AdBrixCurrency.KR_KRW,
				    category:  AdBrixRmCommerceCategoryModel.create(
				    category1:  'categoryTest1'),
				    productAttr: prooductproperties);

	    	 //set Addtional Event Value (Optional)
			 //Note : Don't use capital letter or special characters on Key String.
		    Map<String,  dynamic> eventproperties =  <String,  dynamic>{
			    'local':  'Seoul',
			    'age':  36,
			    'height':  180.50,

			 };

		    AdBrixRm.commerceShare(
			    sharingChannel:  AdBrixSharingChannel.KAKAOSTORY,
				productModel: adBrixRmCommerceProductModel1,
			    attr: eventproperties);
	    }



 - listView

	    void  listView()  {

		    // Set Product
		    // product info (Optional)
		    // Note : Don't use capital letter or special characters on Key String.
		    Map<String,  dynamic> productInfo=  <String,  dynamic>{
			    'productbrand':  'AIR_Product',
			    'limited':  35000,
			    'currentsale':  3000,
			    'salesleft':  0.30,
			    'sale':  false
		    };

			 // Create Product
		    AdBrixRmCommerceProductModel adBrixRmCommerceProductModel1 =
			    AdBrixRmCommerceProductModel.create(
				    productId:  'myproductId',
				    productName:  'productNametest',
				    price:  1000000.0,
				    discount:  250000.0,
				    quantity:  1,
				    currency:  AdBrixCurrency.KR_KRW,
				    category:  AdBrixRmCommerceCategoryModel.create(
				    category1:  'categoryTest1'),
				    productAttr: prooductproperties);

		    AdBrixRmCommerceProductModel adBrixRmCommerceProductModel2 =
			    AdBrixRmCommerceProductModel.create(
				    productId:  'productID 2',
				    productName: productName2',
				    price:  15000.0,
				    discount:  2500.0,
				    quantity:  3,
				    currency:  AdBrixCurrency.KR_KRW,
				    category:  AdBrixRmCommerceCategoryModel.create(category1:  'categoryTest1'));

	      	 // Make a List for ProductModel
		    List<AdBrixRmCommerceProductModel> productlist = List<AdBrixRmCommerceProductModel>();
		    productlist.add(adBrixRmCommerceProductModel1);
		    productlist.add(adBrixRmCommerceProductModel2);

	    	 //set Addtional Event Value (Optional)
			 //Note : Don't use capital letter or special characters on Key String.
		    Map<String,  dynamic> eventproperties =  <String,  dynamic>{
			    'local':  'Seoul',
			    'age':  36,
			    'height':  180.50,

			 };

		    AdBrixRm.commerceListView(productList: productlist, attr: eventproperties);
	    }
 - cartView

 	    void  cartView()  {

		    // Set Product
		    // product info (Optional)
		    // Note : Don't use capital letter or special characters on Key String.
		    Map<String,  dynamic> productInfo=  <String,  dynamic>{
			    'productbrand':  'AIR_Product',
			    'limited':  35000,
			    'currentsale':  3000,
			    'salesleft':  0.30,
			    'sale':  false
		    };

			 // Create Product
		    AdBrixRmCommerceProductModel adBrixRmCommerceProductModel1 =
			    AdBrixRmCommerceProductModel.create(
				    productId:  'myproductId',
				    productName:  'productNametest',
				    price:  1000000.0,
				    discount:  250000.0,
				    quantity:  1,
				    currency:  AdBrixCurrency.KR_KRW,
				    category:  AdBrixRmCommerceCategoryModel.create(
				    category1:  'categoryTest1'),
				    productAttr: prooductproperties);

		    AdBrixRmCommerceProductModel adBrixRmCommerceProductModel2 =
			    AdBrixRmCommerceProductModel.create(
				    productId:  'productID 2',
				    productName: productName2',
				    price:  15000.0,
				    discount:  2500.0,
				    quantity:  3,
				    currency:  AdBrixCurrency.KR_KRW,
				    category:  AdBrixRmCommerceCategoryModel.create(category1:  'categoryTest1'));

	      	 // Make a List for ProductModel
		    List<AdBrixRmCommerceProductModel> productlist = List<AdBrixRmCommerceProductModel>();
		    productlist.add(adBrixRmCommerceProductModel1);
		    productlist.add(adBrixRmCommerceProductModel2);

	    	 //set Addtional Event Value (Optional)
			 //Note : Don't use capital letter or special characters on Key String.
		    Map<String,  dynamic> eventproperties =  <String,  dynamic>{
			    'local':  'Seoul',
			    'age':  36,
			    'height':  180.50,

			 };

		    AdBrixRm.cartView(productList: productlist, attr: eventproperties);
	    }
 - paymentInfoAdded

	    void paymentInfoAdded () {

	     //set Addtional Event Value (Optional)
		 //Note : Don't use capital letter or special characters on Key String.
		 Map<String,  dynamic> eventproperties =  <String,  dynamic>{
		    'local':  'Seoul',
		    'age':  36,
		    'height':  180.50,

		};
		 AdBrixRm.commercePaymentInfoAdd(attr: eventproperties);
		}

#### Game Event

 - tutorialCompleted

	     void  tutorialCompleted()  {

	    	 // set Addtional Event Value (Optional)
			 // Note : Don't use capital letter or special characters on Key String.
			 Map<String,  dynamic> eventproperties =  <String,  dynamic>{
			    'local':  'Seoul',
			    'age':  36,
			    'height':  180.50,

			};

			AdBrixRm.gameTutorialComplete(isSkip:  true, attr: eventproperties);

		}


 - characterCreated

 	     void  characterCreated()  {

    	     // set Addtional Event Value (Optional)
			 // Note : Don't use capital letter or special characters on Key String.
			 Map<String,  dynamic> eventproperties =  <String,  dynamic>{
			    'local':  'Seoul',
			    'caractername' : 'myCharacterName',
			    'age':  36,
			    'height':  180.50,

			};

			AdBrixRm.gameCharacterCreated(attr: eventproperties);

		}

 - stageCleared

 	     void  stageCleared()  {

    	    // set Addtional Event Value (Optional)
			 // Note : Don't use capital letter or special characters on Key String.
			 Map<String,  dynamic> eventproperties =  <String,  dynamic>{
			    'local':  'Seoul',
			    'age':  36,
			    'height':  180.50,

			};

			AdBrixRm.gameStageCleared(stageName:'11-5', attr: eventproperties);

		}
 - levelAchieved

 	     void  levelAchieved()  {

    	    // set Addtional Event Value (Optional)
			 // Note : Don't use capital letter or special characters on Key String.
			 Map<String,  dynamic> eventproperties =  <String,  dynamic>{
			    'local':  'Seoul',
			    'age':  36,
			    'height':  180.50,

			};

			AdBrixRm.gameLevelAchieved(levelAchieved:33, attr: eventproperties);

		}