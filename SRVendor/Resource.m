//
//  Resource.m
//  SkinRun
//
//  Created by sl on 15/5/22.
//  Copyright (c) 2015年 上海商路网络科技有限公司. All rights reserved.
//

#import "Resource.h"
#import "AppConfig.h"
#import <Accelerate/Accelerate.h>
#define key @"96D9QQRW65A21UQXXXMV6MBL4MAF78T3VH19NFKW86BWYCA7ASC8AAZV5BNQQRJ1"



@implementation Resource

+ (NSString *)getAppVersion {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    return infoDictionary[@"CFBundleShortVersionString"];
}

+ (NSString* )getOSVersion{
    return    [UIDevice currentDevice].systemVersion;
    
}

+ (NSString* )getDeviceInfo{
    NSString* result = @"";
    
    UIDevice* device =  [UIDevice currentDevice];

    
    return @"";
    
}

+ (NSString* )getCurrentCountryCode{
    return @"86";
}

+ (NSString*) getDeclaration4AppleString {
    
    return @"肌肤管家App中所涉及的各种活动、奖品发放及积分规则均由本公司解释并负责,与Apple苹果公司没有任何关系.";
    
}


/**
 *  金币规则
 *
 *  @return 返回url
 */
+ (NSString *)getCoinRule{
    
    NSMutableString * mString = [@"" mutableCopy];
    [mString appendString:[AppConfig getRootOfWebService]];
    [mString appendString:@"/h5/appview/"];
    [mString appendFormat:@"coin?version=%@",[AppConfig getAppVersion]];
    
    return mString;
}

/**
 *  经验说明
 *
 *  @return 返回url
 */
+ (NSString *)getExperience{
    NSMutableString * mString = [@"" mutableCopy];
    [mString appendString:[AppConfig getRootOfWebService]];
    [mString appendString:@"/h5/appview/"];
    
    return mString;
    
}
/**
 *  红包规则
 *
 *  @return 返回结果
 */
+ (NSString *)getRedRule{
    NSMutableString * mString = [@"" mutableCopy];
    [mString appendString:[AppConfig getRootOfWebService]];
    [mString appendString:@"/h5/appview/"];
    [mString appendFormat:@"redpacketrule?version=%@",[AppConfig getAppVersion]];
    
    return mString;
    
}

/**
 *  零钱说明
 *
 *  @return 返回结果
 */
+ (NSString *)getPocketsMoney{
    NSMutableString * mString = [@"" mutableCopy];
    [mString appendString:[AppConfig getRootOfWebService]];
    [mString appendString:@"/h5/appview/"];
    [mString appendFormat:@"remainintroduction?version=%@",[AppConfig getAppVersion]];
    
    return mString;
    
}

+ (void)litsAppFonts{
    
    
    for(NSString *familyName in [UIFont familyNames])
    {
        NSLog(@"familyName = %@", familyName);
        
        for(NSString *fontName in [UIFont fontNamesForFamilyName:familyName])
        {
            NSLog(@"\tfontName = %@", fontName);
        }
    }
}


// 通过 皮肤类型代码 获得 对应的 皮肤类型字符串
+ (NSString*)getSkinTypeByCode:(NSString*)code{
    if (code.length <1) {
        code = @"0";
    }
    NSDictionary* dict = [Resource getSkinTypesAsDictionary];
    
    return [dict objectForKey:code];
    
}

// 获取所有肤质字典
+ (NSDictionary*)getSkinTypesAsDictionary{
    NSDictionary* dict =@{@"0":@"未知肤质",@"1":@"干性肤质",@"2":@"油性肤质",@"3":@"中性肤质",@"4":@"混合性肤质",@"5":@"敏感性肤质"};
    
    return dict;
    
}

+ (NSArray*)getSkinTypesAsArray{
    return nil;
    
}

//计算等级
+ (NSString*)getCredit:(NSString*)credit{
    NSInteger cred =[credit integerValue];
    NSString*str;
    
    if (cred<=50) {
        str=@"Lv.0";
    }else if (cred<200){
        str=@"Lv.1";
    }else if (cred<500){
        str=@"Lv.2";
    }else if (cred<1000){
        str=@"Lv.3";
    }else if (cred<2000){
        str=@"Lv.4";
    }else if (cred<5000){
        str=@"Lv.5";
    }else if (cred<10000){
        str=@"Lv.6";
    }else if (cred<2000){
        str=@"Lv.7";
    }else if (cred<5000){
        str=@"Lv.8";
    }else if (cred<6000){
        str=@"Lv.9";
    }else if (cred<12000){
        str=@"Lv.10";
    }
    return str;
}

// 转换积分为 用户等级字符串
+ (NSString *)credit2UserLevelString:(NSNumber *)num {
    return @"";//[NSString stringWithFormat:@"Lv.%d",
           // [Resource credit2UserLevel:[num intValue]]];
}
// 转换积分为 用户等级
+ (int)credit2UserLevel:(int) num {
    
    int lvcount = num;
    if (lvcount < 50 ) {
        return 0;
    } else if (lvcount < 200) {
        return 1;
    } else if (lvcount < 500) {
        return 2;
    } else if (lvcount < 1000) {
        return 3;
    } else if (lvcount < 2000) {
        return 4;
    } else if (lvcount < 5000) {
        return 5;
    } else if (lvcount < 10000) {
        return 6;
    } else if (lvcount < 20000) {
        return 7;
    } else if (lvcount < 50000) {
        return 8;
    } else if (lvcount < 60000) {
        return 9;
    } else if (lvcount < 120000) {
        return 10;
    }
    return 10;
}

