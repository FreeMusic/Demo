//
//  GlobalDefin.h
//  系统TabBar架构
//
//  Created by wangze on 16/1/28.
//  Copyright © 2016年 huashan. All rights reserved.
//

#ifndef GlobalDefin_h
#define GlobalDefin_h


#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define createBtn(btn, btnTitle) \
{\
btn.frame = CGRectMake(100, 100, 100, 50);\
[btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];\
[btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];\
[btn setTitle:btnTitle forState:UIControlStateNormal];\
[btn addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];\
}

//随机色
#define SXYRandomColor [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1]

#endif /* GlobalDefin_h */
