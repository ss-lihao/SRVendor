//
//  SRMemberService.h
//  SkinRun
//
//  Created by skin on 6/5/15.
//  Copyright (c) 2015 上海商路网络科技有限公司. All rights reserved.
//

#import "SRWebService.h"

/*
 * @功能: 核实验证码正确性
 * @type: 验证码的类型 register 注册,resetpwd 找回密码,bindmobile 绑定手机号
 * @mobile: 接收短信的手机号
 * @code: 验证码
 */
static NSString* const kMemeberVerifyType4Register = @"register";
static NSString* const kMemeberVerifyType4resetpwd = @"resetpwd";
static NSString* const kMemeberVerifyType4bindmobile = @"bindmobile";

static NSString* const kMemeberLgonType3qq = @"qq";
static NSString* const kMemeberLgonType3weixin = @"weixin";
static NSString* const kMemeberLgonType3weibo = @"weibo";
static NSString* const kMemeberLgonType3mobile = @"mobile";

@interface SRMemberService : SRWebService


/*
 * 用户登录
 */
+ (instancetype)login:(NSString*)user password:(NSString*)password device_token: (NSString*)device_token;

/*
 * 用户退出
 */
+ (instancetype)logout;

/*
 * 获取验证码
 */
+ (instancetype)verifyCode:(NSString*)type mobile:(NSString*)mobile ;


/**
 *  第三方用户绑定
 *
 *  @param type         平台
 *  @param openUserInfo 第三方用户信息
 *
 *  @return 返回对象
 */
+ (instancetype)bindAccountValidate:(NSString*)type openUserInfo:(NSDictionary*)openUserInfo;


/**
 * type 1:判断用户是否签到；2用户签到
 */
+ (instancetype)singin:(NSString*)type;

/*
 * @功能: 核实验证码正确性
 */
+ (instancetype)verifyCodeValidate:(NSString*)type mobile:(NSString*)mobile code:(NSString*)code;
/*
 * 核实验证码正确性
 */
+ (instancetype)verifyCodeValidate:(NSString*)type mobile:(NSString*)mobile code:(NSString*)code;
/*
 * 用户注册
 */
+ (instancetype)userRegister:(NSString*)password mobile:(NSString*)mobile verify_code:(NSString*)verify_code recommend:(NSString*)recommend;

/*
 * 忘记密码
 */
+ (instancetype)resetPwd:(NSString*)password mobile:(NSString*)mobile code:(NSString*)code;

/*
 * 修改密码
 */
+ (instancetype)updatePassword:(NSString*)oldpassword newpassword:(NSString*)newpassword;

/*
 * 第三方用户登录
 */
+ (instancetype)oauth:(NSString*)type openUserInfo:(NSDictionary*)openUserInfo andpassworld:(NSString *)password andMoblie:(NSString *)mobile andCode:(NSString*)code;

/*
 *用户资料更新
 */
+ (instancetype)update:(NSString*)nickname birthday:(NSString*)birthday gender:(int)gender1 skin:(int)skin1 regions:(NSString*)regions headimg:(NSString*)headimg full_district:(NSString*)full_district;

/*
 *用户绑定
 */
+ (instancetype)bindAccount:(NSString*)mobile code:(NSString*)code type:(NSString*)type from_type:(NSString *)from_type;;

/*
 * 用户绑定 第三方绑定
 */
+ (instancetype)bindAccount:(int)gender
                screen_name:(NSString *)screen_name
                     openid:(NSString *)openid
          profile_image_url:(NSString*)profile_image_url
                       type:(NSString *)type;


/*
 *生成商家二维码
 */
//预留

/*
 *用户中心扫一扫
 */
+ (instancetype)scan:(NSString*)code;

/*
 *获取用户关注商家用户列表
 */
+ (instancetype)userLiked:(int)type1 page:(int)page1;

/*
 *取消用户关注商家
 */
+ (instancetype)deleteLike:(int)likeId;

/*
 * @功能: 获取用户关注“品牌”详情
 */
+ (instancetype)merchantBrand:(int)merchant_id page:(int)page;

/*
 * @功能: 获取用户关注“品牌”详情
 */
+ (instancetype)merchantBrandDetail:(int)merchant_id brand_id:(int)brand_id page:(int)page;

/*
 * @功能: 获取用户关注“美容院”详情
 */
