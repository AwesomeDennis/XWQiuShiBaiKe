//
//  CreateQiuShiViewController.m
//  XWQiuShiBaiKe
//
//  Created by Ren XinWei on 13-5-31.
//  Copyright (c) 2013年 renxinwei's MacBook Pro. All rights reserved.
//

#import "CreateQiuShiViewController.h"
#import "ASIFormDataRequest.h"

@interface CreateQiuShiViewController ()

@end

@implementation CreateQiuShiViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

#pragma mark - Private method

//ASIFormDataRequest方式 POST上传图片
-(NSDictionary *)addPicWithDictionary:(NSDictionary *)sugestDic{
    
    NSDictionary *tempDic=nil;
    
    NSString *url=[NSString stringWithFormat:@"http://182.50.0.62:8095/xianServer/upload/uploadImage?clientType=mobile"];
    
    ASIFormDataRequest *form = [[[ASIFormDataRequest alloc]
             initWithURL:[NSURL URLWithString:url]] autorelease];
    [form setTimeOutSeconds:60.0];
    form.delegate = self;
    //添加拍照图
    
    
    //分界线的标识符
    NSString *TWITTERFON_FORM_BOUNDARY = @"AaB03x";
    //分界线 --AaB03x
    NSString *MPboundary=[[NSString alloc]initWithFormat:@"--%@",TWITTERFON_FORM_BOUNDARY];
    //结束符 AaB03x--
    NSString *endMPboundary=[[NSString alloc]initWithFormat:@"%@--",MPboundary];
    //添加拍照图片
    UIImage *image=[UIImage imageNamed:@"btn_done_down@2x.png"];
    NSData* data = UIImagePNGRepresentation(image);
    NSLog(@"%@",data);
    //http body的字符串
    NSMutableString *body=[[NSMutableString alloc]init];
    //参数的集合的所有key的集合
    NSArray *keys= [sugestDic allKeys];
    
    //遍历keys
    for(int i=0;i<[keys count];i++)
    {
        //得到当前key
        NSString *key=[keys objectAtIndex:i];
        //如果key不是pic，说明value是字符类型，比如name：Boris
        if(![key isEqualToString:@"files"])
        {
            //添加分界线，换行
            [body appendFormat:@"%@\r\n",MPboundary];
            //添加字段名称，换2行
            [body appendFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n",key];
            //添加字段的值
            [body appendFormat:@"%@\r\n",[sugestDic objectForKey:key]];
        }
    }
    if (image) {
        ////添加分界线，换行
        [body appendFormat:@"%@\r\n",MPboundary];
        //声明pic字段，文件名为boris.png
        [body appendFormat:@"Content-Disposition: form-data; name=\"files\"; filename=\"boris.png\"\r\n"];
        //声明上传文件的格式
        [body appendFormat:@"Content-Type: image/png\r\n\r\n"];
    }
    
    //声明结束符：--AaB03x--
    NSString *end=[[NSString alloc]initWithFormat:@"\r\n%@",endMPboundary];
    //声明myRequestData，用来放入http body
    NSMutableData *myRequestData=[NSMutableData data];
    //将body字符串转化为UTF8格式的二进制
    [myRequestData appendData:[body dataUsingEncoding:NSUTF8StringEncoding]];
    //将image的data加入
    [myRequestData appendData:data];
    //加入结束符--AaB03x--
    [myRequestData appendData:[end dataUsingEncoding:NSUTF8StringEncoding]];
    //设置HTTPHeader中Content-Type的值
    NSString *content=[[NSString alloc]initWithFormat:@"multipart/form-data; boundary=%@",TWITTERFON_FORM_BOUNDARY];
    
    [form addRequestHeader:@"Content-Type" value:content];
    [form addRequestHeader:@"Content-Length" value:[NSString stringWithFormat:@"%d", [myRequestData length]]];
    [form appendPostData:myRequestData];
    [form setRequestMethod:@"POST"];
    [form startAsynchronous];
    [form setDidFailSelector:@selector(requestBeFailed:)];
    [form setDidFinishSelector:@selector(requestBeFinished:)];
    
    // 解析取得的结果
    return tempDic;
}

@end
