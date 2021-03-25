//
//  AdBrixUtility.swift
//  adbrixrm_flutter
//
//  Created by Jin-uk Park on 2020/10/28.
//

import Foundation
import AdBrixRM

public class AdBrixUtility {
    
    public static func AdBrixRmAttrModelMakeAttrModel (attr : Dictionary <String, Any>) -> AdBrixRmAttrModel {
        
        let attrModel = AdBrixRmAttrModel()
        for (key, value) in attr {
            
            if ((value as? String) != nil) {
                
                if (value as! String == "true"){
                    attrModel.setAttrDataBool(key, true)
                } else if (value as! String == "false") {
                    attrModel.setAttrDataBool(key, false)
                } else {
                    attrModel.setAttrDataString(key, value as! String)
                }
                
            } else if ((value as? Int) != nil) {
                attrModel.setAttrDataInt(key, value as! Int)
                
            } else if ((value as? Int64) != nil) {
                attrModel.setAttrDataInt64(key, value as! Int64)
                
            } else if ((value as? Double) != nil) {
                attrModel.setAttrDataDouble(key, value as! Double)
                
            } else {
                print("Not_Matched_Value::::::" + key)
                
            }
        }
        return attrModel
        
    }

    
    public static func AdBrixRmMakeProductModel (productModel : Dictionary<String, Any>) -> AdBrixRmCommerceProductModel {
        
        let adBrix = AdBrixRM.getInstance
        var productId : String = "productId"
        var productName : String = "productName"
        var price : Double = 1.00
        var discount : Double = 1.00
        var quantity : Int = 1
        var currency : String = "krw"
        var category : Array<String>? = nil
        var productAttr : Dictionary<String, Any>? = nil
        var currencyName : String = "krw"
        var productValue : AdBrixRmCommerceProductModel? = nil
        
        for (key, value) in productModel {
            
            if key == "productId" {
                productId = value as! String
                
            } else if key == "productName" {
                productName = value as! String
                
            } else if key == "price" {
                price = value as! Double
                
            } else if key == "discount" {
                discount = value as! Double
                
            } else if key == "quantity" {
                quantity = value as! Int
                
            } else if key == "currency" {
                currency = value as! String
                
                switch currency {
                case "KR_KRW":
                    currencyName = adBrix.getCurrencyString(AdBrixRM.AdBrixRmCurrencyType.KRW.rawValue)
                case "US_USD":
                    currencyName = adBrix.getCurrencyString(AdBrixRM.AdBrixRmCurrencyType.USD.rawValue)
                case "JP_JPY":
                    currencyName = adBrix.getCurrencyString(AdBrixRM.AdBrixRmCurrencyType.JPY.rawValue)
                case "EU_EUR":
                    currencyName = adBrix.getCurrencyString(AdBrixRM.AdBrixRmCurrencyType.EUR.rawValue)
                case "UK_GBP":
                    currencyName = adBrix.getCurrencyString(AdBrixRM.AdBrixRmCurrencyType.GBP.rawValue)
                case "CH_CNY":
                    currencyName = adBrix.getCurrencyString(AdBrixRM.AdBrixRmCurrencyType.CNY.rawValue)
                case "TW_TWD":
                    currencyName = adBrix.getCurrencyString(AdBrixRM.AdBrixRmCurrencyType.TWD.rawValue)
                case "HK_HKD":
                    currencyName = adBrix.getCurrencyString(AdBrixRM.AdBrixRmCurrencyType.HKD.rawValue)
                case "ID_IDR":
                    currencyName = adBrix.getCurrencyString(AdBrixRM.AdBrixRmCurrencyType.IDR.rawValue)
                case "IN_INR":
                    currencyName = adBrix.getCurrencyString(AdBrixRM.AdBrixRmCurrencyType.INR.rawValue)
                case "RU_RUB":
                    currencyName = adBrix.getCurrencyString(AdBrixRM.AdBrixRmCurrencyType.RUB.rawValue)
                case "TH_THB":
                    currencyName = adBrix.getCurrencyString(AdBrixRM.AdBrixRmCurrencyType.THB.rawValue)
                case "VN_VND":
                    currencyName = adBrix.getCurrencyString(AdBrixRM.AdBrixRmCurrencyType.VND.rawValue)
                case "MY_MYR":
                    currencyName = adBrix.getCurrencyString(AdBrixRM.AdBrixRmCurrencyType.MYR.rawValue)
                default:
                    print("There is something wrong on building currencyUnit")
                    
                }
                
            } else if key == "category" {
                category = value as? Array<String>
                
            } else if key == "productAttr" {
                productAttr = value as? Dictionary<String, Any>
                
            } else {
                print("There is something wrong on building productModel")
                
            }
        }
        
        if productAttr != nil {
            
            productValue = adBrix.createCommerceProductDataWithAttr(productId: productId, productName: productName, price: price, quantity: quantity, discount: discount, currencyString: currencyName, category: adBrix.createCommerceProductCategoryDataByArray(categoryArray: category!), productAttrsMap: AdBrixUtility.AdBrixRmAttrModelMakeAttrModel(attr: productAttr!))
                        
        } else {
            
            productValue = adBrix.createCommerceProductDataWithAttr(productId: productId, productName: productName, price: price, quantity: quantity, discount: discount, currencyString: currencyName, category: adBrix.createCommerceProductCategoryDataByArray(categoryArray: category!), productAttrsMap: nil)
            
        }
        
        return productValue!
        
    }
    
    public static func AdBrixRmMakeProductList(productList : Array<Dictionary<String, Any>>) -> Array<AdBrixRmCommerceProductModel> {
        
        var arr : Array<AdBrixRmCommerceProductModel> = Array()
        for product in productList{
            
            let productModel = AdBrixRmMakeProductModel(productModel: product)
            
            arr.append(productModel)
            
        }
        
        return arr
        
    }
    
}