// 使用用户积分 直接 获取用户等级图片
+ (UIImage*)getUserLevelImageByCredit:(int)num{
//    int i = [Resource credit2UserLevel:num];
//    NSString* imageName =[NSString stringWithFormat:@"lv%d.png",i];
    return nil;
}

// 通过 性别代码 获得 对应的 性别 字符串
+ (NSString*)getGenderByCode:(NSString*)code{
    if ([@"1" isEqualToString:code]) {
        return AppLocalizedString(@"Gender.Male");
    }else{
        return AppLocalizedString(@"Gender.Female");
    }
    //
    //    return AppLocalizedString(@"Gender.Undefine");
    //
}

+ (NSArray*)getGenderAsArray{
    //    @{JFUserGenderKeyForCode:@"0", JFUserGenderKeyForName:AppLocalizedString(@"Gender.Undefine")}
    return @[
             @{JFUserGenderKeyForCode:@"1", JFUserGenderKeyForName:AppLocalizedString(@"Gender.Male")},
             @{JFUserGenderKeyForCode:@"2", JFUserGenderKeyForName:AppLocalizedString(@"Gender.Female")}];
    
}





#pragma -mark Share Secton
/**
 *  分享 跳转链接地址
 *
 *  @return 返回地址
 */
+ (NSString*)getAppDownloadLink{

    
    
}



+ (void)shareEffectTest:(UIViewController*) owner image:(UIImage*)image title:(NSString*)title content:

}
//分享爆料
+ (void)shareBrokeCtr:(UIViewController*) owner image:(UIImage*)image title:(NSString*)title content:

}
//分享专题
+ (void)shareVoteCtr:(UIViewController*) owner image:(UIImage*)image title:(NSString*)title content:

}

//分享个人主页
+ (void)shareUserHomePage:(UIViewController*) owner image:(UIImage*)image title:(NSString*)title content:(NSString *)content post_id:(NSString*)post_id objType:(NSString *)objType
{

    
}

//分享视频
+ (void)shareTestData:(UIViewController*) owner image:(NSString*)image1 content:(NSString *)content post_id:(int )ida type:(BOOL)type{
    

}


//分享福利社
+ (void)shareWelfare:(UIViewController*) owner image:(NSString*)image1  title:(NSString*)title
             content:(NSString*)content welfareId:(NSInteger)welfareId{
    

}


/**
 分享我要申请
 (只分享到朋友圈)
 */
+ (void)shareRequestions:(id) owner image:(NSString*)image1  title:(NSString*)title
                 content:(NSString*)content welfareId:(NSInteger)reqId{
    
}
/**
 邀请好友
 */
+ (void)shareInvitation:(id) owner image:(NSString*)image1  title:(NSString*)title
                content:(NSString*)content type:(NSInteger)type{
    
    UIImage * _sharedImage = nil;
    _sharedImage =[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:image1]]];
    NSString *sharedContent = content;
    //http://w1.skinrun.me/invite?token=6828902aea17b30ef4b4c94590a84392
    
    NSString *mid = [SRUserModel sharedInstance].getUserMID;
    NSString* url =[NSString stringWithFormat:@"%@/invite?token=%@&version=%@",SRActiveUrl,mid,[Resource getAppVersion]];
    
    UMSocialExtConfig *exConfig = [UMSocialData defaultData].extConfig;
    exConfig.wechatTimelineData.url = url;
    exConfig.qqData.url = url;
    exConfig.wechatSessionData.url = url;
    exConfig.sinaData.urlResource = [[UMSocialUrlResource alloc] initWithSnsResourceType:UMSocialUrlResourceTypeImage url:url];
    exConfig.sinaData.shareImage = _sharedImage;
    
    exConfig.title =title;
    
    NSString * UMShareType = UMShareToWechatSession;
    if (type == 0) {
        UMShareType = UMShareToWechatSession;
    }else if (type == 1){
        UMShareType = UMShareToQQ;
    }else if (type == 2){
        UMShareType = UMShareToSina;
    }else{
        UMShareType = UMShareToWechatTimeline;
    }
    [UMSocialSnsService presentSnsIconSheetView:owner
                                         appKey:JFUMAppKeyForUmengKey
                                      shareText:sharedContent
                                     shareImage:_sharedImage
                                shareToSnsNames:@[UMShareType]
                                       delegate:owner];
}

+(void) shareWelfareToWechat:(UIViewController*) owner image:(UIImage*)image url:(NSString*)url{
    NSString* content = @"福利社信息";
    //    NSString* url =@"";
    [AppSnsHelper shareToWechat:owner title:@"" content:content image:image url:url];
}


