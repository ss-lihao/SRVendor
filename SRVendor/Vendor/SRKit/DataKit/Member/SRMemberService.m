//
//  SRMemberService.m
//  SkinRun
//
//  Created by skin on 6/5/15.
//  Copyright (c) 2015 上海商路网络科技有限公司. All rights reserved.
//

#import "SRMemberService.h"
#import "SRKit.h"
#import "SRWebService.h"

//声明 WebService 模块路径
NSString* const kPathOfMember = @"member";
//http://qa.v3.api.skinrun.me/member?client=1&version=3.0

@implementation SRMemberService


/*
 * 用户登录
  */
+ (instancetype)login:(NSString*)user password:(NSString*)password device_token: (NSString*)device_token {
    SRMemberService* service = [[SRMemberService alloc]init];
    service.path = kPathOfMember;
    
    NSString* action = @"login";
     
    service.header = [SRWebService encodeAuthorizeLoginInfo:user password:password];
    
    service.body = SRDictionaryWithVariableBindings(action,device_token);
    
    
    service.successFilter = (id)^( id response){
        if (SRIsValidateDictionary(response)) {
            NSDictionary* dict = (NSDictionary*)response;
            
                 NSDictionary* data = [dict objectForKey:@"data"];
                if (SRIsValidateDictionary(data)) {
                    NSString* token = [data objectForKey:@"token"];
                    //@step
                    [[SRDataManager sharedInstance]setUserToken:token];
                }
                
        }
        //@step
        return response;
        
    };
    
    return service;
}


/*
 * 用户退出
 */
+ (instancetype)logout {
    SRMemberService* service = [[SRMemberService alloc]init];
    service.path = kPathOfMember;
    
    NSString* action = @"logout";
    
    service.header = [SRMemberService encodedAuthorizeTokenInfo];
    
    service.body = SRDictionaryWithVariableBindings(action);
    
    return service;
}


/*
 * @功能: 获取验证码
 * @type: 验证码的类型 register 注册,resetpwd 找回密码,bindmobile 绑定手机号
 *
 */
+ (instancetype)verifyCode:(NSString*)type mobile:(NSString*)mobile {
    SRMemberService* service = [[SRMemberService alloc]init];
    service.path = kPathOfMember;
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    NSString* action = @"verifycode";
    
    service.body = SRDictionaryWithVariableBindings(action,type,mobile);
    
    return service;
}

+ (instancetype)singin:(NSString*)type
{
    SRMemberService *service = [[SRMemberService alloc] init];
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    service.path = kPathOfMember;
    NSString *action = @"sign";
    service.body = SRDictionaryWithVariableBindings(action,type);
    return service;
}

/*
 * @功能: 核实验证码正确性
 * @type: 验证码的类型 register 注册,resetpwd 找回密码,bindmobile 绑定手机号
 * @mobile: 接收短信的手机号
 * @code: 验证码
 */
#pragma TODO
+ (instancetype)verifyCodeValidate:(NSString*)type mobile:(NSString*)mobile code:(NSString*)code{
    SRMemberService* service = [[SRMemberService alloc]init];
    service.path = kPathOfMember;
    if ([type isEqualToString:@"bindmobile"]) {
        service.header = [SRWebService encodedAuthorizeTokenInfo];
    }
    NSString* action = @"validatecode";

    service.body = SRDictionaryWithVariableBindings(action,type,code,mobile);
    
    return service;
}


/*
 * 用户注册
 */
+ (instancetype)userRegister:(NSString*)password mobile:(NSString*)mobile verify_code:(NSString*)verify_code recommend:(NSString*)recommend{
    SRMemberService* service = [[SRMemberService alloc]init];
    service.path = kPathOfMember;
    
    NSString* action = @"register";
    
    service.body = SRDictionaryWithVariableBindings(action,password,mobile,verify_code,recommend);
    
    return service;
}

/*
 * @功能: 忘记密码
 * @bindmobile 接收短信的手机号,code 验证码
 *
 */
+ (instancetype)resetPwd:(NSString*)password mobile:(NSString*)mobile code:(NSString*)code{
    SRMemberService* service = [[SRMemberService alloc]init];
    service.path = kPathOfMember;
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    NSString* action = @"resetpwd";
    
    service.body = SRDictionaryWithVariableBindings(action,password,mobile,code);
    
    return service;
}

