//
//  LSYReadViewController.m
//  LSYReader
//
//  Created by Labanotation on 16/5/30.
//  Copyright © 2016年 okwei. All rights reserved.
//

#import "LSYReadViewController.h"

#import "LSYReadParser.h"
#import "LSYReadConfig.h"


@interface LSYReadViewController ()<LSYReadViewControllerDelegate>

@end

@implementation LSYReadViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _documentType = Other;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self prefersStatusBarHidden];
    [self.view setBackgroundColor:[LSYReadConfig shareInstance].theme];
    if (_bookType == BookTypePDF)
        [self.view addSubview:self.pdfReadView];
    else
        [self.view addSubview:self.readView];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeTheme:) name:LSYThemeNotification object:nil];
}
-(void)changeTheme:(NSNotification *)no
{
    if (_bookType == BookTypePDF)
    {
        
        //暂时用这种方法变色
        UIView *themeView = [[UIView alloc]initWithFrame:_pdfReadView.frame];
        themeView.backgroundColor = [[LSYReadConfig shareInstance].theme colorWithAlphaComponent:0.1];
        [_pdfReadView addSubview:themeView];
        
    }
    else
    {
        [LSYReadConfig shareInstance].theme = no.object;
        [self.view setBackgroundColor:[LSYReadConfig shareInstance].theme];
    }
}

-(ReaderContentView *)pdfReadView
{
    
    NSURL *fileURL = [[NSBundle mainBundle] URLForResource:_bookName withExtension:@"pdf"];
    
    if (!_pdfReadView) {
        //        CGRect frame = CGRectMake(LeftSpacing,TopSpacing, self.view.frame.size.width-LeftSpacing-RightSpacing, self.view.frame.size.height-TopSpacing-BottomSpacing);
        //        _pdfReadView = [[PDFReadView alloc] initWithFrame:self.view.frame];
        
        ReaderContentView* pdfContentView = [[ReaderContentView alloc]initWithFrame:self.view.bounds fileURL:fileURL page:_currentPage password:nil];
        _pdfReadView = pdfContentView;
        
        
    }
    return _pdfReadView;
}

-(LSYReadView *)readView
{
    if (!_readView) {
        CGRect frame = CGRectMake(LeftSpacing,TopSpacing, self.view.frame.size.width-LeftSpacing-RightSpacing, self.view.frame.size.height-TopSpacing-BottomSpacing);
        _readView = [[LSYReadView alloc] initWithFrame:frame];
        if (_documentType == Other) {
            
            LSYReadConfig *config = [LSYReadConfig shareInstance];
            _readView.frameRef = [LSYReadParser parserContent:_content? _content:@"" config:config bouds:CGRectMake(0,0, _readView.frame.size.width, _readView.frame.size.height)];
            _readView.content = _content;
            _readView.delegate = self;
            
            
        }
        else
        {
            
            
            
        }

    }
    return _readView;
}
-(void)readViewEditeding:(LSYReadViewController *)readView
{
    if ([self.delegate respondsToSelector:@selector(readViewEditeding:)]) {
        [self.delegate readViewEditeding:self];
    }
}
-(void)readViewEndEdit:(LSYReadViewController *)readView
{
    if ([self.delegate respondsToSelector:@selector(readViewEndEdit:)]) {
        [self.delegate readViewEndEdit:self];
    }
}

//字号
-(void)menuViewFontSize:(id)bottomMenu
{
    if ([self.delegate respondsToSelector:@selector(menuViewFontSize:)]) {
        [self.delegate menuViewFontSize:nil];
    }
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