#pragma -mark DateTime
#define DAY_SECONDES 86400
//@if over 75 minutes then reutrn -1;
//return minutes
+ (int)dateTimeDifferenceIn75Minutes:(NSDate *)startDate endDate:(NSDate*)endDate{
    NSLog(@"startDate:[%@],endDate:[%@]", startDate,endDate);
    
    NSTimeInterval time = [startDate timeIntervalSinceDate:endDate];
    
    NSTimeInterval timeABS = fabs(time);
    //    float day = floor(timeABS/DAY_SECONDES);
    //    int hour = fmod(timeABS, DAY_SECONDES)/3600;
    int minute = ceil(fmod(timeABS, 4500)/60.0);
    
    // NSString* msg = [NSString stringWithFormat:@"%.0f天=%d小时=%d分",day, hour,minute];
    
    // NSLog(msg);
    
    if (minute>75 ) {
        return -1;
    }
    
    return minute;
}

//设置显示时间差
+ (NSString *)dateTimeDifference:(NSString *)dateString{
    NSDateFormatter *dateF = [[NSDateFormatter alloc] init];
    [dateF setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *dateOld = [dateF dateFromString:dateString];
    NSTimeInterval time = [dateOld timeIntervalSinceNow];
    
    NSTimeInterval timeABS = fabs(time);
    float day = floor(timeABS/DAY_SECONDES);
    int hour = fmod(timeABS, DAY_SECONDES)/3600;
    int minute = ceil(fmod(timeABS, 3600)/60.0);
    
    if (day >30.0) {
        NSRange range = [dateString rangeOfString:@" "];
        return [dateString substringToIndex:range.location];
    }else if (day > 0.0){
        return [NSString stringWithFormat:@"%.0f天前",day];
    }else if (hour > 0){
        return [NSString stringWithFormat:@"%d小时前",hour];
    }else{
        return [NSString stringWithFormat:@"%d分钟前",minute];
    }
}

//计算字符串的高度  返回的是字符串的高度
+(CGFloat)setStingHigh:(NSString*)string{
    
    CGSize size=[string boundingRectWithSize:CGSizeMake(ScreenWidth-20, 30000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} context:nil].size;
    
    CGFloat high=size.height;
    return high;
}
+(CGSize)setStingHigh:(NSString*)string with:(CGFloat)with andFloat:(CGFloat)flat{
    
    if(string.length<1)return CGSizeZero;
    CGSize size=[string boundingRectWithSize:CGSizeMake(with, 30000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:flat]} context:nil].size;
    
    
    return size;
}

//设置字符串和表情
+ (NSString*)formatCommentString:(NSString*)value{
    //return value;
    value = [CKStringUtils safeString:value];
    return   [JGEmojiStandardize convertToSystemEmoticons:value];
    
}

/**
 *  设置引导图
 *
 *  @param image 图片
 *  @param view  显示的位置
 */
+ (void)showGuideViewWith:(NSString * )image Point:(CGPoint)pt :(void(^)(BOOL success))callback{
    
    if([Resource isFirstLoad:image]){
        UIWindow * window = [UIApplication sharedApplication].keyWindow;
        JFBaseView *v = [[JFBaseView alloc] initWithFrame:window.bounds];
        v.updateData = callback;
        v.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        UIImage *img = [UIImage imageNamed:image];
        UIImageView *bgImgView=  [[UIImageView alloc] initWithFrame:CGRectMake(pt.x, pt.y, img.size.width, img.size.height)];
        bgImgView.image =img;
        [v addSubview:bgImgView];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapS:)];
        [v addGestureRecognizer:tap];
        [window addSubview:v];
    }
    else{
        if (callback) {
            callback(YES);
        }
    }
    
}
/**
 *  设置引导图
 *
 *  @param image 图片
 *  @param view  显示的位置
 */
+ (void)showGuideViewWith:(NSString * )image Point:(CGPoint)pt andViewCtrl:(UIViewController*)ctr :(void(^)(BOOL success))callback{
    
    if([Resource isFirstLoad:image]){
        UIWindow * window = [UIApplication sharedApplication].keyWindow;
        JFBaseView *v = [[JFBaseView alloc] initWithFrame:window.bounds];
        v.updateData = callback;
        v.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        UIImage *img = [UIImage imageNamed:image];
        UIImageView *bgImgView=  [[UIImageView alloc] initWithFrame:CGRectMake(pt.x, pt.y, img.size.width, img.size.height)];
        bgImgView.image =img;
        [v addSubview:bgImgView];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapS:)];
        [v addGestureRecognizer:tap];
        [ctr.view addSubview:v];
    }
    else{
        if (callback) {
            callback(YES);
        }
    }
    
}
+ (void)onTapS:(UITapGestureRecognizer *)sender{
    [sender.view removeFromSuperview];
    JFBaseView *v = (JFBaseView*)sender.view;
    void(^suc)(BOOL success) = v.updateData;
    if (suc) {
        suc(YES);
    }
}


/**
 *  判断程序是否是第一次加载
 *
 *  @return 返回判断类型
 */