/*
 * @功能: 修改密码
 * @oldpassword 老密码,newpassword 修改的新密码
 *
 */
+ (instancetype)updatePassword:(NSString*)oldpassword newpassword:(NSString*)newpassword{
    SRMemberService* service = [[SRMemberService alloc]init];
    service.path = kPathOfMember;
    
    NSString* action = @"updatepassword";
    service.header = [SRWebService encodedAuthorizeTokenInfo];

    service.body = SRDictionaryWithVariableBindings(action,oldpassword,newpassword);
    
    return service;
}

/*
 * @功能: 第三方用户登录
 * @action action= oauth 第三方用户登录动作(固定)
 * @type type=qq QQ 登录,type=weixin 微信登录,type=weibo 微博登录
 * @openuserInfo {"uid":"C32F953FEBC3FF22154FD0025958EC32",
   "gender":" 男 ",
   "screen_name":"Caffe",
   "openid":"C32F953FEBC3FF22154FD0025958EC32",
   "profile_image_url":"http://qzapp.qlogo.cn/qzapp/100381049/C32F953FEBC3FF22154FD0025958EC32/100"}
 */
+ (instancetype)oauth:(NSString*)type openUserInfo:(NSDictionary*)openUserInfo andpassworld:(NSString *)password andMoblie:(NSString *)mobile andCode:(NSString*)code{
    SRMemberService* service = [[SRMemberService alloc]init];
    service.path = kPathOfMember;
    
    NSString* action = @"oauth";
//    NSString * mobile; //手机号
    
//    NSString * code; //验证码
    NSDictionary* dict = SRDictionaryWithVariableBindings(action,type,mobile,code,password);
    
    service.body = SRDictionaryByMergingDictionaryWithDictionary(dict, openUserInfo);
    
    service.successFilter = (id)^( id response){
        if (SRIsValidateDictionary(response)) {
            NSDictionary* dict = (NSDictionary*)response;
            
            NSDictionary* data = [dict objectForKey:@"data"];
            if (SRIsValidateDictionary(data)) {
                NSString* token = [data objectForKey:@"token"];
                //@step
                [[SRDataManager sharedInstance]setUserToken:token];
            }
            
        }
        //@step
        return response;
    };
    return service;
}

+ (instancetype)bindAccountValidate:(NSString*)type openUserInfo:(NSDictionary*)openUserInfo{

    SRMemberService* service = [[SRMemberService alloc]init];
    service.path = kPathOfMember;
    
    NSString* action = @"accountstatus";
    NSDictionary* dict = SRDictionaryWithVariableBindings(action,type);
    service.body = SRDictionaryByMergingDictionaryWithDictionary(dict, openUserInfo);
    
    service.successFilter = (id)^( id response){
        if (SRIsValidateDictionary(response)) {
            NSDictionary* dict = (NSDictionary*)response;
            
            NSDictionary* data = [dict objectForKey:@"data"];
            if (SRIsValidateDictionary(data)) {
                NSString* token = [data objectForKey:@"token"];
                //@step
                [[SRDataManager sharedInstance]setUserToken:token];
            }
            
        }
        //@step
        return response;
    };
    return service;
}


/*
 * @功能: 用户资料更新
 * @nickname 用户昵称,birthday 生日,gender 性别 0为未知 1为男性,2为女性,skin 肤质
 * @regions 用户所在地区 6 位数,headimg 用户头像
 */
+ (instancetype)update:(NSString*)nickname birthday:(NSString*)birthday gender:(int)gender1 skin:(int)skin1 regions:(NSString*)regions headimg:(NSString*)headimg full_district:(NSString*)full_district{
    SRMemberService* service = [[SRMemberService alloc]init];
    service.path = kPathOfMember;
    
    NSString* action = @"update";
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    NSString* gender = [NSString stringWithFormat:@"%d", gender1];
    NSString* skin = [NSString stringWithFormat:@"%d", skin1];
    
    if ([CKStringUtils isEmpty:headimg]) {
        service.body = SRDictionaryWithVariableBindings(action,nickname,birthday,gender,skin,regions,full_district);
    }else{
        service.body = SRDictionaryWithVariableBindings(action,nickname,birthday,gender,skin,regions,full_district,headimg);
    }
    return service;
}

/*
 * @功能: 用户绑定
 * @mobile 要绑定的手机号,code 验证码,type 绑定类型 type=bindmobile 绑定手机号,其它值同登录
 */
