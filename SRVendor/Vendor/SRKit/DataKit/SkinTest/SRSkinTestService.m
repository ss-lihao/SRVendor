//
//  SRSkintestService.m
//  SkinRun
//
//  Created by 肌肤管家 on 15/6/9.
//  Copyright (c) 2015年 上海商路网络科技有限公司. All rights reserved.
//

#import "SRSkinTestService.h"
#import "SRKit.h"
#import <AdSupport/AdSupport.h>


//声明 WebService 模块路径
NSString * const  kPathOfSkintest = @"skintest/weather";

NSString *const DataBase = @"SREffectDB";
//refrence http://www.th7.cn/Program/IOS/201506/490903.shtml


//http://qa.v3.api.skinrun.me/skintest/weather?client=1&version=3.0

@implementation SRSkinTestService

/*
 * 获取天气PM2.5
 * @location:地区,地区名或坐标
 */
+ (instancetype)pm25:(NSString* )location
{
    SRSkinTestService* service = [[SRSkinTestService alloc]init];
    service.path = kPathOfSkintest;
    
    NSString* action = @"pm25";
    
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    service.body = SRDictionaryWithVariableBindings(action,location);
    
    return service;
}


/*
 * 获取用户资料完善状态
 */
+ (instancetype)getPerfect
{
    SRSkinTestService* service = [[SRSkinTestService alloc]init];
    service.path = @"member";
    
    NSString* action = @"getperfect";
    
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    service.body = SRDictionaryWithVariableBindings(action);
    
    return service;
}

/*
 * 获取天气信息
 */
+ (instancetype)weather:(NSString*)location
{
    SRSkinTestService* service = [[SRSkinTestService alloc]init];
    service.path = kPathOfSkintest;
    
    NSString* action = @"weather";
    
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    service.body = SRDictionaryWithVariableBindings(action,location);
    
    return service;
}

/*
 * 肌肤测试
 */
+ (instancetype)skin_test:(NSString*)water os:(NSString*)os elasticity:(CGFloat)elasticity1 appId:(CGFloat)appid1 app_Version:(NSString*)app_version lng:(NSString*)lng device_Info:(NSString*)device_info os_Version:(NSString*)os_version st_Water:(CGFloat)st_water1 country:(NSString*)country temperature:(CGFloat)temperature1 oil:(CGFloat)oil1 humidity:(CGFloat)humidity1 area:(NSString*)area st_Oil:(CGFloat)st_oil1 skin_Type:(NSString*)skin_type lat:(NSString*)lat dataFlg:(int)dataFlg;
{

    SRSkinTestService* service = [[SRSkinTestService alloc]init];
    service.path =   dataFlg == NO ? @"skintest/":@"skintest/train/";
    //    service.path = @"skintest/";
    
    NSString* action = dataFlg == NO ? @"skin_test":@"traintest";
    NSString * elasticity =[NSString stringWithFormat:@"%f",elasticity1];
    NSString * appid=[NSString stringWithFormat:@"%f",appid1];
    NSString * st_water =[NSString stringWithFormat:@"%f",st_water1];
    NSString * temperature =[NSString stringWithFormat:@"%f",temperature1];
    NSString * oil =[NSString stringWithFormat:@"%f",oil1];
    NSString * humidity =[NSString stringWithFormat:@"%f",humidity1];
    NSString * st_oil =[NSString stringWithFormat:@"%f",st_oil1];
    
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    service.body = SRDictionaryWithVariableBindings(water,os,action,elasticity,appid,app_version,lng,device_info,os_version,st_water,country,temperature,oil,humidity,area,st_oil,skin_type,lat);
    
    return service;
}

/**
 *  脸部报告(含曲线数据)
 *
 *  @return 返回Service对象
 */
+ (instancetype)face{
    
    SRSkinTestService* service = [[SRSkinTestService alloc]init];
    service.path = @"skintest/report";
    NSString* action = @"face";
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    service.body = SRDictionaryWithVariableBindings(action);
    return service;
}

#pragma mark - create by heky
/**
 *  手部报告(含曲线数据)
 *
 *  @return 返回Service对象
 */
