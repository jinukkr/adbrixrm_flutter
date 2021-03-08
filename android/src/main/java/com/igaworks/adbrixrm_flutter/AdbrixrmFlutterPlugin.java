package com.igaworks.adbrixrm_flutter;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.os.Bundle;

import androidx.annotation.NonNull;

import com.igaworks.v2.abxExtensionApi.AbxCommerce;
import com.igaworks.v2.abxExtensionApi.AbxCommon;
import com.igaworks.v2.abxExtensionApi.AbxGame;
import com.igaworks.v2.core.AdBrixRm;
import com.igaworks.v2.core.application.AbxActivityHelper;

import java.util.ArrayList;
import java.util.HashMap;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** AdbrixrmflutterPlugin */
public class AdbrixrmFlutterPlugin implements FlutterPlugin, ActivityAware, MethodCallHandler, AdBrixRm.DeferredDeeplinkListener, AdBrixRm.DeeplinkListener {

  private String myDeferredDeeplink;
  private String myDeeplink;
  private Context context;
  private Activity activity;
  private MethodChannel channel;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "adbrixrm_flutter");
    channel.setMethodCallHandler(this);

    context = flutterPluginBinding.getApplicationContext();

  }
  
  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {

    String method = call.method;

    switch (method) {

      case "sdkInit":
        sdkInit(call, result);
        break;

      case "adbrixDeferredDeeplink" :
        adbrixDeferredDeeplink(result);
        break;

      case "adbrixDeeplink" :
        adbrixDeeplink(result);
        break;

      case "setLogLevel":
        setLogLevel(call, result);
        break;

      case "setEventUploadCountInterval":
        setEventUploadCountInterval(call, result);
        break;

      case "setEventUploadTimeInterval":
        setEventUploadTimeInterval(call, result);
        break;

      case "gdprForgetMe":
        gdprForgetMe(result);
        break;

      case "setAge":
        setAge(call, result);
        break;

      case "setGender":
        setGender(call, result);
        break;

      case "setUserProperties":
        setUserProperties(call, result);
        break;

      case "events":
        events(call, result);
        break;

      case "login":
        login(call, result);
        break;

      case "commonSignUp":
        commonSignUp(call, result);
        break;

      case "appUpdate":
        appUpdate(call, result);
        break;

      case "userInvite":
        userInvite(call, result);
        break;

      case "useCredit":
        useCredit(call, result);
        break;

      case "commonPurchase":
        commonPurchase(call, result);
        break;

      case "gameTutorialComplete":
        gameTutorialComplete(call, result);
        break;

      case "gameCharacterCreated":
        gameCharacterCreated(call, result);
        break;

      case "gameStageCleared":
        gameStageCleared(call, result);
        break;

      case "gameLevelAchieved":
        gameLevelAchieved(call, result);
        break;

      case "commerceViewHome":
        commerceViewHome(result);
        break;

      case "commerceProductView":
        commerceProductView(call, result);
        break;

      case "commerceAddToWishList":
        commerceAddToWishList(call, result);
        break;

      case "commerceShare":
        commerceShare(call, result);
        break;

      case "commercePaymentInfoAdd":
        commercePaymentInfoAdd(call, result);
        break;

      case "commerceCategoryView":
        commerceCategoryView(call, result);
        break;

      case "commerceAddToCart":
        commerceAddToCart(call, result);
        break;

      case "commerceReviewOrder":
        commerceReviewOrder(call, result);
        break;

      case "commerceRefund":
        commerceRefund(call, result);
        break;

      case "commerceSearch":
        commerceSearch(call, result);
        break;

      case "commerceListView":
        commerceListView(call, result);
        break;

      case "commerceCartView":
        commerceCartView(call, result);
        break;
        
      case "logout":
        logout(call, result);
        break;
    }
  }

  private void sdkInit(MethodCall call, Result result) {

    String AppKey = call.argument("AppKey");
    String SecretKey = call.argument("SecretKey");
    AbxActivityHelper.initializeSdk(context, AppKey, SecretKey);
    AbxActivityHelper.onResume(activity);
    registerLifeCycle();
    AdBrixRm.setDeferredDeeplinkListener(this);
    AdBrixRm.setDeeplinkListener(this);
    AdBrixRm.deeplinkEvent(activity);


    result.success(null);
  }

  public void registerLifeCycle(){
    activity.getApplication().registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
      @Override
      public void onActivityCreated(Activity activity, Bundle bundle) {

      }

      @Override
      public void onActivityStarted(Activity activity) {

      }

      @Override
      public void onActivityResumed(Activity activity) {

        AbxActivityHelper.onResume(activity);
        AdBrixRm.deeplinkEvent(activity);

      }

      @Override
      public void onActivityPaused(Activity activity) {

        AbxActivityHelper.onPause(activity);

      }

      @Override
      public void onActivityStopped(Activity activity) {

      }

      @Override
      public void onActivitySaveInstanceState(Activity activity, Bundle bundle) {

      }

      @Override
      public void onActivityDestroyed(Activity activity) {

      }
    });

  }

  private void adbrixDeferredDeeplink(Result result) {

    if (myDeferredDeeplink != null) {

      result.success(myDeferredDeeplink);

    }
  }

  private void adbrixDeeplink(Result result) {
    if (myDeeplink != null) {
      result.success(myDeeplink);
    }
  }

  private void setEventUploadCountInterval(MethodCall call, Result result) {

    String intervalCounter = call.arguments();
    AdBrixRm.setEventUploadCountInterval(AdBrixRm.AdBrixEventUploadCountInterval.valueOf(intervalCounter));

    result.success(null);
  }

  private void setEventUploadTimeInterval(MethodCall call, Result result) {

    String interTimer = call.arguments();
    AdBrixRm.setEventUploadTimeInterval(AdBrixRm.AdBrixEventUploadTimeInterval.valueOf(interTimer));

    result.success(null);
  }

  private void setLogLevel(MethodCall call, Result result) {

    String logLevel = call.arguments();
    AdBrixRm.setLogLevel(AdBrixRm.AdBrixLogLevel.valueOf(logLevel));

    result.success(null);
  }

  private void gdprForgetMe(Result result) {

    AdBrixRm.gdprForgetMe(context);

    result.success(null);
  }

  private void setAge(MethodCall call, Result result) {

    int age = call.arguments();
    AdBrixRm.setAge(age);

    result.success(null);
  }

  private void setGender(MethodCall call, Result result) {

    String gender = call.arguments();
    AdBrixRm.setGender(AdBrixRm.AbxGender.valueOf(gender));

    result.success(null);

  }

  private void setUserProperties(MethodCall call, Result result) {

    HashMap<String, Object> properties = call.arguments();
    AdBrixRm.UserProperties userProperties = AdbrixUtility.makeUserProperties(properties);
    AdBrixRm.saveUserProperties(userProperties);

    result.success(null);
  }

  private void events(MethodCall call, Result result) {

    String eventName = call.argument("eventName");
    HashMap<String, Object> attr = call.argument("attr");

    if (attr != null) {
      AdBrixRm.AttrModel eventAttr = AdbrixUtility.makeAttrModel(attr);
      AdBrixRm.event(eventName, eventAttr);

    } else {
      AdBrixRm.event(eventName);

    }

    result.success(null);
  }

  private void login(MethodCall call, Result result) {

    String userId = call.argument("userId");
    AdBrixRm.login(userId);

    result.success(null);
  }
  
  private void logout(MethodCall call, Result result){
    AdBrixRm.logout();
    
    result.success(null);
  }

  private void commonSignUp(MethodCall call, Result result) {

    Integer channel = call.argument("channel");
    HashMap<String, Object> attr = call.argument("attr");

    if (channel != null) {

      if (attr != null) {
        AdBrixRm.AttrModel eventAttr = AdbrixUtility.makeAttrModel(attr);
        AdBrixRm.CommonProperties.SignUp signUpUserInfo = new AdBrixRm.CommonProperties.SignUp()
                .setAttrModel(eventAttr);
        AbxCommon.signUp(AdBrixRm.CommonSignUpChannel.getChannelByChannelCode(channel), signUpUserInfo);

      } else {
        AbxCommon.signUp(AdBrixRm.CommonSignUpChannel.getChannelByChannelCode(channel));

      }
    }

    result.success(null);
  }

  private void appUpdate(MethodCall call, Result result) {

    String preVersion = call.argument("preVersion");
    String currVersion = call.argument("currVersion");
    HashMap<String, Object> attr = call.argument("attr");

    if (attr != null) {
      AdBrixRm.AttrModel eventAttr = AdbrixUtility.makeAttrModel(attr);
      AdBrixRm.CommonProperties.AppUpdate updateInfo = new AdBrixRm.CommonProperties.AppUpdate()
              .setPrevVersion(preVersion)
              .setCurrVersion(currVersion)
              .setAttrModel(eventAttr);
      AbxCommon.appUpdate(updateInfo);

    } else {
      AdBrixRm.CommonProperties.AppUpdate updateInfo = new AdBrixRm.CommonProperties.AppUpdate()
              .setPrevVersion(preVersion)
              .setCurrVersion(currVersion);
      AbxCommon.appUpdate(updateInfo);

    }

    result.success(null);
  }

  private void userInvite(MethodCall call, Result result) {

    Integer inviteChannel = call.argument("inviteChannel");
    HashMap<String, Object> attr = call.argument("attr");

    if (inviteChannel != null) {

      if (attr != null) {
        AdBrixRm.AttrModel eventAttr = AdbrixUtility.makeAttrModel(attr);
        AdBrixRm.CommonProperties.Invite inviteInfo = new AdBrixRm.CommonProperties.Invite()
                .setAttrModel(eventAttr);
        AbxCommon.invite(AdBrixRm.CommonInviteChannel.getChannelByChannelCode(inviteChannel), inviteInfo);

      } else {
        AbxCommon.invite(AdBrixRm.CommonInviteChannel.getChannelByChannelCode(inviteChannel));

      }

    }

    result.success(null);
  }

  private void useCredit(MethodCall call, Result result) {

    HashMap<String, Object> attr = call.argument("attr");

    if (attr != null) {
      AdBrixRm.AttrModel eventAttr = AdbrixUtility.makeAttrModel(attr);
      AdBrixRm.CommonProperties.UseCredit useCreditInfo = new AdBrixRm.CommonProperties.UseCredit()
              .setAttrModel(eventAttr);
      AbxCommon.useCredit(useCreditInfo);

    } else {
      AbxCommon.useCredit();

    }

    result.success(null);
  }

  private void gameTutorialComplete(MethodCall call, Result result) {

    Boolean isSkip = call.argument("isSkip");
    HashMap<String, Object> attr = call.argument("attr");

    if (isSkip != null) {

      if (attr != null) {
        AdBrixRm.AttrModel eventAttr = AdbrixUtility.makeAttrModel(attr);
        AdBrixRm.GameProperties.TutorialComplete gameProperties = new AdBrixRm.GameProperties.TutorialComplete()
                .setIsSkip(isSkip)
                .setAttrModel(eventAttr);
        AbxGame.tutorialComplete(gameProperties);

      } else {
        AdBrixRm.GameProperties.TutorialComplete gameProperties = new AdBrixRm.GameProperties.TutorialComplete()
                .setIsSkip(isSkip);
        AbxGame.tutorialComplete(gameProperties);

      }

    }

    result.success(null);
  }

  private void gameCharacterCreated(MethodCall call, Result result) {

    HashMap<String, Object> attr = call.argument("attr");

    if (attr != null) {
      AdBrixRm.AttrModel eventAttr = AdbrixUtility.makeAttrModel(attr);
      AdBrixRm.GameProperties.CharacterCreated gameProperties = new AdBrixRm.GameProperties.CharacterCreated()
              .setAttrModel(eventAttr);
      AbxGame.characterCreated(gameProperties);

    } else {
      AbxGame.characterCreated();

    }

    result.success(null);
  }

  private void gameStageCleared(MethodCall call, Result result) {

    String stageName = call.argument("stageName");
    HashMap<String, Object> attr = call.argument("attr");

    if (stageName != null) {

      if (attr != null) {
        AdBrixRm.AttrModel eventAttr = AdbrixUtility.makeAttrModel(attr);
        AdBrixRm.GameProperties.StageCleared gameProperties = new AdBrixRm.GameProperties.StageCleared()
                .setStageName(stageName)
                .setAttrModel(eventAttr);
        AbxGame.stageCleared(gameProperties);

      } else {
        AdBrixRm.GameProperties.StageCleared gameProperties = new AdBrixRm.GameProperties.StageCleared()
                .setStageName(stageName);
        AbxGame.stageCleared(gameProperties);

      }

    }

    result.success(null);
  }

  private void gameLevelAchieved(MethodCall call, Result result) {

    Integer levelAchieved = call.argument("levelAchieved");
    HashMap<String, Object> attr = call.argument("attr");

    if (levelAchieved != null) {

      if (attr != null) {
        AdBrixRm.AttrModel eventAttr = AdbrixUtility.makeAttrModel(attr);
        AdBrixRm.GameProperties.LevelAchieved gameProperties = new AdBrixRm.GameProperties.LevelAchieved()
                .setLevel(levelAchieved)
                .setAttrModel(eventAttr);
        AbxGame.levelAchieved(gameProperties);

      } else {
        AdBrixRm.GameProperties.LevelAchieved gameProperties = new AdBrixRm.GameProperties.LevelAchieved()
                .setLevel(levelAchieved);
        AbxGame.levelAchieved(gameProperties);

      }

    }

    result.success(null);
  }

  private void commerceViewHome(Result result) {

    AbxCommerce.viewHome();

    result.success(null);
  }

  private void commerceProductView(MethodCall call, Result result) {

    HashMap<String, Object> productModel = call.argument("productModel");
    HashMap<String, Object> attr = call.argument("attr");

    if (productModel != null) {
      AdBrixRm.CommerceProductModel userProduct = AdbrixUtility.makeProductModel(productModel);

      if (attr != null) {
        AdBrixRm.AttrModel eventAttr = AdbrixUtility.makeAttrModel(attr);
        AbxCommerce.productView(userProduct, eventAttr);

      } else {
        AbxCommerce.productView(userProduct);
      }

    }

    result.success(null);
  }

  private void commerceAddToWishList(MethodCall call, Result result) {

    HashMap<String, Object> productModel = call.argument("productModel");
    HashMap<String, Object> attr = call.argument("attr");

    if (productModel != null) {
      AdBrixRm.CommerceProductModel userProduct = AdbrixUtility.makeProductModel(productModel);

      if (attr != null) {
        AdBrixRm.AttrModel eventAttr = AdbrixUtility.makeAttrModel(attr);
        AbxCommerce.addToWishList(userProduct, eventAttr);

      } else {
        AbxCommerce.addToWishList(userProduct);
      }

    }

    result.success(null);
  }

  private void commerceShare(MethodCall call, Result result) {

    HashMap<String, Object> productModel = call.argument("productModel");
    HashMap<String, Object> attr = call.argument("attr");
    String sharingChannel = call.argument("sharingChannel");

    if (productModel != null && sharingChannel != null) {
      AdBrixRm.CommerceProductModel userProduct = AdbrixUtility.makeProductModel(productModel);

      if (attr != null) {
        AdBrixRm.AttrModel eventAttr = AdbrixUtility.makeAttrModel(attr);
        AbxCommerce.share(AdBrixRm.CommerceSharingChannel.getChannelByChannelCode(sharingChannel), userProduct, eventAttr);

      } else {
        AbxCommerce.share(AdBrixRm.CommerceSharingChannel.getChannelByChannelCode(sharingChannel), userProduct);
      }

    }

    result.success(null);
  }

  private void commercePaymentInfoAdd(MethodCall call, Result result) {

    HashMap<String, Object> attr = call.argument("attr");

    if (attr != null) {
      AdBrixRm.AttrModel eventAttr = AdbrixUtility.makeAttrModel(attr);
      AbxCommerce.paymentInfoAdded(eventAttr);

    } else {
      AbxCommerce.paymentInfoAdded();

    }

    result.success(null);
  }


  private void commonPurchase(MethodCall call, Result result) {

    String orderId = call.argument("orderId");
    ArrayList<HashMap<String, Object>> productList = call.argument("productList");
    Double discount = call.argument("discount");
    Double orderSale = call.argument("orderSale");
    Double deliveryCharge = call.argument("deliveryCharge");
    String paymentMethod = call.argument("paymentMethod");
    HashMap<String, Object> attr = call.argument("attr");

    if (productList != null && orderId != null && orderSale != null && discount != null && deliveryCharge != null && paymentMethod != null) {
      ArrayList<AdBrixRm.CommerceProductModel> productModelList = AdbrixUtility.makeProductList(productList);

      if (attr != null) {
        AdBrixRm.AttrModel evetAttr = AdbrixUtility.makeAttrModel(attr);
        AdBrixRm.CommonProperties.Purchase purchaseAttr = new AdBrixRm.CommonProperties.Purchase()
                .setAttrModel(evetAttr);
        AbxCommon.purchase(orderId,productModelList,orderSale,discount,deliveryCharge,AdBrixRm.CommercePaymentMethod.getMethodByMethodCode(paymentMethod),purchaseAttr);
      } else {
        AbxCommon.purchase(orderId,productModelList,orderSale,discount,deliveryCharge,AdBrixRm.CommercePaymentMethod.getMethodByMethodCode(paymentMethod));
      }
    }
    result.success(null);
  }

  private void commerceCategoryView(MethodCall call, Result result) {

    ArrayList<String> categoryModel = call.argument("categoryModel");
    ArrayList<HashMap<String, Object>> productList = call.argument("productList");
    HashMap<String, Object> attr = call.argument("attr");

    if (productList != null && categoryModel != null) {
      ArrayList<AdBrixRm.CommerceProductModel> productModelList = AdbrixUtility.makeProductList(productList);
      AdBrixRm.CommerceCategoriesModel categoriesModel = new AdBrixRm.CommerceCategoriesModel();

      for (int i = 0, n = categoryModel.size(); i < n; i++) {
        String categoryListName = categoryModel.get(i);
        categoriesModel.setCategory(categoryListName);

      }

      if (attr != null) {
        AdBrixRm.AttrModel evetAttr = AdbrixUtility.makeAttrModel(attr);
        AbxCommerce.categoryView(categoriesModel, productModelList, evetAttr);

      } else {
        AbxCommerce.categoryView(categoriesModel, productModelList);

      }
    }
    result.success(null);
  }

  private void commerceAddToCart(MethodCall call, Result result) {

    ArrayList<HashMap<String, Object>> productList = call.argument("productList");
    HashMap<String, Object> attr = call.argument("attr");

    if (productList != null) {
      ArrayList<AdBrixRm.CommerceProductModel> productModelList = AdbrixUtility.makeProductList(productList);

      if (attr != null) {
        AdBrixRm.AttrModel evetAttr = AdbrixUtility.makeAttrModel(attr);
        AbxCommerce.addToCart(productModelList, evetAttr);

      } else {
        AbxCommerce.addToCart(productModelList);

      }
    }
    result.success(null);
  }

  private void commerceReviewOrder(MethodCall call, Result result) {

    String orderId = call.argument("orderId");
    ArrayList<HashMap<String, Object>> productList = call.argument("productList");
    Double discount = call.argument("discount");
    Double deliveryCharge = call.argument("deliveryCharge");
    HashMap<String, Object> attr = call.argument("attr");

    if (productList != null && orderId != null && discount != null && deliveryCharge != null) {
      ArrayList<AdBrixRm.CommerceProductModel> productModelList = AdbrixUtility.makeProductList(productList);

      if (attr != null) {
        AdBrixRm.AttrModel evetAttr = AdbrixUtility.makeAttrModel(attr);
        AbxCommerce.reviewOrder(orderId, productModelList, discount, deliveryCharge, evetAttr);

      } else {
        AbxCommerce.reviewOrder(orderId, productModelList, discount, deliveryCharge);

      }
    }
    result.success(null);
  }

  private void commerceRefund(MethodCall call, Result result) {

    String orderId = call.argument("orderId");
    ArrayList<HashMap<String, Object>> productList = call.argument("productList");
    Double penaltyCharge = call.argument("penaltyCharge");
    HashMap<String, Object> attr = call.argument("attr");

    if (productList != null && orderId != null && penaltyCharge != null) {
      ArrayList<AdBrixRm.CommerceProductModel> productModelList = AdbrixUtility.makeProductList(productList);

      if (attr != null) {
        AdBrixRm.AttrModel evetAttr = AdbrixUtility.makeAttrModel(attr);
        AbxCommerce.refund(orderId, productModelList, penaltyCharge, evetAttr);

      } else {
        AbxCommerce.refund(orderId, productModelList, penaltyCharge);

      }
    }
    result.success(null);
  }

  private void commerceSearch(MethodCall call, Result result) {

    String keyword = call.argument("keyword");
    ArrayList<HashMap<String, Object>> productList = call.argument("productList");
    HashMap<String, Object> attr = call.argument("attr");

    if (productList != null && keyword != null) {
      ArrayList<AdBrixRm.CommerceProductModel> productModelList = AdbrixUtility.makeProductList(productList);

      if (attr != null) {
        AdBrixRm.AttrModel evetAttr = AdbrixUtility.makeAttrModel(attr);
        AbxCommerce.search(keyword, productModelList, evetAttr);

      } else {
        AbxCommerce.search(keyword, productModelList);

      }
    }
    result.success(null);
  }

  private void commerceListView(MethodCall call, Result result) {

    ArrayList<HashMap<String, Object>> productList = call.argument("productList");
    HashMap<String, Object> attr = call.argument("attr");

    if (productList != null) {
      ArrayList<AdBrixRm.CommerceProductModel> productModelList = AdbrixUtility.makeProductList(productList);

      if (attr != null) {
        AdBrixRm.AttrModel evetAttr = AdbrixUtility.makeAttrModel(attr);
        AbxCommerce.listView(productModelList, evetAttr);

      } else {
        AbxCommerce.listView(productModelList);

      }
    }
    result.success(null);
  }

  private void commerceCartView(MethodCall call, Result result) {

    ArrayList<HashMap<String, Object>> productList = call.argument("productList");
    HashMap<String, Object> attr = call.argument("attr");

    if (productList != null) {
      ArrayList<AdBrixRm.CommerceProductModel> productModelList = AdbrixUtility.makeProductList(productList);

      if (attr != null) {
        AdBrixRm.AttrModel evetAttr = AdbrixUtility.makeAttrModel(attr);
        AbxCommerce.cartView(productModelList, evetAttr);

      } else {
        AbxCommerce.cartView(productModelList);

      }
    }
    result.success(null);
  }

  @Override
  public void onReceiveDeferredDeeplink(String deeplink) {

    if (deeplink != null) {
      myDeferredDeeplink = deeplink;
    }

  }

  @Override
  public void onReceivedDeeplink(String deeplink) {

    if (deeplink != null) {
      myDeeplink = deeplink;

    }

  }


  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }

  @Override
  public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
    channel.setMethodCallHandler(this);
    activity = binding.getActivity();
  }

  @Override
  public void onDetachedFromActivityForConfigChanges() {

  }

  @Override
  public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {

  }

  @Override
  public void onDetachedFromActivity() {

  }

}