+ (instancetype)bindAccount:(NSString*)mobile code:(NSString*)code type:(NSString*)type from_type:(NSString *)from_type{
    SRMemberService* service = [[SRMemberService alloc]init];
    service.path = kPathOfMember;
    
    NSString* action = @"bindaccount";
    
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    service.body = SRDictionaryWithVariableBindings(action,mobile,code,type,from_type);
    return service;
}

/**
 *  第三方绑定
 *
 *  @param uid               uid description
 *  @param gender            gender description
 *  @param screen_name       screen_name description
 *  @param openid            openid description
 *  @param profile_image_url profile_image_url description
 *  @param type              type description
 *
 *  @return 返回service对象
 */
+ (instancetype)bindAccount:(int)gender screen_name:(NSString *)screen_name openid:(NSString *)openid profile_image_url:(NSString *)profile_image_url type:(NSString *)type{
    
    SRMemberService * service = [[SRMemberService alloc] init];
    service.path = kPathOfMember;
    NSString * action = @"bindaccount";
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    NSDictionary * dict = @{@"action":action,@"gender":@(gender),@"screen_name":screen_name,@"openid":openid,@"profile_image_url":profile_image_url,@"type":type};
    if([type isEqualToString:@"weibo"]){
        dict = @{@"action":action,@"gender":@(gender),@"screen_name":screen_name,@"openid":openid,@"uid":openid,@"profile_image_url":profile_image_url,@"type":type};
        
    }
    service.body = dict;
    
    return service;
}

/*
 * @功能: 生成商家二维码
 * @id 商户 ID,type create 固定  预留
 */
//+ (instancetype)resetpwd:(NSString*)password mobile:(NSString*)mobile code:(NSString*)code{
//    SRMemberService* service = [[SRMemberService alloc]init];
//    service.path = kPathOfMember;
//    
//    
//    service.body = SRDictionaryWithVariableBindings(action,password,mobile,code);
//    
//    return service;
//}

/*
 * @功能: 用户中心扫一扫
 * @mobile 要绑定的手机号,code 验证码,type 绑定类型 type=bindmobile 绑定手机号,其它值同登录
 */
+ (instancetype)scan:(NSString*)code{
    SRMemberService* service = [[SRMemberService alloc]init];
    service.path = [NSString stringWithFormat:@"%@/scan", kPathOfMember];
    
    NSString* action = @"scan";
    
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    service.body = SRDictionaryWithVariableBindings(action,code);
    return service;
}

/*
 * @功能: 获取用户关注商家用户列表
 * @userliked 用户关注商家列表动作(固定)
 * @type 类型 0:品牌 1:美容院 ,不传表示品牌 
 * @page 分页
 */
+ (instancetype)userLiked:(int)type1 page:(int)page1{
    SRMemberService* service = [[SRMemberService alloc]init];
    service.path = [NSString stringWithFormat:@"%@/merchant", kPathOfMember];
    
    NSString* action = @"userliked";
    NSString* type = [NSString stringWithFormat:@"%d", type1];
    NSString* page = [NSString stringWithFormat:@"%d", page1];
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    service.body = SRDictionaryWithVariableBindings(action,type,page);
    return service;
}

/*
 * @功能: 取消用户关注商家
 * @deletelike 取消用户关注商家动作(固定)
 * @id 订阅 ID
 */
+ (instancetype)deleteLike:(int)likeId{
    SRMemberService* service = [[SRMemberService alloc]init];
    service.path = [NSString stringWithFormat:@"%@/merchant", kPathOfMember];
    
    NSString* action = @"deletelike";
    NSString* str = [NSString stringWithFormat:@"%d", likeId];
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    service.body =  [NSDictionary dictionaryWithObjectsAndKeys:action,@"action",
     str, @"id",nil];
    
    return service;
}

/*
 * @功能: 获取用户关注“品牌”详情
 * @merchant_id 商家 ID
 * @page 分页
 */
+ (instancetype)merchantBrand:(int)merchant_id page:(int)page{
    SRMemberService* service = [[SRMemberService alloc]init];
    service.path = [NSString stringWithFormat:@"%@/merchant", kPathOfMember];
    
    NSString* action = @"merchantBrand";
    NSString* str1 = [NSString stringWithFormat:@"%d", merchant_id];
    NSString* str2 = [NSString stringWithFormat:@"%d", page];
    
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    service.body =  [NSDictionary dictionaryWithObjectsAndKeys:action,@"action",
                     str1, @"merchant_id",str2, @"page",nil];
    
    return service;
}