+ (instancetype)hand{

    SRSkinTestService * service = [[SRSkinTestService alloc] init];
    service.path = @"skintest/report";
    NSString * action = @"hand";
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    service.body = SRDictionaryWithVariableBindings(action);
    return service;
}


/**
 *  独立曲线数据
 *
 *  @param part 部位【face/hand】
 *  @param date 日期
 *
 *  @return 返回Service对象
 */
+ (instancetype)chartsFromPart:(NSString *)part date:(NSString *)date{
    
    SRSkinTestService *service = [[SRSkinTestService alloc] init];
    service.path = @"skintest/report";
    NSString * action = @"charts";
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    service.body = SRDictionaryWithVariableBindings(action,part,date);
    return service;

}

#pragma mark - 
/*
 * 获取最后一次测试的数据
 */
+ (instancetype)skin_lastday{
    SRSkinTestService* service = [[SRSkinTestService alloc]init];
    service.path = @"skintest/";
    
    NSString* action = @"skin_lastday";
    
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    service.body = SRDictionaryWithVariableBindings(action);
    
    return service;
}


/*
 *于自己上周最后一次测试区域对比／同龄比较
 */
+ (instancetype)skin_Report_Diff
{
    SRSkinTestService* service = [[SRSkinTestService alloc]init];
    service.path = @"skintest/";
    
    NSString* action = @"skin_report_diff";
    
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    service.body = SRDictionaryWithVariableBindings(action);
    
    return service;
}

/*
 *获取七日曲线
 */
+ (instancetype)skin_Report_Age_Series:(int)position1 skintype:(int)skintype1 lastday:(NSString*)lastday
{
    SRSkinTestService* service = [[SRSkinTestService alloc]init];
    service.path = @"skintest/";
    
    NSString* action = @"skin_report_age_series";
    NSString * position =[NSString stringWithFormat:@"%d",position1];
    NSString * skintype =[NSString stringWithFormat:@"%d",skintype1];

    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    service.body = SRDictionaryWithVariableBindings(action,position,skintype);
    
    return service;
}


/*
 * 肌肤测试上传图片及内容
 * @content  上传的内容
 * @image    上传图片, base64_encode
 */
+ (instancetype)update:(NSString*)content image:(NSString*)image test_id:(int)test_id
{
    SRSkinTestService* service = [[SRSkinTestService alloc]init];
    service.path = @"skintest/";
    
    NSString* action = @"update";
    NSString* id = [NSString stringWithFormat:@"%i",test_id];
    NSString *img = image;
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    service.body = SRDictionaryWithVariableBindings(action,content,img,id);
    
    
    
    return service;
}



/*
 * 肌肤测试上传图片及内容
 * @content  上传的内容
 * @image    上传图片, base64_encode
 */
+ (instancetype)uploadImage:(NSString*)image
{
    SRSkinTestService* service = [[SRSkinTestService alloc]init];
    service.path = @"publics/upload";
    
    NSString* action = @"upload";
    NSString *img = image;
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    service.body = SRDictionaryWithVariableBindings(action,img);
    return service;
}

/*
 * 提交idfa
 */
+ (instancetype)uploadIdfa
{
    SRSkinTestService* service = [[SRSkinTestService alloc]init];
    service.path = @"publics/upload";
    
    NSString* action = @"idfa";
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    NSString *idfa = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    
    service.body = SRDictionaryWithVariableBindings(action,idfa);
    return service;
}

/*
 * 获取我/她的肌肤测试列表
 *
 */
+ (instancetype)getlist:(long)userId page:(int)pageIndex{
    
    SRSkinTestService* service = [[SRSkinTestService alloc]init];
    service.path = @"skintest/";
    
    NSString* action = @"getlist";
    
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    NSString* uid = [NSString stringWithFormat:@"%ld", userId];
    NSString* page = [NSString stringWithFormat:@"%d", pageIndex];
    
    service.body = SRDictionaryWithVariableBindings(action,page,uid);
    
    return service;
}

 

/*
 * 功效测试 创建测试批次
 * @brand_id 选择进行功效测试的商品品牌ID  可选
 * @brand_name 新增品牌时输入的品牌名称，可选，<brand_id二选一>
 * @product_id 选择进行功效测试的产品ID  可选
 * @product_name 新增产品时输入的产品名称，可选，<goods_id二选一>
 * @price 功效标签的价格值 可选
 * @img Base64_encode的值
 
 */
