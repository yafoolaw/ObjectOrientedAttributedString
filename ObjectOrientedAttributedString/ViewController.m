//
//  ViewController.m
//  ObjectOrientedAttributedString
//
//  Created by FrankLiu on 15/9/12.
//  Copyright (c) 2015年 FrankLiu. All rights reserved.
//

#import "ViewController.h"
#import "NSMutableAttributedString+StringAttribute.h"
#import "FontAttribute.h"
#import "ForegroundColorAttribute.h"
#import "ParagraphAttribute.h"

#define SCREEN_WIDTH         [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT        [UIScreen mainScreen].bounds.size.height
#define LINE_SPACING         4.f
#define PARAGRAPH_SPACING    6.f
#define FONT                 [UIFont fontWithName:@"Avenir-Medium" size:13]

@interface ViewController ()

@property (nonatomic, strong) UIScrollView *m_scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.m_scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [self.view addSubview:_m_scrollView];
    
    NSString *str = @"未选择的路-弗罗斯特\n黄色的树林里分出两条路，\n可惜我不能同时去涉足，\n我在那路口久久伫立，\n我向着一条路极目望去，\n直到它消失在丛林深处。\n但我却选了另外一条路，\n它荒草萋萋，十分幽寂，\n显得更诱人、更美丽，\n虽然在这两条小路上，\n都很少留下旅人的足迹，\n虽然那天清晨落叶满地，\n两条路都未经脚印污染。\n啊，留下一条路等改日再见！\n但我知道路径延绵无尽头，\n恐怕我难以再回返。\n也许多少年后在某个地方，\n我将轻声叹息把往事回顾，\n一片树林里分出两条路，\n而我选了人迹更少的一条，\n从此决定了我一生的道路。";
    
    float contentHeight = [self heightWithString:str LabelFont:FONT withLabelWidth:(SCREEN_WIDTH-24)];
    _m_scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, contentHeight+40);
    
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc]initWithString:str];
    
    // 全局字体
    FontAttribute *allFontAttribute = [FontAttribute new];
    allFontAttribute.m_font = [UIFont fontWithName:@"Avenir-Medium" size:13];
    allFontAttribute.m_effectRange = NSMakeRange(0, str.length);
    [attributedStr addStringAttribute:allFontAttribute];
    
    // 全局颜色
    ForegroundColorAttribute *allColorAttribute = [ForegroundColorAttribute new];
    allColorAttribute.m_foregroundColor = [UIColor blackColor];
    allColorAttribute.m_effectRange = NSMakeRange(0, str.length);
    [attributedStr addStringAttribute:allColorAttribute];
    
    // 局部字体
    FontAttribute *partFontAttribute = [FontAttribute new];
    partFontAttribute.m_font = [UIFont fontWithName:@"Avenir-Black" size:17];
    partFontAttribute.m_effectRange = [str rangeOfString:@"未选择的路"];
    [attributedStr addStringAttribute:partFontAttribute];
    
    // 局部颜色
    ForegroundColorAttribute *partColorAttribute = [ForegroundColorAttribute new];
    partColorAttribute.m_foregroundColor = [UIColor redColor];
    partColorAttribute.m_effectRange = [str rangeOfString:@"未选择的路"];
    [attributedStr addStringAttribute:partColorAttribute];
    
    // 段落样式
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    paragraphStyle.lineSpacing = 4;
    paragraphStyle.paragraphSpacing = 6;
    
    ParagraphAttribute *paragraphAttribute = [ParagraphAttribute new];
    paragraphAttribute.m_paragraphStyle = paragraphStyle;
    paragraphAttribute.m_effectRange = NSMakeRange(0, str.length);
    [attributedStr addStringAttribute:paragraphAttribute];
    
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(12, 40, SCREEN_WIDTH-24, 0)];
    [_m_scrollView addSubview:label];
    label.numberOfLines = 0;
    label.attributedText = attributedStr;
    [label sizeToFit];
    
    
}

#pragma mark - 计算文本高度
- (CGFloat)heightWithString:(NSString *)string LabelFont:(UIFont *)font withLabelWidth:(CGFloat)width {
    CGFloat height = 0;
    
    if (string.length == 0) {
        
        height = 0;
        
    } else {
        
        NSString *tempStr = [string copy];
        
        // 如果有的文本结尾处没有"\n",则补上
        if([tempStr hasSuffix:@"\n"] == NO) {
            
            tempStr = [NSString stringWithFormat:@"%@\n",tempStr];
        }
        
        // 段落样式
        NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
        paragraphStyle.lineSpacing              = LINE_SPACING;
        paragraphStyle.paragraphSpacing         = PARAGRAPH_SPACING;
        
        NSDictionary *attributes = @{NSFontAttributeName           : [UIFont systemFontOfSize:18.f],
                                     NSParagraphStyleAttributeName : paragraphStyle};
        
        // 字体
        if (font) {
            
            attributes = @{NSFontAttributeName        : font,
                           NSParagraphStyleAttributeName : paragraphStyle};
        }
        
        // 尺寸
        CGSize retSize = [tempStr boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                               options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesFontLeading |NSStringDrawingUsesLineFragmentOrigin
                                            attributes:attributes
                                               context:nil].size;
        
        
        height = retSize.height;
        
    }
    
    return height;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