/*
 * 产品详情页
 */
+ (instancetype)ProductDetailData:(int)product_id1  {
    SRMemberService* service = [[SRMemberService alloc]init];
    service.path = [NSString stringWithFormat:@"%@/merchant", kPathOfMember];
    NSString* action = @"productDetail";
    NSString * gid=[NSString stringWithFormat:@"%d",product_id1];
    
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    service.body = SRDictionaryWithVariableBindings(action, gid);
    return service;
}
/*
 * @功能: 获取用户关注“品牌”详情
 * @merchant_id 商家 ID
 * @brand_id 品牌 ID
 * @page 分页
 */
+ (instancetype)merchantBrandDetail:(int)merchant_id brand_id:(int)brand_id page:(int)page{
    SRMemberService* service = [[SRMemberService alloc]init];
    service.path = [NSString stringWithFormat:@"%@/merchant", kPathOfMember];
    
    NSString* action = @"merchantBrand";
    NSString* str1 = [NSString stringWithFormat:@"%d", merchant_id];
    NSString* str2 = [NSString stringWithFormat:@"%d", brand_id];
    NSString* str3 = [NSString stringWithFormat:@"%d", page];

    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    service.body =  [NSDictionary dictionaryWithObjectsAndKeys:action,@"action",
                     str1, @"merchant_id",str2, @"brand_id",str3, @"page",nil];
    
    return service;
}

/*
 * @功能: 获取用户关注“美容院”详情
 * @merchant_id 商家 ID
 */
+ (instancetype)merchantDetail:(int)merchant_id{
    SRMemberService* service = [[SRMemberService alloc]init];
    service.path = [NSString stringWithFormat:@"%@/merchant", kPathOfMember];
    
    NSString* action = @"merchantDetail";
    NSString* str = [NSString stringWithFormat:@"%d", merchant_id];
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    service.body =  [NSDictionary dictionaryWithObjectsAndKeys:action,@"action",
                     str, @"merchant_id",nil];
    
    return service;
}
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
                        mobile:(NSString*)mobile{
    SRMemberService* service = [[SRMemberService alloc]init];
    service.path = kPathOfMember;
    
    NSString* action = @"professional";
    NSString* type1 = [NSString stringWithFormat:@"%d", type];
    NSString* username1 = username;
    NSString* job1 = job;
    NSString* region1 = region;
    NSString* mobile1 = mobile;
    NSString*province1= province;
    NSString* city1 = city;
    NSString* area1 = area;
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    service.body =  [NSDictionary dictionaryWithObjectsAndKeys:action,@"action",
                     type1, @"type",
                     username1,@"username",
                     job1,@"job",
                     province1,@"province",
                     city1 ,@"city",
                     area1 ,@"area",
                     region1,@"region",
                     mobile1,@"mobile",nil];
    
    return service;
}

/*
 * @功能: 获取专家类型
 *
 */
+ (instancetype)getProfessionalType{
    SRMemberService* service = [[SRMemberService alloc]init];
    service.path =  kPathOfMember;
    
    NSString* action = @"professionaltype";
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    service.body =  [NSDictionary dictionaryWithObjectsAndKeys:action,@"action",nil];
    
    return service;
}


/*
 * @功能: 获取用户关注“美容院”详情
 * @merchant_id 商家 ID
 */
+ (instancetype)merchantDetail:(int)merchant_id page:(int)page{
    SRMemberService* service = [[SRMemberService alloc]init];
    service.path = [NSString stringWithFormat:@"%@/merchant", kPathOfMember];
    
    NSString* action = @"merchantDetail";
    NSString* str = [NSString stringWithFormat:@"%d", merchant_id];
    NSString* str1 = [NSString stringWithFormat:@"%d", page];
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    service.body =  [NSDictionary dictionaryWithObjectsAndKeys:action,@"action",
                     str, @"mid",str1, @"page",nil];
    
    return service;
}

/*
 * @功能: 获取用户信息
 * @getlist 获取用户消息动作(固定)
 * @type 消息类型,0 系统消息,1 评论,2 点赞
 * @page 分页
 */
