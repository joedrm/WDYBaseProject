//
//  LocationHelper.h
//  Pods
//
//  Created by fang wang on 17/1/20.
//
//  https://github.com/mk2016/MKDevelopSolutions/blob/master/MKDevelopSolutions/Class/MKToolKit/MKLocationHelper.h

#import <Foundation/Foundation.h>
#import "Singleton.h"

typedef void (^MKBlock)(id result);

@interface LocationHelper : NSObject


SingletonH(LocaHelper);

- (void)locationWithBlock:(MKBlock)block;

@end


@interface MKLocationModel : NSObject

@property(nonatomic, copy) NSString* latitude;              /*!< 纬度 */
@property(nonatomic, copy) NSString* longitude;             /*!< 经度 */
@property(nonatomic, copy) NSString* country;               /*!< 国家: 中国 */
@property(nonatomic, copy) NSString* administrativeArea;    /*!< 省份: 福建省 */
@property(nonatomic, copy) NSString* subAdministrativeArea;
@property(nonatomic, copy) NSString* locality;              /*!< 城市: 福州市 */
@property(nonatomic, copy) NSString* subLocality;           /*!< 区域: 仓山区 */
@property(nonatomic, copy) NSString* thoroughfare;          /*!< 路*/
@property(nonatomic, copy) NSString* subThoroughfare;       /*!< 门牌号 */
@property(nonatomic, copy) NSString* postalCode;            /*!< 邮编 */
@property(nonatomic, copy) NSString* address;               /*!< 详细地址: 中国福建省福州市仓山区仓前街道巷下路*/

@property(nonatomic, copy) NSString* ISOcountryCode;        /*!< 国家编码: CN*/
@property(nonatomic, copy) NSString* inlandWater;           /*!< 内河 */
@property(nonatomic, copy) NSString* ocean;                 /*!< 洋 */

@property(nonatomic, copy) NSString* subAddress;            /*!< 自定义 缩简地址: 仓山区仓前街道巷下路*/

//Latitude = 26.068226
//Longitude = 119.248477
//Country = 中国
//administrativeArea = 福建省
//Locality = 福州市
//subLocality = 仓山区
//address = 中国福建省福州市仓山区建新镇

@end