+ (instancetype)create:(NSString*)brand_id brand_name:(NSString*)brand_name product_id:(NSString*)product_id product_name:(NSString*)product_name price:(CGFloat)f_price image:(NSString*) img{
    
    SRSkinTestService* service = [[SRSkinTestService alloc]init];
    service.path = @"skintest/effect";
    
    NSString* action = @"create";
    
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    NSNumber* price = [NSNumber numberWithFloat:f_price];

    service.body = SRDictionaryWithVariableBindings(action,product_id,price, img);

    return service;
}



/*
 * 功效测试  	提交各单次测试结果
 * @batchid 批次 ID,第一次时为 0,请求后会返回,以后使用
   @isInvalid  是否无效测试，1表示无效，0表示有效（默认），对同一阶段多次测试时会用到，用户所有测试数据都将收集并上传服务端，但对不确认覆盖的作无效处理。
 
   @stage    阶段,0,1,2,3 表示四个阶段
   @skinTestData 传递 测试具体数据，oil,water,location... etc
 _longitude//经度
 _latitude//纬度
 */
+ (instancetype)update:(NSString*) batchid isInvalid:(BOOL)isInvalid stage:(int)stage_i skinTestData:(NSDictionary*)skinTestData longitude:(NSString*)lng latitude:(NSString*)lat {
    
    SRSkinTestService* service = [[SRSkinTestService alloc]init];
    service.path = @"skintest/effect";
    
    NSString* action =  @"update";
    
    NSString* invalid = isInvalid ? @"1" :@"0";
    NSString* stage = [NSString stringWithFormat:@"%d",stage_i];
    
    
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    
    NSDictionary* params = SRDictionaryWithVariableBindings(action,batchid,invalid,stage);
    NSMutableDictionary* body = [NSMutableDictionary dictionaryWithDictionary:params ];
   [body addEntriesFromDictionary:skinTestData];
    
    service.body =  body;
    
    return service;
}

/*
 * 提交测试完成后的心情
 * @batchId 功效测试的ID
 * @content  发布的内容
 */
+ (instancetype)show:(NSString*)batchId content:(NSString*)content{
    
    SRSkinTestService* service = [[SRSkinTestService alloc]init];
    service.path = @"skintest/effect";
    
    NSString* action = @"show";
    
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    NSString* id =  batchId;
    
    
    service.body = SRDictionaryWithVariableBindings(action,id,content);
    
    return service;
}


/*
 * 获取我/她的功效测试列表
 *
 */
+ (instancetype)getlist4Effect:(long)userId page:(int)pageIndex{
    
    SRSkinTestService* service = [[SRSkinTestService alloc]init];
    service.path = @"skintest/effect";
    
    NSString* action = @"getlist";
    
   // service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    NSString* uid = [NSString stringWithFormat:@"%ld", userId];
    NSString* page = [NSString stringWithFormat:@"%d", pageIndex];
    
    service.body = SRDictionaryWithVariableBindings(action,page,uid);
    
    return service;
}

/*
 * 获取化妆包列表
 *
 */
+ (instancetype)getToiletryByuid{
    
    SRSkinTestService* service = [[SRSkinTestService alloc]init];
    service.path = @"skintest/toiletrybag";
    
    NSString* action = @"gettoiletrybyuid";
    
     service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    
    service.body = SRDictionaryWithVariableBindings(action);
    
    return service;
}
/*
 * 添加化妆包
 */
+ (instancetype)getAddtoiletrybag:(NSString*)product_id andProduct_name:(NSString *)product_name andImg:(NSString*)img catid:(NSInteger)catid1{
    SRSkinTestService* service = [[SRSkinTestService alloc]init];
    service.path = @"skintest/toiletrybag";
    
    NSString* action = @"addtoiletrybag";
     NSString* catid = [NSString stringWithFormat:@"%zi",catid1];
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    service.body = SRDictionaryWithVariableBindings(action,product_id,product_name,img,catid);
    
    return service;
}
/*
 * 删除化妆包
 */