+ (instancetype)getMessageList:(int)type1 page:(int)page1{
    SRMemberService* service = [[SRMemberService alloc]init];
    service.path = [NSString stringWithFormat:@"%@/message", kPathOfMember];
    
    NSString* action = @"getlist";
    NSString* type = [NSString stringWithFormat:@"%d", type1];
    NSString* page = [NSString stringWithFormat:@"%d", page1];

    service.header = [SRWebService encodedAuthorizeTokenInfo];

    service.body = SRDictionaryWithVariableBindings(action,type,page);
    return service;
}

/*
 * @功能: 获取用户未读消息条数
 */
+ (instancetype)notreadMsg{
    SRMemberService* service = [[SRMemberService alloc]init];
    service.path = [NSString stringWithFormat:@"%@/message", kPathOfMember];
    
    NSString* action = @"notreadmsg";
    
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    service.body = SRDictionaryWithVariableBindings(action);
    return service;
}

/*
 * @功能: 获取用户积分记录
 * @page 分页
 */
+ (instancetype)creditLog:(int)page1{
    SRMemberService* service = [[SRMemberService alloc]init];
    service.path = kPathOfMember;
    
    NSString* action = @"creditlog";
    NSString* page = [NSString stringWithFormat:@"%d", page1];
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    service.body = SRDictionaryWithVariableBindings(action,page);
    return service;
}

/*
 * @功能: 删除用户消息
 * @deleteId 消息 ID
 */
+ (instancetype)deleteUserMessage:(int)messageId{
    SRMemberService* service = [[SRMemberService alloc]init];
    service.path = [NSString stringWithFormat:@"%@/message", kPathOfMember];
    
    NSString* action = @"delete";
    NSString* str = [NSString stringWithFormat:@"%d", messageId];
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    service.body = [NSDictionary dictionaryWithObjectsAndKeys:action,@"action",str,@"id", nil];
    return service;
}

/*
 * @功能: 获取用户中心关注,粉丝,show,测试的总数
 * @uid 用户 UID
 */
+ (instancetype)getCount:(int)uid1{
    SRMemberService* service = [[SRMemberService alloc]init];
    service.path = kPathOfMember;
    
    NSString* action = @"getcount";
    NSString* uid = [NSString stringWithFormat:@"%d", uid1];
    
    service.body = SRDictionaryWithVariableBindings(action,uid);
    return service;
}

/*
 * @功能: 查询手机号是否存在
 * @mobile 要查询的手机号
 */
+ (instancetype)mobileExists:(NSString*)mobile{
    SRMemberService* service = [[SRMemberService alloc]init];
    service.path = kPathOfMember;
    
    NSString* action = @"mobileexists";
    
    service.body = SRDictionaryWithVariableBindings(action,mobile);
    return service;
}

/*
 * @功能: 提交用户反馈
 * @content 提交的内容,qq_number QQ号,tel_number 电话号码
 */
+ (instancetype)addFeedback:(NSString*)content qq_number:(NSString*)qq_number tel_number:(NSString*)tel_number{
    SRMemberService* service = [[SRMemberService alloc]init];
    service.path = [NSString stringWithFormat:@"%@/feedbacks", kPathOfMember];
    
    NSString* action = @"addfeedback";
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    service.body = SRDictionaryWithVariableBindings(action,content,qq_number,tel_number);
    return service;
}

/*
 * @功能: 获取用户反馈列表
 * @page 分页
 */
+ (instancetype)getFeedbacksList:(int)page1{
    SRMemberService* service = [[SRMemberService alloc]init];
    service.path = [NSString stringWithFormat:@"%@/feedbacks", kPathOfMember];
    
    NSString* action = @"getlist";
    NSString* page = [NSString stringWithFormat:@"%d", page1];

    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    service.body = SRDictionaryWithVariableBindings(action,page);
    return service;
}

/*
 * @功能: 获取用户个人信息
 * @id1 消息 ID
 */
+ (instancetype)info{
    SRMemberService* service = [[SRMemberService alloc]init];
    service.path = kPathOfMember;
    
    NSString* action = @"info";
  
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    service.body = SRDictionaryWithVariableBindings(action);
    
    return service;
}

/*
 * @功能: 获取用户收货地址
 */
