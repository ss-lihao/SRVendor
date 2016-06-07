//
//  SRSkintestService.h
//  SkinRun
//
//  Created by 肌肤管家 on 15/6/9.
//  Copyright (c) 2015年 上海商路网络科技有限公司. All rights reserved.
//

#import "SRWebService.h"

@interface SRSkinTestService : SRWebService


/*
 * 获取天气PM2.5
 */
+ (instancetype)pm25:(NSString* )location;

/*
 * 获取用户资料完善状态
 */
+ (instancetype)getPerfect;

/*
 * 获取天气信息
 */
+ (instancetype)weather:(NSString*)location;

/*
 * 肌肤测试
 */
+ (instancetype)skin_test:(NSString*)water os:(NSString*)os elasticity:(CGFloat)elasticity1 appId:(CGFloat)appid1 app_Version:(NSString*)app_version lng:(NSString*)lng device_Info:(NSString*)device_info os_Version:(NSString*)os_version st_Water:(CGFloat)st_water1 country:(NSString*)country temperature:(CGFloat)temperature1 oil:(CGFloat)oil1 humidity:(CGFloat)humidity1 area:(NSString*)area st_Oil:(CGFloat)st_oil1 skin_Type:(NSString*)skin_type lat:(NSString*)lat dataFlg:(int)dataFlg;


/**
 *  脸部报告(含曲线数据)
 *
 *  @return 返回Service对象
 */
+ (instancetype)face;

/**
 *  手部报告(含曲线数据)
 *
 *  @return 返回Service对象
 */
+ (instancetype)hand;

/**
 *  独立曲线数据
 *
 *  @param part 部位【face/hand】
 *  @param date 日期
 *
 *  @return 返回Service对象
 */
+ (instancetype)chartsFromPart:(NSString *)part date:(NSString *)date;

/*
 * 获取最后一次测试的数据
 */
+ (instancetype)skin_lastday;

/*
 *于自己上周最后一次测试区域对比／同龄比较
 */
+ (instancetype)skin_Report_Diff;

/*
 *获取七日曲线
 */
+ (instancetype)skin_Report_Age_Series:(int)position1 skintype:(int)skintype1 lastday:(NSString*)lastday1;

/*
 * 肌肤测试上传图片及内容
 * @content  上传的内容
 * @image    上传图片, base64_encode
 */
+ (instancetype)update:(NSString*)content image:(NSString*)image test_id:(int)test_id;


/*
 * 肌肤测试上传图片及内容
 * @content  上传的内容
 * @image    上传图片, base64_encode
 */
+ (instancetype)uploadImage:(NSString*)image;


/*
 * 提交idfa
 */
+ (instancetype)uploadIdfa;

/*
 * 获取我/她的肌肤测试列表
 *
 */
+ (instancetype)getlist:(long)userId page:(int)pageIndex;

 

/*
 * 功效测试 创建测试批次
 * @brand_id 选择进行功效测试的商品品牌ID  可选
 * @brand_name 新增品牌时输入的品牌名称，可选，<brand_id二选一>
 * @product_id 选择进行功效测试的商品ID  可选
 * @product_name 新增产品时输入的产品名称，可选，<goods_id二选一>
 * @price 功效标签的价格值 可选
 * @img Base64_encode的值
 
 */
+ (instancetype)create:(NSString*)brand_id brand_name:(NSString*)brand_name product_id:(NSString*)product_id product_name:(NSString*)product_name price:(CGFloat)f_price image:(NSString*) img;

/*
 * 功效测试  	提交各单次测试结果
 * @batchid 批次 ID,第一次时为 0,请求后会返回,以后使用
    @isInvalid  是否无效测试，1表示无效，0表示有效（默认），对同一阶段多次测试时会用到，用户所有测试数据都将收集并上传服务端，但对不确认覆盖的作无效处理。
 
    @stage    阶段,0,1,2,3 表示四个阶段
    @skinTestData 传递 测试具体数据，oil,water,location... etc
 */
+ (instancetype)update:(NSString*) batchid isInvalid:(BOOL)isInvalid stage:(int)stage_i skinTestData:(NSDictionary*)skinTestData longitude:(NSString*)lng latitude:(NSString*)lat ;


/*
 * 提交测试完成后的心情
 * @batchId 功效测试的ID
 * @content  发布的内容
 */
+ (instancetype)show:(NSString*)batchId content:(NSString*)content;

/*
 * 获取我/她的功效测试列表
 *
 */
+ (instancetype)getlist4Effect:(long)userId page:(int)pageIndex;

/*
 * 获取化妆包列表
 *
 */
+ (instancetype)getToiletryByuid;

