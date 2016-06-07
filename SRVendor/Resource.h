//
//  Resource.h
//  SkinRun
//
//  Created by sl on 15/5/22.
//  Copyright (c) 2015年 上海商路网络科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppResource.h"

#define JGDateFormatyyyyMMddHHmmss  @"yyyy-MM-dd HH:mm:ss"

#define JFUserHeadPlaceholderImage  @"touxiang"

//广告地址
#define ADSFILEDOCUMENT  [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"Ads"]


#define ScreenHeight [[UIScreen mainScreen] bounds].size.height //屏幕高度

#define ScreenWidth [[UIScreen mainScreen] bounds].size.width //幕宽度

#ifndef _KRESOURCE_H
#define _KRESOURCE_H
////objtype: 1 文章活动 2 皮肤测试 3 功效测试 4 用户动态 5 福利社
//int static const kSRMomentTypeArticle = 1;
//int static const kSRMomentTypeSkinTest = 2;
//int static const kSRMomentTypeEffectTest = 3;
//int static const kSRMomentTypeUserActivity = 4;
//int static const kSRMomentTypeUserWelfare = 5;

#endif



@interface Resource : AppResource
@property (nonatomic,readonly,strong) NSString* time;
+ (NSString *)getAppVersion;

+ (NSString* )getOSVersion;

+ (NSString* )getDeviceInfo;

+ (NSString* )getCurrentCountryCode;

+ (NSString*) getDeclaration4AppleString;
+ (NSString *)getExperience;//获取经验说明
+ (NSString *)getCoinRule;//获取金币规则

/**
 *  零钱说明
 *
 *  @return 返回结果
 */
+ (NSString *)getPocketsMoney;
/**
 *  红包规则
 *
 *  @return 返回结果
 */
+ (NSString *)getRedRule;
+ (void)litsAppFonts;

// 通过 皮肤类型代码 获得 对应的 皮肤类型字符串
+ (NSString*)getSkinTypeByCode:(NSString*)code;

// 获取所有肤质字典
+ (NSDictionary*)getSkinTypesAsDictionary;

+ (NSArray*)getSkinTypesAsArray;

+ (NSString*)getCredit:(NSString*)credit;

// 转换积分为 用户等级字符串
+ (NSString *)credit2UserLevelString:(NSNumber *)integral ;

// 转换积分为 用户等级
+ (int)credit2UserLevel:(int) num ;

// 使用用户积分 直接 获取用户等级图片
+ (UIImage*)getUserLevelImageByCredit:(int)num;

// 通过 性别代码 获得 对应的 性别 字符串
+ (NSString*)getGenderByCode:(NSString*)code;


+ (NSArray*)getGenderAsArray;

#pragma -mark Share Secton

+ (NSString*)getAppDownloadLink;

//分享个人主页
+ (void)shareUserHomePage:(UIViewController*) owner image:(UIImage*)image title:(NSString*)title content:(NSString *)content post_id:(NSString*)post_id objType:(NSString *)objType;

//分享视频
+ (void)shareTestData:(UIViewController*) owner image:(NSString*)image content:(NSString *)content post_id:(int )ida type:(BOOL)type;

//分享福利社
+ (void)shareWelfare:(UIViewController*) owner image:(NSString*)image1  title:(NSString*)title
             content:(NSString*)content welfareId:(NSInteger)welfareId;


/**
 分享我要申请
 (只分享到朋友圈)
 */
+ (void)shareRequestions:(id) owner image:(NSString*)image1  title:(NSString*)title
                 content:(NSString*)content welfareId:(NSInteger)reqId;
/**
 邀请好友
 */
+ (void)shareInvitation:(id) owner image:(NSString*)image1  title:(NSString*)title
                content:(NSString*)content type:(NSInteger)type;
/**
 *分享爆料
 */
+ (void)shareBrokeCtr:(UIViewController*) owner image:(UIImage*)image title:(NSString*)title content:(NSString *)content bagId:(NSString*)bagId;

//分享专题
+ (void)shareVoteCtr:(UIViewController*) owner image:(UIImage*)image title:(NSString*)title content:(NSString *)content bagId:(NSString*)bagId type:(NSString *)type;
//+ (void)shareWelfare:(UIViewController*) owner image:(UIImage*)image;
+(void) shareWelfareToWechat:(UIViewController*) owner image:(UIImage*)image url:(NSString*)url;
//分享功效测试
+ (void)shareEffectTest:(UIViewController*) owner image:(UIImage*)image title:(NSString*)title content:(NSString *)content bagId:(NSString*)bagId isDetail:(BOOL)isDetail;
//调整时间戳
+ (NSString *)dateTimeDifference:(NSString *)dateString;