+ (instancetype)getDeltoiletrybag:(NSString*)id{
    SRSkinTestService* service = [[SRSkinTestService alloc]init];
    service.path = @"skintest/toiletrybag";
    
    NSString* action = @"deltoiletrybag";
    
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    service.body = SRDictionaryWithVariableBindings(action,id);
    
    return service;
}
/*
 * 获取护肤建议
 *
 */
+ (instancetype)getSuggestion:(int)ID{
    
    SRSkinTestService* service = [[SRSkinTestService alloc]init];
    service.path = @"skintest/effect";
    
    NSString* action = @"getsuggestion";
    
    // service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    NSString* batchid = [NSString stringWithFormat:@"%d", ID];
  
    
    service.body = SRDictionaryWithVariableBindings(action,batchid);
    
    return service;
}

/**
 *  获取测试日历
 *
 *  @param uid      uid
 *  @param dateLine 日期
 *
 *  @return 返回对象
 */
+ (instancetype)getcalendar:(int)userId dateLine:(NSString *)dateLine{
    //    "action":"getcalendar","uid":25,"dateline":"2015-11"}

    SRSkinTestService *service = [[SRSkinTestService alloc] init];
    service.path = @"skintest/";
    NSString* action = @"getcalendar";
    NSString* dateline = dateLine;
    NSString * uid = [NSString stringWithFormat:@"%d",userId];
    service.body = SRDictionaryWithVariableBindings(action,uid,dateline);
    return service;
}

/**
 *  获取日期详情数据
 *
 *  @param userId id
 *  @param dateLine  日期
 *  @param pageIndex 页码
 *
 *  @return 返回对象
 */
+ (instancetype)getDetail:(int)userId dateLine:(NSString *)dateLine page:(int)pageIndex{

    SRSkinTestService *service = [[SRSkinTestService alloc] init];
    service.path = @"skintest/";
    NSString *action = @"getdetail";
    NSString *uid = [NSString stringWithFormat:@"%d",userId];
    NSString *dateline = dateLine;
    NSString *page = [NSString stringWithFormat:@"%d",pageIndex];
    service.body = SRDictionaryWithVariableBindings(action,uid,dateline,page);
    return service;
}

/**
 *  获取日期详情数据
 *
 *  @param userId id
 *  @param dateLine  日期
 *  @param pageIndex 页码
 *
 *  @return 返回对象
 */
+ (instancetype)getDetail:(int)userId dateLine:(NSString *)dateLine{
    
    SRSkinTestService *service = [[SRSkinTestService alloc] init];
    service.path = @"skintest/";
    NSString *action = @"getdetail";
    NSString *uid = [NSString stringWithFormat:@"%d",userId];
    NSString *dateline = dateLine;
    service.body = SRDictionaryWithVariableBindings(action,uid,dateline);
    return service;
}


/*
 * 肌肤测试
 */
+ (instancetype)skin_test:(NSString*)water os:(NSString*)os elasticity:(CGFloat)elasticity1 appId:(CGFloat)appid1 app_Version:(NSString*)app_version lng:(NSString*)lng device_Info:(NSString*)device_info os_Version:(NSString*)os_version st_Water:(CGFloat)st_water1 country:(NSString*)country temperature:(CGFloat)temperature1 oil:(CGFloat)oil1 humidity:(CGFloat)humidity1 area:(NSString*)area st_Oil:(CGFloat)st_oil1 skin_Type:(NSString*)skin_type lat:(NSString*)lat test_type:(int)test_type1 ultraviolet:(CGFloat) uv
{
    
    SRSkinTestService* service = [[SRSkinTestService alloc]init];
    service.path = @"skintest/";
    
    NSString* action =  @"getresult";
    NSString * elasticity =[NSString stringWithFormat:@"%f",elasticity1];
    NSString * appid=[NSString stringWithFormat:@"%f",appid1];
    NSString * st_water =[NSString stringWithFormat:@"%f",st_water1];
    NSString * temperature =[NSString stringWithFormat:@"%f",temperature1];
    NSString * oil =[NSString stringWithFormat:@"%f",oil1];
    NSString * humidity =[NSString stringWithFormat:@"%f",humidity1];
    NSString * st_oil =[NSString stringWithFormat:@"%f",st_oil1];
    NSString * ultraviolet =[NSString stringWithFormat:@"%f",uv];
    NSString *test_type = [NSString stringWithFormat:@"%i",test_type1];
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    service.body = SRDictionaryWithVariableBindings(water,os,action,elasticity,appid,app_version,lng,device_info,os_version,st_water,country,temperature,oil,humidity,area,st_oil,skin_type,lat,test_type,ultraviolet);
    
    return service;
}