+ (instancetype)getAddress{
    SRMemberService* service = [[SRMemberService alloc]init];
    service.path = kPathOfMember;
    
    NSString* action = @"getaddress";
    
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    service.body = SRDictionaryWithVariableBindings(action);
    return service;
}

/*
 * @功能: 获取用户账号的绑定状态
 */
+ (instancetype)isBind{
    SRMemberService* service = [[SRMemberService alloc]init];
    service.path = kPathOfMember;
    
    NSString* action = @"isbind";
    
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    service.body = SRDictionaryWithVariableBindings(action);
    return service;
}

/*
 *个人主页
 */
+ (instancetype)home:(NSInteger)uid1{
    SRMemberService* service = [[SRMemberService alloc]init];
  service.path = [NSString stringWithFormat:@"%@/user", kPathOfMember];    
    NSString* action = @"home";
    NSString *uid=[NSString stringWithFormat:@"%ld",uid1];
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    service.body = SRDictionaryWithVariableBindings(action,uid);
    return service;
}

/*
 * @功能: 用户更新收货地址
 * @username 收货人名称,mobile 收货人手机号,province 省 如:浙江省
 * @city 城市, area 区,street 街道,region 对应的code码
 */
+ (instancetype)address:(NSString*)username mobile:(NSString*)mobile province:(NSString*)province city:(NSString*)city area:(NSString*)area street:(NSString*)street region:(NSString*)region id:(int)id1{
    
    SRMemberService* service = [[SRMemberService alloc]init];
    service.path = kPathOfMember;
    
    NSString* action = @"address";
    NSString *id = [NSString stringWithFormat:@"%d",id1];
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    service.body = SRDictionaryWithVariableBindings(action,username,mobile,province,city,area,street,region,id);
    return service;
}

/*
 * @功能: 好友关注
 * @fid 被关注用户 UID
 */
+ (instancetype)follow:(int)fid1{
    SRMemberService* service = [[SRMemberService alloc]init];
    service.path = [NSString stringWithFormat:@"%@/friend", kPathOfMember];
    
    NSString* action = @"follow";
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    NSString* fid = [NSString stringWithFormat:@"%d", fid1];
    service.body = SRDictionaryWithVariableBindings(action,fid);
    
    return service;
}

/*
 * @功能: 取消好友关注
 * @fid 被关注用户 UID
 */
+ (instancetype)cancelFollow:(int)fid1{
    SRMemberService* service = [[SRMemberService alloc]init];
    service.path = [NSString stringWithFormat:@"%@/friend", kPathOfMember];
    
    NSString* action = @"cancelfollow";
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    NSString* fid = [NSString stringWithFormat:@"%d", fid1];
    service.body = SRDictionaryWithVariableBindings(action,fid);
    
    return service;
}

/*
 * @功能: 我的关注列表和粉丝列表和个人主页关注和粉丝
 * @keyword 搜索昵称索引(index_name),page 页码
 * @type 类型 type=1 获取我的关注,type=2 获取粉丝(我被关注)
 * @uid 获取哪个用户的关注和粉丝
 */
+ (instancetype)getFriendList:(NSString*)keyword page:(int)page1 type:(int)type1 uid:(int)uid1{
    
    SRMemberService* service = [[SRMemberService alloc]init];
    

    
    service.path = [NSString stringWithFormat:@"%@/friend", kPathOfMember];
    
    NSString* action = @"getlist";
    
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    NSString* page = [NSString stringWithFormat:@"%d", page1];
    NSString* type = [NSString stringWithFormat:@"%d", type1];
    NSString* uid = [NSString stringWithFormat:@"%d", uid1];
    
    service.body = SRDictionaryWithVariableBindings(action,keyword,page,type,uid);
    
    return service;
}


/**
 *  获取我的订单
 *
 *  @return 返回结果
 */
+ (instancetype)getMyOrder:(int)page1{

    SRMemberService* service = [[SRMemberService alloc]init];
    
    service.path = kPathOfMember;
    
    NSString* action = @"myorder";
    NSString* page = [NSString stringWithFormat:@"%d", page1];
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    service.body = SRDictionaryWithVariableBindings(action,page);
    
    return service;
}

/**
 *  关于我们
 *
 *  @return 返回结果
 */
+ (instancetype)aboutUs{
    SRMemberService* service = [[SRMemberService alloc]init];
    
    service.path = kPathOfMember;
    
    NSString* action = @"aboutus";
    
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    service.body = SRDictionaryWithVariableBindings(action);
    
    return service;
    
}