#pragma -mark DateTime
+ (int)dateTimeDifferenceIn75Minutes:(NSDate *)startDate endDate:(NSDate*)endDate;

//计算字符串的高度
+(CGFloat)setStingHigh:(NSString*)string;


/**
 *  计算字体的高度
 *
 *  @param string 字体的内容
 *  @param with  label的宽度
 *  @param flat  字体的大小
 */
+(CGSize)setStingHigh:(NSString*)string with:(CGFloat)with andFloat:(CGFloat)flat;

//========设置字符串和表情
+ (NSString*)formatCommentString:(NSString*)value;

/**
 *  设置引导图
 *
 *  @param image 图片
 *  @param view  显示的位置在哪个view上
 */
+ (void)showGuideViewWith:(NSString * )image Point:(CGPoint)pt :(void(^)(BOOL success))callback;
+ (void)showGuideViewWith:(NSString * )image Point:(CGPoint)pt andViewCtrl:(UIViewController*)ctr :(void(^)(BOOL success))callback;//首页专用
/**
 *  判断是否App第一次启动
 *
 *  @return 返回结果
 */
+ (BOOL)isFirstLoad:(NSString *)keyDef;

+ (void)resetDef;


+ (NSString *)getSign;
+ (BOOL)isShowAlertView:(NSString *)pageName;
+ (void)writeSignForUpdNickName:(NSString*)pageName;
+ (NSString*)getLoginType;

#pragma mark - SKINTEST
/**
 *  根据Value 获取紫外线强度
 *
 *  @param value 值
 *
 *  @return 返回紫外线
 */
+ (NSString *)getUvByRangeFromValue :(NSString *)value;
/**
 *  获取年龄
 *
 *  @param birthday 生日
 *
 *  @return 返回年龄
 */
+ (NSString *)getUserAge:(NSString *)birthday;
#pragma mark - 



/**
 *  判断等级的标志
 *
 *  @param index 等级值
 *
 *  @return 返回字符串
 */
+ (NSString *)setUpLevel:(NSInteger)index;
/**
 *  判断等级的名称
 *
 *  @param index 等级值
 *
 *  @return 返回字符串
 */
+ (NSString *)setUpMark:(NSInteger)index;
/**
 *  设置label的不同颜色
 *
 *  @param activityStr 活动的前缀
 *  @param text       活动的名字
 *  @param StrType    活动的后缀
 */
+ (NSMutableAttributedString *)returnAttribute:(NSString *)activityStr andStrText:(NSString *)text andStrType:(NSString *)StrType;


/**
 *@prams:截屏
 */
+ (UIImage *)snapshot:(UIViewController *)fromController view:(UIView *)toView;

#pragma mark - 模糊背景 - 暂定
/**
 * @prams:radius 模糊半径
 * @prams:iterations 模糊程度
 * @prams:渲染颜色
 * @prams:模糊图片
 */
+ (UIImage *)blurredImageWithRadius:(CGFloat)radius iterations:(NSUInteger)iterations tintColor:(UIColor *)tintColor image:(UIImage *)image1;
/**图片转换字符串
 *
 */
+ (NSString *)imageToBase64Str:(UIImage *) image;

/**用来拉伸图片,图片四周样式不变
 *
 */
+ (UIImage *)resizableImage:(NSString *)name;


/**View弹出动画
 *@prams:myView  弹出动画的View
 *@prams:heightY 弹出的Y坐标
 *@prams:wightX  弹出的X坐标
 *@prams:anima   弹出的动画时间
 */
+ (void)setUpView:(UIView*)myView andDirectionY:(CGFloat)heightY andDirectionX:(CGFloat)wightX andFlot:(CGFloat)anima;

/**
 视图弹出
 视图消失
 view   x 起始位置 to  停止位置
 */
+(void) setUpView:(UIView *)myView from:(CGFloat)x to:(CGFloat)to :(void (^)(BOOL finished))completion;

//转场动画

+ (void)transitionPush:(UIViewController*)ctr andSubtype:(NSString*)subtype;
/**清除弹窗View
 *@prams:bouncedView  清除View动画
 */
+ (void)setRemoveFrom:(UIView*)bouncedView;
/**View弹出动画
 *@prams:myView  弹出View添加弹簧效果
 */
+ (void)setPlateView:(UIView*)myView;

/**
 *  返回限制区域
 *
 *  @param code 代码
 *
 *  @return 返回结果
 */
+ (NSString *)returnLimitRegion:(int)code;
/**
 *  返回众测状态
 *
 *  @param code code
 *
 *  @return 返回结果
 */
+ (NSString *)returnState:(int)code;

/**
 banner 跳转
 */
+(UIViewController*)getSkipCtrByBanner:(NSDictionary*)dic;

@end