/**
 *  获取颜值
 *
 *  @param uid    用户id
 *  @param testID 历史数据测试id
 *
 *  @return 返回结果
 */
+ (instancetype)getSkinValueAge:(NSString *)uid testID:(NSString *)testID{

    SRSkinTestService* service = [[SRSkinTestService alloc]init];
    service.path = @"skintest/";
    
    NSString* action =  @"skinvalueage";
    NSString * id=[NSString stringWithFormat:@"%@",testID];
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    service.body = SRDictionaryWithVariableBindings(action,uid,id);
    return service;
}


#pragma mark -功效测试

/**
 *  功效测试
 *
 *  @param bag_id     化妆包ID
 *  @param test_count 测试总数
 *  @param max_water  最大水
 *  @param begin_time 开始时间
 *  @param end_time   结束时间
 *  @param record     记录信息
 *
 *  @return 返回结果
 */
+ (instancetype)uploadTestResult:(NSString *)bag_id test_count:(NSString *)test_count max_water:(NSString *)max_water begin_time:(NSString *)begin_time end_time:(NSString *)end_time post_content:(NSString*)post_content post_img:(NSString*)post_img record:(NSString *)record test_type:(NSString*)test_type crowd_id:(NSString *)crowd_id{

    SRSkinTestService* service = [[SRSkinTestService alloc]init];
    service.path = @"skintest/functions";
    
    NSString* action =  @"upload";
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    service.body = SRDictionaryWithVariableBindings(action,bag_id,test_count,max_water,begin_time,end_time,post_content,post_img,record,test_type,crowd_id);
    return service;
}

+ (instancetype)getResultData:(int)ID{
    SRSkinTestService* service = [[SRSkinTestService alloc]init];
    service.path = @"skintest/functions";
    
    NSString* action = @"result_data";
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    
    NSString *id = [NSString stringWithFormat:@"%d",ID];
    service.body = SRDictionaryWithVariableBindings(action,id);
    return service;

}


+ (instancetype)getResultCurve:(NSInteger )bid{
    SRSkinTestService* service = [[SRSkinTestService alloc]init];
    service.path = @"skintest/functions";
    
    NSString* action =  @"result_curve";
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    NSString *id = [NSString stringWithFormat:@"%ld",(long)bid];
    service.body = SRDictionaryWithVariableBindings(action,id);
    return service;

}

/**
 *  获取功效测试记录
 *
 *  @param bagId    化妆包id
 *  @param dateline 日期
 *
 *  @return 返回结果
 */
+ (instancetype)getCalendarEffect:(int)bagId dateLine:(NSString *)dateline{

    SRSkinTestService* service = [[SRSkinTestService alloc]init];
    service.path = @"skintest/functions";
    
    NSString* action =  @"result_calendar";
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    NSString *bag_id = [NSString stringWithFormat:@"%d",bagId];
      service.body = SRDictionaryWithVariableBindings(action,bag_id,dateline);
    return service;
}

/**
 *  获取功效测试详情
 *
 *  @param bagId    化妆包id
 *  @param dateline 日期
 *
 *  @return 返回结果
 */
+ (instancetype)getCalendarEffectDetail:(int)bagId dateLine:(NSString *)dateline{

    SRSkinTestService* service = [[SRSkinTestService alloc]init];
    service.path = @"skintest/functions";
    
    NSString* action =  @"day_details";
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    NSString *bag_id = [NSString stringWithFormat:@"%d",bagId];
    service.body = SRDictionaryWithVariableBindings(action,bag_id,dateline);
    return service;

}

