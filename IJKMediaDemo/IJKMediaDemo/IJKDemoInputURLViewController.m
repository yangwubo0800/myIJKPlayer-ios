/*
 * Copyright (C) 2015 Gdier
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "IJKDemoInputURLViewController.h"
#import "IJKMoviePlayerViewController.h"

@interface IJKDemoInputURLViewController () <UITextViewDelegate>

@property(nonatomic,strong) IBOutlet UITextView *textView;

@end

@implementation IJKDemoInputURLViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.title = @"Input URL";
        
        [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"Play" style:UIBarButtonItemStyleDone target:self action:@selector(onClickPlayButton)]];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)onClickPlayButton {
    //萤石云
    NSString *path = @"http://hls.open.ys7.com/openlive/f01018a141094b7fa138b9d0b856507b.hd.m3u8";
    //CCTV1
    //NSString *path = @"http://ivi.bupt.edu.cn/hls/cctv1hd.m3u8";
    // https
    //NSString *path  = @"https://media.w3.org/2010/05/sintel/trailer.mp4";
    //big duck
    //NSString *path = @"https://video-dev.github.io/streams/x36xhzz/x36xhzz.m3u8";
    
    NSURL *url = [NSURL URLWithString:path];
    NSString *scheme = [[url scheme] lowercaseString];
    
    if ([scheme isEqualToString:@"http"]
        || [scheme isEqualToString:@"https"]
        || [scheme isEqualToString:@"rtmp"]) {
        [IJKVideoViewController presentFromViewController:self withTitle:[NSString stringWithFormat:@"URL: %@", url] URL:url completion:^{
//            [self.navigationController popViewControllerAnimated:NO];
        }];
    }
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    [self onClickPlayButton];
}


@end
