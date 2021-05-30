package com.igaworks.adbrixrm_flutter;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.os.Bundle;
import android.util.Log;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.igaworks.v2.core.AbxCommerce;
import com.igaworks.v2.core.AbxCommon;
import com.igaworks.v2.core.AbxGame;
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

/**
 * AdbrixrmflutterPlugin
 */
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
                sdkInit(call);
                break;

            case "adbrixDeferredDeeplink":
                adbrixDeferredDeeplink(myDeferredDeeplink, result);
                break;

            case "adbrixDeeplink":
                adbrixDeeplink(myDeeplink, result);
                break;

            case "setEventUploadCountInterval":
                setEventUploadCountInterval(call);
                break;

            case "setEventUploadTimeInterval":
                setEventUploadTimeInterval(call);
                break;

            case "gdprForgetMe":
                gdprForgetMe();
                break;

            case "setAge":
                setAge(call);
                break;

            case "setGender":
                setGender(call);
                break;

            case "setUserProperties":
                setUserProperties(call);
                break;

            case "events":
                events(call);
                break;

            case "login":
                login(call);
                break;

            case "commonSignUp":
                commonSignUp(call);
                break;

            case "appUpdate":
                appUpdate(call);
                break;

            case "userInvite":
                userInvite(call);
                break;

            case "useCredit":
                useCredit(call);
                break;

            case "commonPurchase":
                commonPurchase(call);
                break;

            case "gameTutorialComplete":
                gameTutorialComplete(call);
                break;

            case "gameCharacterCreated":
                gameCharacterCreated(call);
                break;

            case "gameStageCleared":
                gameStageCleared(call);
                break;

            case "gameLevelAchieved":
                gameLevelAchieved(call);
                break;

            case "commerceViewHome":
                commerceViewHome();
                break;

            case "commerceProductView":
                commerceProductView(call);
                break;

            case "commerceAddToWishList":
                commerceAddToWishList(call);
                break;

            case "commerceShare":
                commerceShare(call);
                break;

            case "commercePaymentInfoAdd":
                commercePaymentInfoAdd(call);
                break;

            case "commerceCategoryView":
                commerceCategoryView(call);
                break;

            case "commerceAddToCart":
                commerceAddToCart(call);
                break;

            case "commerceReviewOrder":
                commerceReviewOrder(call);
                break;

            case "commerceRefund":
                commerceRefund(call);
                break;

            case "commerceSearch":
                commerceSearch(call);
                break;

            case "commerceListView":
                commerceListView(call);
                break;

            case "commerceCartView":
                commerceCartView(call);
                break;

            case "logout":
                logout();
                break;

            case "setKakaoId":
                setKakaoId(call);
                break;

            case "setCiProperties":
                setCiProperties(call);
                break;
        }
    }

    private void sdkInit(MethodCall call) {

        String AppKey = call.argument("AppKey");
        String SecretKey = call.argument("SecretKey");
        AbxActivityHelper.initializeSdk(context, AppKey, SecretKey);
        AdBrixRm.onResume(activity);
        registerLifeCycle();
        AdBrixRm.setDeferredDeeplinkListener(this);
        AdBrixRm.setDeeplinkListener(this);
        AdBrixRm.deeplinkEvent(activity);

    }

    public void registerLifeCycle() {
        activity.getApplication().registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            @Override
            public void onActivityCreated(@NonNull Activity activity, @Nullable Bundle savedInstanceState) {

            }

            @Override
            public void onActivityStarted(@NonNull Activity activity) {

            }

            @Override
            public void onActivityResumed(@NonNull Activity activity) {

                AdBrixRm.onResume(activity);
                AdBrixRm.deeplinkEvent(activity);


            }

            @Override
            public void onActivityPaused(@NonNull Activity activity) {
                AdBrixRm.onPause();


            }

            @Override
            public void onActivityStopped(@NonNull Activity activity) {

            }

            @Override
            public void onActivitySaveInstanceState(@NonNull Activity activity, @NonNull Bundle outState) {

            }

            @Override
            public void onActivityDestroyed(@NonNull Activity activity) {

            }

        });

    }

    private void adbrixDeferredDeeplink(String deferredDeeplink, Result result) {

        if (deferredDeeplink != null){
            result.success(deferredDeeplink);
            myDeferredDeeplink = null;
        } else {
            result.success(null);
        }
    }

    private void adbrixDeeplink(String depplink, Result result) {

        if (depplink != null) {
            result.success(depplink);
            myDeeplink = null;
        } else {
            result.success(null);
        }
    }

    private void setEventUploadCountInterval(MethodCall call) {

        String intervalCounter = call.arguments();
        AdBrixRm.setEventUploadCountInterval(AdBrixRm.AdBrixEventUploadCountInterval.valueOf(intervalCounter));
    }

    private void setEventUploadTimeInterval(MethodCall call) {

        String interTimer = call.arguments();
        AdBrixRm.setEventUploadTimeInterval(AdBrixRm.AdBrixEventUploadTimeInterval.valueOf(interTimer));
    }


    private void gdprForgetMe() {

        AdBrixRm.gdprForgetMe(context);

    }

    private void setAge(MethodCall call) {

        int age = call.arguments();
        AdBrixRm.setAge(age);
    }

    private void setGender(MethodCall call) {

        String gender = call.arguments();
        AdBrixRm.setGender(AdBrixRm.AbxGender.valueOf(gender));

    }

    private void setKakaoId(MethodCall call) {

        String kakaoId = call.arguments();
        AdBrixRm.setKakaoId(kakaoId);

    }

    private void setCiProperties(MethodCall call) {

        HashMap<String, Object> properties = call.arguments();
        AdBrixRm.CiProperties ciProperties = AdbrixUtility.makeCiProperties(properties);
        AdBrixRm.saveCiProperties(ciProperties);
    }

    private void setUserProperties(MethodCall call) {

        HashMap<String, Object> properties = call.arguments();
        AdBrixRm.UserProperties userProperties = AdbrixUtility.makeUserProperties(properties);
        AdBrixRm.saveUserProperties(userProperties);
    }

    private void events(MethodCall call) {

        String eventName = call.argument("eventName");
        HashMap<String, Object> attr = call.argument("attr");

        if (attr != null) {
            AdBrixRm.AttrModel eventAttr = AdbrixUtility.makeAttrModel(attr);
            AdBrixRm.event(eventName, eventAttr);

        } else {
            AdBrixRm.event(eventName);

        }
    }

    private void login(MethodCall call) {

        String userId = call.argument("userId");
        AdBrixRm.login(userId);
    }

    private void logout() {
        AdBrixRm.logout();
    }

    private void commonSignUp(MethodCall call) {

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
    }

    private void appUpdate(MethodCall call) {

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
    }

    private void userInvite(MethodCall call) {

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
    }

    private void useCredit(MethodCall call) {

        HashMap<String, Object> attr = call.argument("attr");

        if (attr != null) {
            AdBrixRm.AttrModel eventAttr = AdbrixUtility.makeAttrModel(attr);
            AdBrixRm.CommonProperties.UseCredit useCreditInfo = new AdBrixRm.CommonProperties.UseCredit()
                    .setAttrModel(eventAttr);
            AbxCommon.useCredit(useCreditInfo);

        } else {
            AbxCommon.useCredit();

        }
    }

    private void gameTutorialComplete(MethodCall call) {

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

    }

    private void gameCharacterCreated(MethodCall call) {

        HashMap<String, Object> attr = call.argument("attr");

        if (attr != null) {
            AdBrixRm.AttrModel eventAttr = AdbrixUtility.makeAttrModel(attr);
            AdBrixRm.GameProperties.CharacterCreated gameProperties = new AdBrixRm.GameProperties.CharacterCreated()
                    .setAttrModel(eventAttr);
            AbxGame.characterCreated(gameProperties);

        } else {
            AbxGame.characterCreated();

        }
    }

    private void gameStageCleared(MethodCall call) {

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

    }

    private void gameLevelAchieved(MethodCall call) {

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

    }

    private void commerceViewHome() {

        AbxCommerce.viewHome();
    }

    private void commerceProductView(MethodCall call) {

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

    }

    private void commerceAddToWishList(MethodCall call) {

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

    }

    private void commerceShare(MethodCall call) {

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

    }

    private void commercePaymentInfoAdd(MethodCall call) {

        HashMap<String, Object> attr = call.argument("attr");

        if (attr != null) {
            AdBrixRm.AttrModel eventAttr = AdbrixUtility.makeAttrModel(attr);
            AbxCommerce.paymentInfoAdded(eventAttr);

        } else {
            AbxCommerce.paymentInfoAdded();

        }

    }


    private void commonPurchase(MethodCall call) {

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
                AbxCommon.purchase(orderId, productModelList, orderSale, discount, deliveryCharge, AdBrixRm.CommercePaymentMethod.getMethodByMethodCode(paymentMethod), purchaseAttr);
            } else {
                AbxCommon.purchase(orderId, productModelList, orderSale, discount, deliveryCharge, AdBrixRm.CommercePaymentMethod.getMethodByMethodCode(paymentMethod));
            }
        }
    }

    private void commerceCategoryView(MethodCall call) {

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
    }

    private void commerceAddToCart(MethodCall call) {

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
    }

    private void commerceReviewOrder(MethodCall call) {

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
    }

    private void commerceRefund(MethodCall call) {

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
    }

    private void commerceSearch(MethodCall call) {

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
    }

    private void commerceListView(MethodCall call) {

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
    }

    private void commerceCartView(MethodCall call) {

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
    }

    @Override
    public void onReceiveDeferredDeeplink(String deeplink) {

        if (deeplink != null) {
            myDeferredDeeplink = deeplink;
        }

    }

    @Override
    public void onReceiveDeeplink(String deeplink) {

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