/**
 *  功效测试测试记录删除
 *
 *  @param delID id
 *
 *  @return 返回结果
 */
+ (instancetype)delData:(int)delID{

    SRSkinTestService* service = [[SRSkinTestService alloc]init];
    service.path = @"skintest/functions";
    
    NSString* action =  @"delete_data";
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    NSString *id = [NSString stringWithFormat:@"%d",delID];
    service.body = SRDictionaryWithVariableBindings(action,id);
    return service;
}

/**
 获取功效详情
 */
+ (instancetype)effectDetail:(int)id{
    SRSkinTestService* service = [[SRSkinTestService alloc]init];
    service.path = @"skintest/functions";
    
    NSString* action =  @"test_details";
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    NSString *fid = [NSString stringWithFormat:@"%d",id];
    service.body = SRDictionaryWithVariableBindings(action,fid);
    return service;
}


/**
 写心得
 */
+ (instancetype)experience:(int)id Title:(NSString*)_title Image:(NSString*)img Record:(NSString*)_record{
    SRSkinTestService* service = [[SRSkinTestService alloc]init];
    service.path = @"skintest/functions";
    
    NSString* action =  @"experience";
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    NSString *fid = [NSString stringWithFormat:@"%d",id];
    NSString *post_img = [NSString stringWithFormat:@"%@",img];
    NSString *title = [NSString stringWithFormat:@"%@",_title];
    NSString *record = [NSString stringWithFormat:@"%@",_record];
    service.body = SRDictionaryWithVariableBindings(action,fid,post_img,title,record);
    return service;
}


/**
 缓存json
 */
+(void) insertJsonWithId:(NSString*)json Id:(int)bid{
    
//    if ([SRSkinTestService selectEffectInfoWithId:bid]) {
//        [SRSkinTestService updateJsonWithId:json Id:bid];
//    }
//    else{
//        AppDelegate *delegate = [AppDelegate instance];
//        //1. 获得context
//        NSManagedObjectContext *context = delegate.managedObjectContext;
//        //2. 找到实体结构,并生成一个实体对象
//        /*
//         NSEntityDescription实体描述，也就是表的结构
//         参数1：表名字
//         参数2:实例化的对象由谁来管理，就是context
//         */
//        NSManagedObject *stu = [NSEntityDescription insertNewObjectForEntityForName:DataBase inManagedObjectContext:context];
//        //3. 设置实体属性值
//        [stu setValue:@(bid) forKey:@"id"];
//        [stu setValue:json forKey:@"json"];
//        //4. 调用context,保存实体,如果没有成功，返回错误信息
//        NSError *error;    if ([context save:&error]) {
//            NSLog(@"save ok");
//        }
//        else    {
//            NSLog(@"%@",error);
//        }
//    }
}

/**
 获取测试记录
 */
+(NSString*) selectEffectInfoWithId:(int)bid{
//    AppDelegate *delegate = [AppDelegate instance];
//    NSManagedObjectContext *context = delegate.managedObjectContext;
//    NSEntityDescription *stu = [NSEntityDescription entityForName:DataBase inManagedObjectContext:context];
//    //构造查询对象
//    NSFetchRequest *request = [[NSFetchRequest alloc] init];
//    [request setEntity:stu];
//    
//    //构造查询条件，相当于where子句
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"id=%i",bid];
//    //把查询条件放进去
//    [request setPredicate:predicate];
//    //执行查询，返回结果集
//    NSArray *resultAry = [context executeFetchRequest:request error:nil];
//    //遍历结果集
//    for (NSManagedObject *enity in resultAry) {
//        return [enity valueForKey:@"json"];
//    }
    return nil;
}

/**
 更新测试记录
 */
+ (void)updateJsonWithId:(NSString*)json Id:(int)bid{
//    //    更新 (从数据库找到-->更新)
//    AppDelegate *delegate = [AppDelegate instance];
//    NSManagedObjectContext *context = delegate.managedObjectContext;
//    NSEntityDescription *stu = [NSEntityDescription entityForName:DataBase inManagedObjectContext:context];
//    NSFetchRequest *request = [NSFetchRequest new];
//    [request setEntity:stu];
//    //构造查询条件，相当于where子句
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"id=%i",bid];
//    //把查询条件放进去
//    [request setPredicate:predicate];
//    //执行查询
//    NSArray *studentAry = [context executeFetchRequest:request error:nil];
//    if (studentAry.count>0)    {
//        //更新里面的值
//        NSManagedObject *obj = studentAry[0];
//        //3. 设置实体属性值
//        [obj setValue:@(bid) forKey:@"id"];
//        [obj setValue:json forKey:@"json"];
//    }
//    [context save:nil];
}