/*
 * 添加化妆包
 *
 */
+ (instancetype)getAddtoiletrybag:(NSString*)product_id andProduct_name:(NSString *)product_name andImg:(NSString*)img catid:(NSInteger)catid1;

/*
 * 删除化妆包
 */
+ (instancetype)getDeltoiletrybag:(NSString*)id;

/*
 * 获取护肤建议
 *
 */
+ (instancetype)getSuggestion:(int)ID;

/**
 *  获取测试日历
 *
 *  @param uid      uid
 *  @param dateLine 日期
 *
 *  @return 返回对象
 */
+ (instancetype)getcalendar:(int)userId dateLine:(NSString *)dateLine;



/**
 *  日历当天数据详情
 *
 *  @param userId    用户id
 *  @param dateLine  日期
 *  @param pageIndex 页码
 *
 *  @return 返回结果
 */
+ (instancetype)getDetail:(int)userId dateLine:(NSString *)dateLine page:(int)pageIndex;
/**
 *  日历当天数据详情
 *
 *  @param userId    用户id
 *  @param dateLine  日期
 *  @param pageIndex 页码
 *
 *  @return 返回结果
 */
+ (instancetype)getDetail:(int)userId dateLine:(NSString *)dateLine;

/*
 * 肌肤测试
 */
+ (instancetype)skin_test:(NSString*)water os:(NSString*)os elasticity:(CGFloat)elasticity1 appId:(CGFloat)appid1 app_Version:(NSString*)app_version lng:(NSString*)lng device_Info:(NSString*)device_info os_Version:(NSString*)os_version st_Water:(CGFloat)st_water1 country:(NSString*)country temperature:(CGFloat)temperature1 oil:(CGFloat)oil1 humidity:(CGFloat)humidity1 area:(NSString*)area st_Oil:(CGFloat)st_oil1 skin_Type:(NSString*)skin_type lat:(NSString*)lat test_type:(int)test_type1 ultraviolet:(CGFloat) uv;

//获取颜值
//{"action":"skinvalueage","uid":96255,"id":243281}
+ (instancetype)getSkinValueAge:(NSString *)uid testID:(NSString *)testID;
#pragma mark -功效测试
+ (instancetype)uploadTestResult:(NSString*)bag_id
                      test_count:(NSString*)test_count
                       max_water:(NSString*)max_water
                      begin_time:(NSString*)begin_time
                        end_time:(NSString*)end_time
                    post_content:(NSString*)post_content
                        post_img:(NSString*)post_img
                          record:(NSString*)record
                       test_type:(NSString*)test_type
                        crowd_id:(NSString *)crowd_id;
+ (instancetype)getResultData:(int)ID;

+ (instancetype)getResultCurve:(NSInteger)bid;

//化妆包测试记录
+ (instancetype)getCalendarEffect:(int)bagId dateLine:(NSString *)dateline;
//数据详情
+ (instancetype)getCalendarEffectDetail:(int)bagId dateLine:(NSString *)dateline;
//功效删除测试记录
+ (instancetype)delData:(int)delID;

/**
 获取功效详情
 */
+ (instancetype)effectDetail:(int)fid;


/**
 写心得
 */
+ (instancetype)experience:(int)id Title:(NSString*)_title Image:(NSString*)img Record:(NSString*)_record;

//------------database--------------


/**
 缓存json
 */
+(void) insertJsonWithId:(NSString*)json Id:(int)bid;
/**
 获取测试记录
 */
+(NSString*) selectEffectInfoWithId:(int)bid;
/**
 更新测试记录
 */
+ (void)updateJsonWithId:(NSString*)json Id:(int)bid;

/**
 删除测试记录
 */
+ (void)deleteEffectInfoWithId:(int)bid;


#pragma mark - 5.2.0
/**
 *  首页
 *
 *  @return 返回首页数据
 */
+ (instancetype)index;

/**
 *  获取测试次数 type：1 测试次数  type ：2 测试笔记
 *
 *  @return 返回列表数据
 */
+ (instancetype)getTest_list:(NSInteger)cateID bagId:(NSInteger)bagId page:(NSInteger)page1;


/**
 *  获取化妆包最后一次测试
 *
 *  id
 */
+ (instancetype)getLast_test:(NSInteger)id1 catid:(NSInteger)catid1 page:(NSInteger)page1;

/**
 *  首页 -> 测试分类列表
 *
 *  @return 返回数据
 */
+ (instancetype)getToiletryBy:(NSInteger)id1;
/**
 *  获取测试类型(文字,时长)
 *
 *  @return 返回数据
 */
+ (instancetype)get_test_typ:(NSInteger)id1;
@end
