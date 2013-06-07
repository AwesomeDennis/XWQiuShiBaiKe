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
- (void)addPicWithDictionary:(NSDictionary *)sugestDic
{
    NSString *url=[NSString stringWithFormat:@"http://182.50.0.62:8095/xianServer/upload/uploadImage?clientType=mobile"];
    
    ASIHTTPRequest *form = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:url]];
    [form setTimeOutSeconds:60.0];
    form.delegate = self;
    
    //分界线的标识符
    NSString *QIUSHI_FORM_BOUNDARY = @"ixhan-dot-com";
    //分界线 --ixhan-dot-com
    NSString *QSBoundary = [NSString stringWithFormat:@"--%@", QIUSHI_FORM_BOUNDARY];
    //结束符 --ixhan-dot-com--
    NSString *EndQSBoundary = [NSString stringWithFormat:@"\r\n%@--", QSBoundary];
    //添加拍照图片
    UIImage *image=[UIImage imageNamed:@"btn_done_down@2x.png"];
    NSData* data = UIImagePNGRepresentation(image);
    NSLog(@"%@",data);
    //http body的字符串
    NSMutableString *body = [[NSMutableString alloc] init];
    //添加分界线，换行
    [body appendFormat:@"%@\r\n", QSBoundary];
    //添加字段名称，换2行
    [body appendFormat:@"Content-Disposition: form-data; name=\"json\"\r\n\r\n"];
    //添加字段的值
    NSDictionary *qsContentDict = [NSDictionary dictionaryWithObjectsAndKeys:@"", @"content", @"false", @"anonymous", @"true", @"allow_comment", nil];
    [body appendFormat:@"%@\r\n", [qsContentDict toJSON]];
    
    if (image) {
        ////添加分界线，换行
        [body appendFormat:@"%@\r\n", QSBoundary];
        //声明pic字段，文件名为boris.png
        [body appendFormat:@"Content-Disposition: form-data; name=\"image\"; filename=\"image.jpg\"\r\n"];
        //声明上传文件的格式
        [body appendFormat:@"Content-Type: image/jpg\r\n\r\n"];
    }
    
    //声明myRequestData，用来放入http body
    NSMutableData *myRequestData = [NSMutableData data];
    //将body字符串转化为UTF8格式的二进制
    [myRequestData appendData:[body dataUsingEncoding:NSUTF8StringEncoding]];
    //将image的data加入
    [myRequestData appendData:data];
    //加入结束符--ixhan-dot-com--
    [myRequestData appendData:[EndQSBoundary dataUsingEncoding:NSUTF8StringEncoding]];
    //设置HTTPHeader中Content-Type的值
    NSString *contentHeader=[NSString stringWithFormat:@"multipart/form-data; boundary=%@", QSBoundary];
    
    [form addRequestHeader:@"Content-Type" value:contentHeader];
    //[form addRequestHeader:@"Content-Length" value:[NSString stringWithFormat:@"%d", [myRequestData length]]];
    [form appendPostData:myRequestData];
    [form setRequestMethod:@"POST"];
    [form startAsynchronous];
    [form setDidFailSelector:@selector(requestBeFailed:)];
    [form setDidFinishSelector:@selector(requestBeFinished:)];
}

@end