/**
 删除测试记录
 */
+ (void)deleteEffectInfoWithId:(int)bid{
//    //删除 先找到，然后删除
//    AppDelegate *delegate = [AppDelegate instance];
//    NSManagedObjectContext *context = delegate.managedObjectContext;
//    NSEntityDescription *stu = [NSEntityDescription entityForName:DataBase inManagedObjectContext:context];
//    NSFetchRequest *request = [NSFetchRequest new];
//    [request setEntity:stu];
//    //构造查询条件，相当于where子句
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"id=%i",bid];
//    //把查询条件放进去
//    [request setPredicate:predicate];
//    //执行查询
//    NSManagedObject *obj = [[context executeFetchRequest:request error:nil] lastObject];
//    //删除
//    if (obj) {
//        [context deleteObject:obj];
//        [context save:nil];
//    }
}


#pragma mark - 5.2.0
/**
 *  首页
 *
 *  @return 返回首页数据
 */
+ (instancetype)index{
    SRSkinTestService *service = [[SRSkinTestService alloc] init];
    service.path = @"skintest/toiletrybag";
    NSString *action = @"index";
    service.body = SRDictionaryWithVariableBindings(action);
    return service;
}

/**
 *  获取测试次数 type：1 测试次数  type ：2 测试笔记
 *
 *  @return 返回列表数据
 */
+ (instancetype)getTest_list:(NSInteger)cateID bagId:(NSInteger)bagId page:(NSInteger)page1{

    SRSkinTestService* service = [[SRSkinTestService alloc]init];
    service.path = @"skintest/functions";
    
    NSString* action = @"get_test_list";
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    NSString *catid = [NSString stringWithFormat:@"%zd",cateID];
    NSString *bagid = [NSString stringWithFormat:@"%zd",bagId];
    NSString *page = [NSString stringWithFormat:@"%zd",page1];
    service.body = SRDictionaryWithVariableBindings(action,catid,bagid,page);
    return service;
 
}

/**
 *  获取化妆包最后一次测试
 *
 *  id
 */
+ (instancetype)getLast_test:(NSInteger)id1 catid:(NSInteger)catid1 page:(NSInteger)page1{

    SRSkinTestService* service = [[SRSkinTestService alloc]init];
    service.path = @"skintest/functions";
    
    NSString* action = @"get_last_test";
    service.header = [SRWebService encodedAuthorizeTokenInfo];
    NSString *id = [NSString stringWithFormat:@"%zd",id1];
    NSString *catid = [NSString stringWithFormat:@"%zd",catid1];
    NSString *page = [NSString stringWithFormat:@"%zd",page1];
    service.body = SRDictionaryWithVariableBindings(action,id,catid,page);
    return service;

}

/**
 *  首页 -> 测试分类列表
 *
 *  @return 返回数据
 */
+ (instancetype)getToiletryBy:(NSInteger)id1{
    SRSkinTestService *service = [[SRSkinTestService alloc] init];
    service.path = @"skintest/toiletrybag";
    NSString *action = @"gettoiletrybyuid";
    NSString *catid = [NSString stringWithFormat:@"%zi",id1];
    service.body = SRDictionaryWithVariableBindings(action,catid);
    return service;
}
/**
 *  获取测试类型(文字,时长)
 *
 *  @return 返回数据
 */
+ (instancetype)get_test_typ:(NSInteger)id1{
    SRSkinTestService *service = [[SRSkinTestService alloc] init];
    service.path = @"skintest/functions";
    NSString *action = @"get_test_type";
    NSString *catid = [NSString stringWithFormat:@"%zi",id1];
    service.body = SRDictionaryWithVariableBindings(action,catid);
    return service;
}


@end