+ (BOOL)isFirstLoad:(NSString *)keyDef{
//    return YES;
    NSString *string = [[NSUserDefaults standardUserDefaults] objectForKey:keyDef];
    if([string isEqualToString:@"yes"]){
        return NO;
    }else{
        [[NSUserDefaults standardUserDefaults] setObject:@"yes" forKey:keyDef];
        [[NSUserDefaults standardUserDefaults] synchronize];
        return YES;
    }
    
}

+ (void)resetDef{
    
    NSArray * defKeys = @[@"home",@"quaner",@"welfare",@"skinTestOne",@"skinTestTwo",@"effectTest",@"follwing",@"show"];
    [defKeys enumerateObjectsUsingBlock:^(NSString * obj, NSUInteger idx, BOOL *stop) {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:obj];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }];
    
    
}

/**
 *  后去标签
 *
 *  @return 返回结果
 */
+ (NSString *)getSign{
    //获取系统时间
    NSDate * date = [NSDate date];
    double millSecond = [date timeIntervalSince1970InMilliSecond];
    NSString *dateString = [NSString stringWithFormat:@"%f",millSecond];
    //获取系统时间毫秒级字符串
    dateString = [[dateString componentsSeparatedByString:@"."] firstObject];
    
    //    AppDelegate * delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    [[NSUserDefaults standardUserDefaults] setObject:dateString forKey:@"TIME"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    //获取系统版本
    NSString * version = [AppConfig getAppVersion];
    //获取客户端平台编号
    NSString * client = [AppConfig getClient];
    NSString * sign =[JFQuick MD5:[NSString stringWithFormat:@"%@%@%@%@",version,client,dateString,key]] ;
    return sign;
}

/**
 *  判断是否弹出修改用户昵称弹窗
 *
 *  @param pageName 页面名称
 *
 *  @return 返回结果
 */
+ (BOOL)isShowAlertView:(NSString *)pageName{
    
    NSString *isShow = [[NSUserDefaults standardUserDefaults] objectForKey:pageName];
    NSDictionary * dict =[[SRUserModel sharedInstance] getUserInfo];
    NSString * name = [dict stringValueForPath:@"data.nickname"];
    if(name.length > 7)return YES;
    if([isShow isEqualToString:pageName]){
        return NO;
    }
    //    if([isShow isEqualToString:pageName]){
    //        return NO;
    //    }
    return NO;
}
/**
 *  写入标识 修改昵称
 */