/**
 *  获取收货地址列表
 *
 *  @param page1 页码
 *
 *  @return 返回结果
 */
+ (instancetype)getAddressList:(int)page1{
    SRMemberService* service = [[SRMemberService alloc]init];
    service.path = kPathOfMember;
    NSString* action = @"addresslist";
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    NSString* page = [NSString stringWithFormat:@"%d", page1];
    service.body = SRDictionaryWithVariableBindings(action,page);
    return service;
    
}

/**
 *  设置为默认收货地址
 *
 *  @param id1 收货地址id
 *
 *  @return 返回结果
 */
+ (instancetype)setDefaultAddress:(int)id1{
    
    SRMemberService *service = [[SRMemberService alloc] init];
    service.path = kPathOfMember;
    NSString *action = @"defaultaddress";
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    NSString* id = [NSString stringWithFormat:@"%d", id1];
    service.body = SRDictionaryWithVariableBindings(action,id);
    return service;


}

/**
 *  从地址列表中删除地址
 *
 *  @param id1 id
 *
 *  @return 返回结果
 */
+ (instancetype)deleteAddressFromList:(int)id1{
// {"action":"deladdress","id":"96320"}
    SRMemberService *service = [[SRMemberService alloc] init];
    service.path = kPathOfMember;
    NSString *action = @"deladdress";
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    NSString* id = [NSString stringWithFormat:@"%d", id1];
    service.body = SRDictionaryWithVariableBindings(action,id);
    return service;
}

/**
 *获取商家推荐页
 */
+ (instancetype)getMerchantRecommend{
    SRMemberService *service = [[SRMemberService alloc] init];
    service.path = kPathOfMember;
    NSString *action = @"merchantrss";
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    service.body = SRDictionaryWithVariableBindings(action);
    return service;
}


/**
 *  获取我的红包
 *
 *  @return 返回对象
 */
+ (instancetype)getRedPackets{

    SRMemberService *service = [[SRMemberService alloc] init];
    service.path = kPathOfMember;
    
    NSString *action = @"redpackets";
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    service.body = SRDictionaryWithVariableBindings(action);
    return service;
}

/**
 *  获取我的金币
 *
 *  @return 返回对象
 */
+ (instancetype)getMyCoin{
    
    SRMemberService *service = [[SRMemberService alloc] init];
    service.path = kPathOfMember;
    NSString *action = @"coin";
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    service.body = SRDictionaryWithVariableBindings(action);
    return service;
}

/**
 *  获取我的金币
 *
 *  @return 返回对象
 */
+ (instancetype)getMyPocketMoney:(int)page1{
    
    SRMemberService *service = [[SRMemberService alloc] init];
    service.path = kPathOfMember;
    NSString *action = @"smallmoney";
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    NSString *page = [NSString stringWithFormat:@"%d",page1];
    service.body = SRDictionaryWithVariableBindings(action,page);
    return service;
}

/**
 *  获取我的金币，零钱，红包
 *
 *  @return 返回对象
 */
+ (instancetype)getmoneycount{

    SRMemberService *service = [[SRMemberService alloc] init];
    service.path = kPathOfMember;
    NSString *action = @"getmoneycount";
    service.header = [SRWebService
                      encodedAuthorizeTokenInfo];
    service.body = SRDictionaryWithVariableBindings(action);
    return service;
}

/*************
 *
 * 获取我邀请的朋友
 *
 *****/
+ (instancetype)getMyInviteFriends:(NSInteger)page1{

    
    SRMemberService *service = [[SRMemberService alloc] init];
    service.path = kPathOfMember;
    NSString *action = @"getinvite";
    NSString *page = [NSString stringWithFormat:@"%zi",page1];
    service.header = [SRWebService
                      encodedAuthorizeTokenInfo];
    service.body = SRDictionaryWithVariableBindings(action,page);
    return service;

}



/**
 *  获取用户等级
 *
 *  @return 返回对象
 */
+ (instancetype)getUserLevel{
    
    SRMemberService *service = [[SRMemberService alloc] init];
    service.path = kPathOfMember;
    NSString *action = @"getlevel";
    service.header = [SRWebService
                      encodedAuthorizeTokenInfo];
    service.body = SRDictionaryWithVariableBindings(action);
    return service;
}


@end
