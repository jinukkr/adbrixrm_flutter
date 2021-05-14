package com.igaworks.adbrixrm_flutter;

import android.util.Log;

import com.igaworks.v2.core.AdBrixRm;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;

public class AdbrixUtility {

    public static AdBrixRm.AttrModel makeAttrModel(HashMap<String, Object> attr) {

        AdBrixRm.AttrModel attrModel = new AdBrixRm.AttrModel();
        Set<HashMap.Entry<String, Object>> entries = attr.entrySet();

        for (HashMap.Entry<String, Object> entry : entries) {

            if (entry.getValue() instanceof String) {
                attrModel.setAttrs(entry.getKey(), entry.getValue().toString());

            } else if (entry.getValue() instanceof Integer) {
                Integer i = ((Integer) entry.getValue());
                Long intToLong = Long.valueOf(i);
                attrModel.setAttrs(entry.getKey(), intToLong);

            } else if (entry.getValue() instanceof Long) {
                attrModel.setAttrs(entry.getKey(), ((Long) entry.getValue()));

            } else if (entry.getValue() instanceof Double) {
                attrModel.setAttrs(entry.getKey(), ((Double) entry.getValue()));

            } else if (entry.getValue() instanceof Boolean) {
                attrModel.setAttrs(entry.getKey(), ((Boolean) entry.getValue()));

            } else {
                Log.d("Adbrix_QA", "Not_Matched_value::::::" + entry.getKey());

            }
        }
        return attrModel;
    }

    public static AdBrixRm.UserProperties makeUserProperties(HashMap<String, Object> attr) {

        AdBrixRm.UserProperties userProperties = new AdBrixRm.UserProperties();
        Set<HashMap.Entry<String, Object>> entries = attr.entrySet();

        for (HashMap.Entry<String, Object> entry : entries) {

            if (entry.getValue() instanceof String) {
                userProperties.setAttrs(entry.getKey(), entry.getValue().toString());

            } else if (entry.getValue() instanceof Integer) {
                Integer i = ((Integer) entry.getValue());
                Long intToLong = Long.valueOf(i);
                userProperties.setAttrs(entry.getKey(), intToLong);

            } else if (entry.getValue() instanceof Long) {
                userProperties.setAttrs(entry.getKey(), ((Long) entry.getValue()));

            } else if (entry.getValue() instanceof Double) {
                userProperties.setAttrs(entry.getKey(), ((Double) entry.getValue()));

            } else if (entry.getValue() instanceof Boolean) {
                userProperties.setAttrs(entry.getKey(), ((Boolean) entry.getValue()));

            } else {

                Log.d("Adbrix_QA", "Not_Matched_value:::::" + entry.getKey());
            }
        }
        return userProperties;
    }

    public static AdBrixRm.CiProperties makeCiProperties(HashMap<String, Object> attr) {

        AdBrixRm.CiProperties ciProperties = new AdBrixRm.CiProperties();
        Set<HashMap.Entry<String, Object>> entries = attr.entrySet();

        for (HashMap.Entry<String, Object> entry : entries) {

            if (entry.getValue() instanceof String) {
                ciProperties.setAttrs(entry.getKey(), entry.getValue().toString());

            } else if (entry.getValue() instanceof Integer) {
                Integer i = ((Integer) entry.getValue());
                Long intToLong = Long.valueOf(i);
                ciProperties.setAttrs(entry.getKey(), intToLong);

            } else if (entry.getValue() instanceof Long) {
                ciProperties.setAttrs(entry.getKey(), ((Long) entry.getValue()));

            } else if (entry.getValue() instanceof Double) {
                ciProperties.setAttrs(entry.getKey(), ((Double) entry.getValue()));

            } else if (entry.getValue() instanceof Boolean) {
                ciProperties.setAttrs(entry.getKey(), ((Boolean) entry.getValue()));

            } else {

                Log.d("Adbrix_QA", "Not_Matched_value:::::" + entry.getKey());
            }
        }
        return ciProperties;
    }

    public static AdBrixRm.CommerceProductModel makeProductModel(HashMap<String, Object> productModel) {

        AdBrixRm.CommerceProductModel makeProduct = new AdBrixRm.CommerceProductModel();
        Set<HashMap.Entry<String, Object>> entries = productModel.entrySet();

        for (HashMap.Entry<String, Object> entry : entries) {
            String productElement = entry.getKey();

            switch (productElement) {
                case "productId":
                    makeProduct.setProductID(entry.getValue().toString());
                    break;

                case "productName":
                    makeProduct.setProductName(entry.getValue().toString());
                    break;

                case "price":
                    makeProduct.setPrice((Double) entry.getValue());
                    break;

                case "discount":
                    makeProduct.setDiscount((Double) entry.getValue());
                    break;

                case "quantity":
                    makeProduct.setQuantity((Integer) entry.getValue());

                case "currency":
                    makeProduct.setCurrency(AdBrixRm.Currency.getCurrencyByCurrencyCode(entry.getValue().toString()));
                    break;

                case "category":
                    @SuppressWarnings("unchecked")
                    ArrayList<String> categoryList = (ArrayList<String>) entry.getValue();
                    AdBrixRm.CommerceCategoriesModel categoriesModel = new AdBrixRm.CommerceCategoriesModel();

                    for (int i = 0, n = categoryList.size(); i < n; i++) {
                        String categoryListName = categoryList.get(i);
                        categoriesModel.setCategory(categoryListName);

                    }

                    makeProduct.setCategory(categoriesModel);
                    break;

                case "productAttr":
                    @SuppressWarnings("unchecked")
                    AdBrixRm.AttrModel productAttr = AdbrixUtility.makeAttrModel((HashMap<String, Object>) entry.getValue());
                    makeProduct.setAttrModel(productAttr);
                    break;

            }
        }
        return makeProduct;
    }

    public static ArrayList<AdBrixRm.CommerceProductModel> makeProductList(ArrayList<HashMap<String, Object>> productList) {

        ArrayList<AdBrixRm.CommerceProductModel> myProductList = new ArrayList<>();
        for (int i = 0, n = productList.size(); i < n; i++) {

            HashMap<String, Object> product = productList.get(i);

            AdBrixRm.CommerceProductModel myProductModel = makeProductModel(product);
            myProductList.add(myProductModel);

        }
        return myProductList;
    }
}