+ (instancetype)merchantDetail:(int)merchant_id;

+ (instancetype)merchantDetail:(int)merchant_id page:(int)page;
/*
 *获取用户消息
 */
+ (instancetype)getMessageList:(int)type1 page:(int)page1;

/*
 *获取用户未读消息条数
 */
+ (instancetype)notreadMsg;

/*
 *获取用户积分记录
 */
+ (instancetype)creditLog:(int)page1;

/*
 *删除用户消息
 */
+ (instancetype)deleteUserMessage:(int)messageId;

/*
 *获取用户中心关注,粉丝,show,测试的总数
 */
+ (instancetype)getCount:(int)uid1;

/*
 *查询手机号是否存在
 */
+ (instancetype)mobileExists:(NSString*)mobile;

/*
 *提交用户反馈
 */
+ (instancetype)addFeedback:(NSString*)content qq_number:(NSString*)qq_number tel_number:(NSString*)tel_number;

/*
 *获取用户反馈列表
 */
+ (instancetype)getFeedbacksList:(int)page1;

/*
 *获取用户个人信息
 */
+ (instancetype)info;

/*
 *获取用户收货地址
 */
+ (instancetype)getAddress;

/*
 *获取用户账号的绑定状态
 */
+ (instancetype)isBind;

/*
 *个人主页
 */
+ (instancetype)home:(NSInteger)uid1;

/*
 *用户更新收货地址
 */
+ (instancetype)address:(NSString*)username mobile:(NSString*)mobile province:(NSString*)province city:(NSString*)city area:(NSString*)area street:(NSString*)street region:(NSString*)region id:(int)id1;

/*
 *好友关注
 */
+ (instancetype)follow:(int)fid1;

/*
 *取消好友关注
 */
+ (instancetype)cancelFollow:(int)fid1;

/*
 *我的关注列表和粉丝列表和个人主页关注和粉丝
 */
+ (instancetype)getFriendList:(NSString*)keyword page:(int)page1 type:(int)type1 uid:(int)uid1;
+ (instancetype)ProductDetailData:(int)product_id1 ;

/**
 *  我的订单
 *
 *  @return 返回对象
 */
+ (instancetype)getMyOrder:(int)page1;

/**
 *  专家类型
 *
 *  @return 返回对象
 */
+ (instancetype)getProfessionalType;
/**
 *  申请成为专家
 *
 *  @param type     类型
 *  @param username 姓名
 *  @param job      工作
 *  @param street   街道
 *  @param region   区域
 *  @param mobile   电话
 *
 *  @return 返回结果
 */
+ (instancetype)beProfessional:(int)type
                      username:(NSString*)username
                           job:(NSString*)job
                      province:(NSString*)province
                          city:(NSString*)city
                          area:(NSString*)area
                        region:(NSString*)region
                        mobile:(NSString*)mobile;

/**
 *  关于我们
 *
 *  @return 返回结果
 */
+ (instancetype)aboutUs;

/**
 *  获取收货地址列表
 *
 *  @param page1 页码
 *
 *  @return 返回结果
 */
+ (instancetype)getAddressList:(int)page1;

/**
 *  设置为默认收货地址
 *
 *  @param id1 收货地址id
 *
 *  @return 返回结果
 */
+ (instancetype)setDefaultAddress:(int)id1;

/**
 *  从地址列表中删除地址
 *
 *  @param id1 id
 *
 *  @return 返回结果
 */
+ (instancetype)deleteAddressFromList:(int)id1;

/**
 *获取商家推荐页
 */
+ (instancetype)getMerchantRecommend;

#pragma mark - 红包
/**
 *  获取我的红包
 *
 *  @return 返回对象
 */
+ (instancetype)getRedPackets;

/**
 *  获取我的金币
 *
 *  @return 返回对象
 */
+ (instancetype)getMyCoin;

/**
 *  获取我的金币
 *
 *  @return 返回对象
 */
+ (instancetype)getMyPocketMoney:(int)page1;

/**
 *  获取我的金币 零钱，红包个数
 *
 *  @return 返回对象
 */
+ (instancetype)getmoneycount;

/**
 *
 * 获取我邀请的朋友
 *
 **/
+ (instancetype)getMyInviteFriends:(NSInteger)page1;


/**
 *  获取用户等级
 *
 *  @return 返回对象
 */
+ (instancetype)getUserLevel;

@end
