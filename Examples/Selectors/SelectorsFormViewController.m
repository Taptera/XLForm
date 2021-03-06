//
//  SelectorsFormViewController.m
//  XLForm ( https://github.com/xmartlabs/XLForm )
//
//  Created by Martin Barreto on 31/3/14.
//
//  Copyright (c) 2014 Xmartlabs ( http://xmartlabs.com )
//
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "SelectorsFormViewController.h"

NSString *const kSelectorPush = @"selectorPush";
NSString *const kSelectorActionSheet = @"selectorActionSheet";
NSString *const kSelectorAlertView = @"selectorAlertView";
NSString *const kSelectorLeftRight = @"selectorLeftRight";
NSString *const kSelectorPushDisabled = @"selectorPushDisabled";
NSString *const kSelectorActionSheetDisabled = @"selectorActionSheetDisabled";
NSString *const kSelectorLeftRightDisabled = @"selectorLeftRightDisabled";


@implementation SelectorsFormViewController

- (id)init
{
    XLFormDescriptor * form = [XLFormDescriptor formDescriptorWithTitle:@"Selectors"];
    XLFormSectionDescriptor * section;
    XLFormRowDescriptor * row;
    
    // Basic Information
    section = [XLFormSectionDescriptor formSectionWithTitle:@"Selectors"];
    section.footerTitle = @"SelectorsFormViewController.h";
    [form addFormSection:section];
    
    
    // Selector Push
    row = [XLFormRowDescriptor formRowDescriptorWithTag:kSelectorPush rowType:XLFormRowDescriptorTypeSelectorPush title:@"Selector Push"];
    row.selectorOptions = @[[XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"Option 1"],
                                                 [XLFormOptionsObject formOptionsObjectWithValue:@(1) displayText:@"Option 2"],
                                                 [XLFormOptionsObject formOptionsObjectWithValue:@(2) displayText:@"Option 3"],
                                                 [XLFormOptionsObject formOptionsObjectWithValue:@(3) displayText:@"Option 4"],
                                                 [XLFormOptionsObject formOptionsObjectWithValue:@(4) displayText:@"Option 5"]
                                                 ];
    row.value = [XLFormOptionsObject formOptionsObjectWithValue:@(1) displayText:@"Option 2"];
    [section addFormRow:row];
    
    
    // Selector Action Sheet
    row = [XLFormRowDescriptor formRowDescriptorWithTag:kSelectorActionSheet rowType:XLFormRowDescriptorTypeSelectorActionSheet title:@"Selector Sheet"];
    row.selectorOptions = @[[XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"Option 1"],
                                                 [XLFormOptionsObject formOptionsObjectWithValue:@(1) displayText:@"Option 2"],
                                                 [XLFormOptionsObject formOptionsObjectWithValue:@(2) displayText:@"Option 3"],
                                                 [XLFormOptionsObject formOptionsObjectWithValue:@(3) displayText:@"Option 4"],
                                                 [XLFormOptionsObject formOptionsObjectWithValue:@(4) displayText:@"Option 5"]
                                                 ];
    row.value = [XLFormOptionsObject formOptionsObjectWithValue:@(2) displayText:@"Option 3"];
    [section addFormRow:row];
    
    
    
    
    // Selector Alert View
    row = [XLFormRowDescriptor formRowDescriptorWithTag:kSelectorAlertView rowType:XLFormRowDescriptorTypeSelectorAlertView title:@"Selector Alert View"];
    row.selectorOptions = @[[XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"Option 1"],
                                                        [XLFormOptionsObject formOptionsObjectWithValue:@(1) displayText:@"Option 2"],
                                                        [XLFormOptionsObject formOptionsObjectWithValue:@(2) displayText:@"Option 3"],
                                                        [XLFormOptionsObject formOptionsObjectWithValue:@(3) displayText:@"Option 4"],
                                                        [XLFormOptionsObject formOptionsObjectWithValue:@(4) displayText:@"Option 5"]
                                                        ];
    row.value = [XLFormOptionsObject formOptionsObjectWithValue:@(2) displayText:@"Option 3"];
    [section addFormRow:row];
    
    
    
    // Selector Left Right
    row = [XLFormRowDescriptor formRowDescriptorWithTag:kSelectorLeftRight rowType:XLFormRowDescriptorTypeSelectorLeftRight title:@"Selector Left Right"];
    row.leftRightSelectorLeftOptionSelected = [XLFormOptionsObject formOptionsObjectWithValue:@(1) displayText:@"Option 2"];
    
    NSArray * rightOptions =  @[[XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"Right Option 1"],
      [XLFormOptionsObject formOptionsObjectWithValue:@(1) displayText:@"Right Option 2"],
      [XLFormOptionsObject formOptionsObjectWithValue:@(2) displayText:@"Right Option 3"],
      [XLFormOptionsObject formOptionsObjectWithValue:@(3) displayText:@"Right Option 4"],
      [XLFormOptionsObject formOptionsObjectWithValue:@(4) displayText:@"Right Option 5"]
      ];
    
    // create right selectors
    NSMutableArray * leftRightSelectorOptions = [[NSMutableArray alloc] init];
    NSMutableArray * mutableRightOptions = [rightOptions mutableCopy];
    [mutableRightOptions removeObjectAtIndex:0];
    XLFormLeftRightSelectorOption * leftRightSelectorOption = [XLFormLeftRightSelectorOption formLeftRightSelectorOptionWithLeftValue:[XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"Option 1"] httpParameterKey:@"option_1" rightOptions:mutableRightOptions];
    [leftRightSelectorOptions addObject:leftRightSelectorOption];
    
    mutableRightOptions = [rightOptions mutableCopy];
    [mutableRightOptions removeObjectAtIndex:1];
    leftRightSelectorOption = [XLFormLeftRightSelectorOption formLeftRightSelectorOptionWithLeftValue:[XLFormOptionsObject formOptionsObjectWithValue:@(1) displayText:@"Option 2"] httpParameterKey:@"option_2" rightOptions:mutableRightOptions];
    [leftRightSelectorOptions addObject:leftRightSelectorOption];
    
    mutableRightOptions = [rightOptions mutableCopy];
    [mutableRightOptions removeObjectAtIndex:2];
    leftRightSelectorOption = [XLFormLeftRightSelectorOption formLeftRightSelectorOptionWithLeftValue:[XLFormOptionsObject formOptionsObjectWithValue:@(2) displayText:@"Option 3"]  httpParameterKey:@"option_3" rightOptions:mutableRightOptions];
    [leftRightSelectorOptions addObject:leftRightSelectorOption];
    
    mutableRightOptions = [rightOptions mutableCopy];
    [mutableRightOptions removeObjectAtIndex:3];
    leftRightSelectorOption = [XLFormLeftRightSelectorOption formLeftRightSelectorOptionWithLeftValue:[XLFormOptionsObject formOptionsObjectWithValue:@(3) displayText:@"Option 4"] httpParameterKey:@"option_4" rightOptions:mutableRightOptions];
    [leftRightSelectorOptions addObject:leftRightSelectorOption];
    
    mutableRightOptions = [rightOptions mutableCopy];
    [mutableRightOptions removeObjectAtIndex:4];
    leftRightSelectorOption = [XLFormLeftRightSelectorOption formLeftRightSelectorOptionWithLeftValue:[XLFormOptionsObject formOptionsObjectWithValue:@(4) displayText:@"Option 5"] httpParameterKey:@"option_5" rightOptions:mutableRightOptions];
    [leftRightSelectorOptions addObject:leftRightSelectorOption];
    
    row.selectorOptions  = leftRightSelectorOptions;
    row.value = [XLFormOptionsObject formOptionsObjectWithValue:@(3) displayText:@"Right Option 4"];
    [section addFormRow:row];

    
    
    section = [XLFormSectionDescriptor formSectionWithTitle:@"Disabled & Required Selectors"];
    [form addFormSection:section];
    
    // Disabled Selector Push
    row = [XLFormRowDescriptor formRowDescriptorWithTag:kSelectorPushDisabled rowType:XLFormRowDescriptorTypeSelectorPush title:@"Selector Push"];
    row.value = [XLFormOptionsObject formOptionsObjectWithValue:@(1) displayText:@"Option 2"];
    row.disabled = YES;
    [section addFormRow:row];

    // Disabled Selector Action Sheet
    row = [XLFormRowDescriptor formRowDescriptorWithTag:kSelectorActionSheetDisabled rowType:XLFormRowDescriptorTypeSelectorActionSheet title:@"Selector Sheet"];
    row.value = [XLFormOptionsObject formOptionsObjectWithValue:@(2) displayText:@"Option 3"];
    row.disabled = YES;
    [section addFormRow:row];
    
    // Disabled Selector Left Right
    row = [XLFormRowDescriptor formRowDescriptorWithTag:kSelectorLeftRightDisabled rowType:XLFormRowDescriptorTypeSelectorLeftRight title:@"Selector Left Right"];
    row.leftRightSelectorLeftOptionSelected = [XLFormOptionsObject formOptionsObjectWithValue:@(1) displayText:@"Option 2"];
    row.value = [XLFormOptionsObject formOptionsObjectWithValue:@(3) displayText:@"Right Option 4"];
    row.disabled = YES;
    [section addFormRow:row];

    return [super initWithForm:form];
}



@end