+ (void)writeSignForUpdNickName:(NSString*)pageName{
    [[NSUserDefaults standardUserDefaults] setObject:pageName forKey:pageName];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

+ (NSString*)getLoginType{
    NSDictionary* dic = [[SRUserModel sharedInstance] getUserInfo];
    NSLog(@"%@",dic);
    return [dic stringValueForPath:@"data.login_type"];
}
/**
 *  返回紫外线强度
 *
 *  @param fromValue 其实值
 *  @param toValue   结束值
 *
 *  @return 返回字符串
 */
+ (NSString *)getUvByRangeFromValue :(NSString *)value{
    
    if([value floatValue] >= 0 && [value floatValue] <= 2){
        
        return @"最弱";
    }else if([value floatValue] > 2 && [value floatValue] <= 4){
        
        return @"弱";
    }else if([value floatValue] > 4 && [value floatValue] <= 6){
        
        return @"中等";
    }else if([value floatValue] > 6 && [value floatValue] <= 9){
        
        return @"强";
    }else if([value floatValue] > 9 && [value floatValue] <= 15){
        
        return @"最强";
    }else{
        
        return @"";
    }
    
}

/**
 *  判断等级的标志
 *
 *  @param index 等级值
 *
 *  @return 返回字符串
 */
+ (NSString *)setUpLevel:(NSInteger)index{
    
    switch (index) {
        case 1:
            return @"";
            break;
        case 99:
            return @"heading_达人";
            break;
        case 2:
            return @"heading_专家";
            break;
        case 3:
            return @"heading_专家";
            break;
        case 4:
            return @"heading_专家";
            break;
        case 5:
            return @"heading_官方账号";
            break;
        case 6:
            return @"heading_官方账号";
            break;
        case 7:
            return @"heading_测评团";
            break;
        case 10:
            return @"heading_颜匠";
            break;
        default:
            break;
    }
    
    
    return @"";
}

/**
 *  判断等级的名称
 *
 *  @param index 等级值
 *
 *  @return 返回字符串
 */
+ (NSString *)setUpMark:(NSInteger)index{
    
    switch (index) {
        case 1:
            return @"普通用户";
            break;
        case 99:
            return @"达人";
            break;
        case 2:
            return @"医美专家";
            break;
        case 3:
            return @"院线专家";
            break;
        case 4:
            return @"品牌方专家";
            break;
        case 5:
            return @"品牌商家";
            break;
        case 6:
            return @"商家";
            break;
        default:
            break;
    }
    
    
    return @"";
}

+ (NSMutableAttributedString *)returnAttribute:(NSString *)activityStr andStrText:(NSString *)text andStrType:(NSString *)StrType{
    
    text  = [NSString stringWithFormat:@"%@",text];
    NSMutableAttributedString * attributeString = [[NSMutableAttributedString alloc] initWithString:text];
    UIColor *color = [UIColor colorWithHexString:@"#34b8e9"];
    [attributeString addAttribute:NSForegroundColorAttributeName value:color
                            range:NSMakeRange(0, text.length)];
    
    
    NSMutableAttributedString * startString = [[NSMutableAttributedString alloc] initWithString:activityStr];
    NSMutableAttributedString * endString  = [[NSMutableAttributedString alloc] initWithString:StrType];
    [attributeString insertAttributedString: startString atIndex:0];
    [attributeString appendAttributedString:endString];
    return attributeString;
}

+ (NSString *)getUserAge:(NSString *)birthday{
    
    NSDateFormatter * formatter = [NSDateFormatter dateFormatter];
    
    [formatter setDateFormat:JGDateFormatyyyyMMddHHmmss];
    
    NSDate * birthdayDate = [formatter dateFromString:birthday];
    
    NSTimeInterval ageInterval = [birthdayDate timeIntervalSinceNow];
    
    int age = trunc(ageInterval / (60 * 60 * 24)) / 365;
    
    return [NSString stringWithFormat:@"%d",abs(age)];
}


/**
 *@prams:截屏
 */
+ (UIImage *)snapshot:(UIViewController *)fromController view:(UIView *)toView{
    UIGraphicsBeginImageContextWithOptions(fromController.view.frame.size, YES, 0);
    [toView drawViewHierarchyInRect:fromController.view.frame afterScreenUpdates:YES];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

#pragma mark - 模糊背景 - 暂定
/**
 * @prams:radius 模糊半径
 * @prams:iterations 模糊程度
 * @prams:渲染颜色
 * @prams:模糊图片
 */
+ (UIImage *)blurredImageWithRadius:(CGFloat)radius iterations:(NSUInteger)iterations tintColor:(UIColor *)tintColor image:(UIImage *)image1

{
    
    //image must be nonzero size
    
    if (floorf(image1.size.width) * floorf(image1.size.height) <= 0.0f) return image1;
    
    //boxsize must be an odd integer
    
    uint32_t boxSize = (uint32_t)(radius * image1.scale);
    
    if (boxSize % 2 == 0) boxSize ++;
    
    //create image buffers
    
    CGImageRef imageRef = image1.CGImage;
    
    vImage_Buffer buffer1, buffer2;
    
    buffer1.width = buffer2.width = CGImageGetWidth(imageRef);
    
    buffer1.height = buffer2.height = CGImageGetHeight(imageRef);
    
    buffer1.rowBytes = buffer2.rowBytes = CGImageGetBytesPerRow(imageRef);
    
    size_t bytes = buffer1.rowBytes * buffer1.height;
    
    buffer1.data = malloc(bytes);
    
    buffer2.data = malloc(bytes);
    
    //create temp buffer
    
    void *tempBuffer = malloc((size_t)vImageBoxConvolve_ARGB8888(&buffer1, &buffer2, NULL, 0, 0, boxSize, boxSize,
                                                                 
                                                                 NULL, kvImageEdgeExtend + kvImageGetTempBufferSize));
    
    //copy image data
    
    CFDataRef dataSource = CGDataProviderCopyData(CGImageGetDataProvider(imageRef));
    
    memcpy(buffer1.data, CFDataGetBytePtr(dataSource), bytes);
    
    CFRelease(dataSource);
    
    for (NSUInteger i = 0; i < iterations; i++)
        
    {
        
        //perform blur
        
        vImageBoxConvolve_ARGB8888(&buffer1, &buffer2, tempBuffer, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
        
        //swap buffers
        
        void *temp = buffer1.data;
        
        buffer1.data = buffer2.data;
        
        buffer2.data = temp;
        
    }
    
    //free buffers
    
    free(buffer2.data);
    
    free(tempBuffer);
    
    //create image context from buffer
    
    CGContextRef ctx = CGBitmapContextCreate(buffer1.data, buffer1.width, buffer1.height,
                                             
                                             8, buffer1.rowBytes, CGImageGetColorSpace(imageRef),
                                             
                                             CGImageGetBitmapInfo(imageRef));
    
    //apply tint
    
    if (tintColor && CGColorGetAlpha(tintColor.CGColor) > 0.0f)
        
    {
        
        CGContextSetFillColorWithColor(ctx, [tintColor colorWithAlphaComponent:0.25].CGColor);
        
        CGContextSetBlendMode(ctx, kCGBlendModePlusLighter);
        
        CGContextFillRect(ctx, CGRectMake(0, 0, buffer1.width, buffer1.height));
        
    }
    
    //create image from context
    
    imageRef = CGBitmapContextCreateImage(ctx);
    
    UIImage *image = [UIImage imageWithCGImage:imageRef scale:image1.scale orientation:image1.imageOrientation];
    
    CGImageRelease(imageRef);
    
    CGContextRelease(ctx);
    
    free(buffer1.data);
    
    return image;
    
}
//图片转换字符串
+ (NSString *)imageToBase64Str:(UIImage *) image
{
    NSData *data = UIImageJPEGRepresentation(image, 1.0f);
    NSString *encodedImageStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return encodedImageStr;
}
//用来拉伸图片,图片四周样式不变
+ (UIImage *)resizableImage:(NSString *)name{
    UIImage *normal = [UIImage imageNamed:name];
    CGFloat w = normal.size.width /2;
    CGFloat h = normal.size.height /2;
    //    IImage *img=[UIImage imageNamed:@"bubbleSelf.png"];
    return [normal stretchableImageWithLeftCapWidth:w topCapHeight:h];
    //核心方法,相当于改图片只拉伸内部,外边不变.
    //    return [normal resizableImageWithCapInsets:UIEdgeInsetsMake(h, w, h, w)];
}
//View弹出动画
+ (void)setUpView:(UIView*)myView andDirectionY:(CGFloat)heightY andDirectionX:(CGFloat)wightX andFlot:(CGFloat)anima{
    UIView * bouncedView =[myView superview];
    bouncedView.alpha = 0;
    [UIView animateWithDuration:0.3 animations:^{
        bouncedView.alpha = 1.0;
    }];
    CGContextRef context = UIGraphicsGetCurrentContext();
    [UIView beginAnimations:@"Curl" context:context];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:anima];
    CGRect rect = [myView frame];
    //设置弹出的方向rect.origin.x是左右弹出
    rect.origin.y = heightY;//上下弹出
    rect.origin.x = wightX;
    [myView setFrame:rect];
    [UIView commitAnimations];
    
}

+(void) setUpView:(UIView *)myView from:(CGFloat)from to:(CGFloat)to :(void (^)(BOOL finished))completion{
    CGRect ff = myView.frame;
    ff.origin.y = from;
    myView.frame = ff;
    [UIView animateWithDuration:.3 animations:^{
        CGRect ff = myView.frame;
        ff.origin.y = to;
        myView.frame = ff;
    } completion:^(BOOL finished) {
        if (completion) {
            completion(finished);
        }
    }];
}
//转场动画

+ (void)transitionPush:(UIViewController*)ctr andSubtype:(NSString*)subtype{
    //
    //    CATransition *tran = [CATransition animation];
    //
    //    tran.duration =0.3;
    //
    ////    tran.type = kCATransitionMoveIn;
    //    tran.type =@"push";
    //
    //    tran.subtype =subtype;//kCATransitionFromTop;
    //
    //
    //
    //    [ctr.navigationController.view.layer addAnimation:tran forKey:nil];
    CATransition *transition = [CATransition animation];
    transition.duration = 0.2;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush;
    transition.subtype = subtype;
    transition.delegate = ctr;
    
    
    [ctr.navigationController.view.layer addAnimation:transition forKey:nil];
    
}
// 清除弹窗View
+ (void)setRemoveFrom:(UIView*)bouncedView{
    CATransition *animation = [CATransition animation];
    animation.duration = 0.2f;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.fillMode = kCAFillModeForwards;
    animation.type = kCATransitionFade;
    animation.subtype = kCATransitionFromBottom;
    [bouncedView.superview.layer addAnimation:animation forKey:@"animation"];
    [bouncedView removeFromSuperview];
}

//弹出View弹簧效果
+ (void)setPlateView:(UIView*)myView{
    [UIView animateWithDuration:0.5 animations:^{
        myView.alpha = 1.0;
    }];
    [UIView animateWithDuration:0.8 // 动画时长
                          delay:0.0 // 动画延迟
         usingSpringWithDamping:0.5 // 类似弹簧振动效果 0~1
          initialSpringVelocity:0.3 // 初始速度
                        options:UIViewAnimationOptionCurveEaseInOut // 动画过渡效果
                     animations:^{
                         // code...
                         CGPoint point = myView.center;
                         point.y += ScreenHeight/2;
                         [myView setCenter:point];
                     } completion:^(BOOL finished) {
                         // 动画完成后执行
                         // code...
                         [myView setAlpha:1];
                     }];
}
/**
 *  返回限制区域
 *
 *  @param index 区域编码
 *
 *  @return 返回字符串
 */
+ (NSString *)returnLimitRegion:(int)code{
    
    switch (code) {
        case 1:
            return @"限华北地区";
            break;
        case 2:
            return @"限东北地区";
            break;
        case 3:
            return @"限西北地区";
            break;
        case 4:
            return @"限华中地区";
            break;
        case 5:
            return @"限西南地区";
            break;
        case 6:
            return @"限华东地区";
            break;
        case 7:
            return @"限华南地区";
            break;
        default:
            break;
    }
    
    
    return @"所有地区";
}

//众测申请状态(1:申请中;2:申请成功;3:申请失败;)

+ (NSString *)returnState:(int)code{
    switch (code) {
        case 1:
            return @"申请中";
            break;
        case 2:
            return @"申请成功";
            break;
        case 3:
            return @"申请失败";
            break;
        default:
            return @"";
            break;
    }
}

- (UIViewController *)setUpJump:(NSInteger)type{
    /*
     #import "SRTolietryBagViewController.h"//化妆包
     #import "SRBrokeViewController.h"//爆料
     #import "SRFoundCollectionView.h"//视频
     */
    JFBaseViewController *viewCtr;
    switch (type) {
        case 0:
            viewCtr =[[SRTolietryBagViewController alloc]initWithNibName:@"SRTolietryBagViewController" bundle:nil];
            break;
        case 1:
            viewCtr =[[SRBrokeViewController alloc]initWithNibName:@"SRBrokeViewController" bundle:nil];
            break;
        case 2:
            viewCtr =[[SRContentViewController alloc]initWithNibName:@"SRContentViewController" bundle:nil];
            break;
        case 3:
            viewCtr =[[SRVideoViewController alloc]init];
            break;
            
        default:
            break;
    }
    return viewCtr;
}


/**
 banner 跳转
 */
+(UIViewController*)getSkipCtrByBanner:(NSDictionary*)dic{
    
    //    objtype = 11;
    //    option =                 {
    //        "advert_url" = 2;
    //        "crowd_status" = 1;
    //        "img_path" = "http://skinrun-uploadtest.oss-cn-hangzhou.aliyuncs.com/2016-02-29/56d3ed83095db.jpg";
    //        status = 1;
    //    };
    
    NSDictionary *subDic = [dic objectForKey:@"option"];
    
    //类型 对象类型 1文章活动 2皮肤测试 3面膜测试 4用户动态show 5福利社 6产品 7品牌 9训练 10化妆包 11众测 12爆料
    if ([@"1" isEqualToString:[dic objectForKey:@"objtype"]]) {
        //美妆志列表
        if ([@"1" isEqualToString:[subDic objectForKey:@"is_navigation"]]) {
            return [[SRContentViewController alloc]initWithNibName:@"SRContentViewController" bundle:nil];
        }
        else{
            //            ctr.ID = [[subDic objectForKey:@"advert_url"] intValue];
            if ([[dic stringValueForPath:@"option.type"] isEqualToString:@"subject_article"]) {
                SRArticleTopicViewController * topView =[[SRArticleTopicViewController alloc]initWithNibName:@"SRArticleTopicViewController" bundle:nil];
                topView.gid =[dic stringValueForPath:@"option.advert_url"].intValue;
                return topView;
            }else{
                SRMakeupDetailsViewController *view=[[SRMakeupDetailsViewController alloc]initWithNibName:@"SRMakeupDetailsViewController" bundle:nil];
                
                view.bid = [subDic stringValueForPath:@"option.advert_url"].intValue;
                view.type=[subDic stringValueForPath:@"option.type"];
                
                return view;
            }
        }
    }
    //    else if ([@"2" isEqualToString:[dic objectForKey:@"objtype"]]) {
    //
    //    }
    //    else if ([@"3" isEqualToString:[dic objectForKey:@"objtype"]]) {
    //
    //    }
    else if ([@"4" isEqualToString:[dic objectForKey:@"objtype"]]) {
        JFHomeCommentViewController *commentVC = [JFHomeCommentViewController viewController];
        commentVC.contentType = (SRContentType)[[subDic stringValueForPath:@"objtype"] intValue];
        commentVC.uid =[[[SRUserModel sharedInstance] getUserId] intValue];
        commentVC.source_id = [NSNumber numberWithInt:[[subDic stringValueForPath:@"advert_url"] intValue]];
        return commentVC;
    }
    else if ([@"5" isEqualToString:[dic objectForKey:@"objtype"]]) {
        SRNewWelfareDetailViewController *ctr = [[SRNewWelfareDetailViewController alloc] initWithNibName:@"SRNewWelfareDetailViewController" bundle:nil];
        ctr.detailId = [[subDic objectForKey:@"advert_url"] intValue];
        return ctr;
    }
    else if ([@"6" isEqualToString:[dic objectForKey:@"objtype"]]) {
        SRProductDetailsViewController *comView=[[SRProductDetailsViewController alloc]initWithNibName:@"SRProductDetailsViewController" bundle:nil];
        comView.bid = [[subDic objectForKey:@"advert_url"] intValue];
        return comView;
    }
    else if ([@"7" isEqualToString:[dic objectForKey:@"objtype"]]) {
        SRSubscriptionDetailViewController *subscriptionVctrl = [[SRSubscriptionDetailViewController alloc] init];
        subscriptionVctrl.subscriptionID = [[subDic objectForKey:@"advert_url"] intValue];
        subscriptionVctrl.mid = [[subDic objectForKey:@"advert_url"] intValue];
        return subscriptionVctrl;
    }
    else if ([@"9" isEqualToString:[dic objectForKey:@"objtype"]]) {
        //视频列表
        if ([@"1" isEqualToString:[subDic objectForKey:@"is_navigation"]]) {
            return [[SRVideoViewController alloc]init];
        }
        else{
            SRAttendViewController *ctr = [[SRAttendViewController alloc] initWithNibName:@"SRAttendViewController" bundle:nil];
            ctr.tid = [[subDic objectForKey:@"advert_url"] intValue];
            return ctr;
        }
    }
    else if ([@"10" isEqualToString:[dic objectForKey:@"objtype"]]){
        
        
        //化妆包列表
        if ([@"1" isEqualToString:[subDic objectForKey:@"is_navigation"]]) {
            
            return [[SRTolietryBagViewController alloc]initWithNibName:@"SRTolietryBagViewController" bundle:nil];
        }
        else{
            SRHomeDetailsCtr * ctr =[[SRHomeDetailsCtr alloc]initWithNibName:@"SRHomeDetailsCtr" bundle:nil];
            ctr.type = [dic stringValueForPath:@"objtype"].intValue;
            ctr.uid= [dic stringValueForPath:@"uid"].intValue;
            if (ctr.uid==0) {
                ctr.uid =[[[SRUserModel sharedInstance] getUserId] intValue];
            }
            ctr.bid = [[subDic objectForKey:@"advert_url"] intValue];
            
            
            return ctr;

        }
    }
    else if ([@"11" isEqualToString:[dic objectForKey:@"objtype"]]) {
        if ([@"2" isEqualToString:[subDic objectForKey:@"crowd_status"]]) {//已结案
            SROverDetailViewController *ctr = [[SROverDetailViewController alloc] initWithNibName:@"SROverDetailViewController" bundle:nil];
            ctr.data_id = [[subDic objectForKey:@"advert_url"] intValue];
            return ctr;
        }
        else{
            //1:申请中;2:申请成功;3:申请失败;
            if ([@"1" isEqualToString:[subDic objectForKey:@"status"]]){//申请中
                SRNotRequireViewController *ctr = [[SRNotRequireViewController alloc] initWithNibName:@"SRNotRequireViewController" bundle:nil];
                ctr.requestId = [[subDic objectForKey:@"advert_url"] intValue];
                return ctr;
            }
            else if([@"2" isEqualToString:[subDic objectForKey:@"status"]]||[@"3" isEqualToString:[subDic objectForKey:@"status"]]){//申请成功
                SRRequireSuccessViewController *ctr = [[SRRequireSuccessViewController alloc] initWithNibName:@"SRRequireSuccessViewController" bundle:nil
                                                       ];
                ctr.requestId = [[subDic objectForKey:@"advert_url"] intValue];
                return ctr;
            }
            else{//申请失败
                SRNotRequireViewController *ctr = [[SRNotRequireViewController alloc] initWithNibName:@"SRNotRequireViewController" bundle:nil];
                ctr.requestId = [[subDic objectForKey:@"advert_url"] intValue];
                return ctr;
            }
        }
    }
    else if ([@"12" isEqualToString:[dic objectForKey:@"objtype"]]) {
        //爆料列表
        if ([@"1" isEqualToString:[subDic objectForKey:@"is_navigation"]]) {
            return [[SRBrokeViewController alloc]initWithNibName:@"SRBrokeViewController" bundle:nil];
        }
        else{
            SRBrokeDetailViewController *ctr = [[SRBrokeDetailViewController alloc] initWithNibName:@"SRBrokeDetailViewController" bundle:nil];
            ctr.brokeID = [[subDic objectForKey:@"advert_url"] intValue];
            return ctr;
        }
    }
    else if ([@"99" isEqualToString:[dic objectForKey:@"objtype"]]){
        SRVideoWebViewController * h5Vctrl = [[SRVideoWebViewController alloc] initWithNibName:@"SRVideoWebViewController" bundle:nil];
        h5Vctrl.titles = [subDic objectForKey:@"title"];
        h5Vctrl.view.frame=CGRectMake(0, 0, ScreenWidth, ScreenHeight);
        [h5Vctrl setURL:[subDic objectForKey:@"advert_url"]];
        [h5Vctrl reload];
        return h5Vctrl;
    }
    
    return nil;
}
/**
 *  重定向视图控制器
 *
 *  @param code                 代码
 *  @param isXib                是否xib
 */
//+ (UIViewController *)redirectController :(BOOL)isXib params:(NSDictionary*)dic{
//    //美妆志10，视频9 福利社5 11众测 99广告 12 爆料
//    // {
//    //"type":"1"
//    //"values":{"id":1}
//    //}
//
//    // {
//    //"type":"2"
//    //"values":{"name":1,"title":""}
//    //}
//    NSString *objType = [dic stringValueForPath:@"objtype"];
//
//
//
////    NSDictionary *controllerDict = @[@{
////                                         @"isXib":@"1",
////                                         @"code":@"5",
////                                         @"className":@"SRNewWelfareDetailViewController"
////                                         },]
////
////                                         @"5":@"SRNewWelfareDetailViewController",
////                                         @"9":@"SRAttendViewController",
////                                         @"11":@"SRPublicTestViewController",
////                                         @"12":@"SRBrokeDetailViewController",
////                                         @"99":@"SRVideoWebViewController"};
////
////    NSString *className =[controllerDict stringValueForPath:[NSString stringWithFormat:@"%d",code]];
////    if(code == 99){
////
////        SRVideoWebViewController *ctr = (SRVideoWebViewController*) [CUIEnginer createViewController :className  inNavigationController:false];
////        ctr.url = [dic objectForKey:@"url"];
////        return ctr;
////    }else{
////        if(isXib){
////            return [CUIEnginer createViewController :className  inNavigationController:false];
////        }else{
////           return [[NSClassFromString(className) alloc] init];
////        }
////    }
////    return nil ;
//}

@end
