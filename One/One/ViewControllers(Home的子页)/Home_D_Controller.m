//
//  Home_D_Controller.m
//  One
//
//  Created by youngstar on 16/5/30.
//  Copyright © 2016年 杨铭星. All rights reserved.
//

#import "Home_D_Controller.h"
#import "D_Model.h"


static NSString * const reuseIdentifier = @"Home_D_Cell";

@interface Home_D_Controller ()
@property (nonatomic, strong) NSMutableArray *array;
@end

@implementation Home_D_Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"cell自适应高度";
     D_Model *model1 = [[D_Model alloc]initWithName:@"小五" age:@"21" sex:@"女" photo:@"xiaowu" describe:@"这种方法虽然是使用fram的方式计算,但是如果没有autoLayout,计算的过程就会复杂几倍,有时候可能还需要一个专门的类去管理子控件的frame.在我看来是一个比较不错的方法."];
    
     D_Model *model2 = [[D_Model alloc]initWithName:@"小六" age:@"21" sex:@"男" photo:@"xiaoliu" describe:@"这种方法虽然是使用fram的方式计算,但是如果没有autoLayout,计算的过程就会复杂几倍,有时候可能还需要一个专门的类去管理子控件的frame.在我看来是一个比较不错的方法."];
    
     D_Model *model3 = [[D_Model alloc]initWithName:@"小七" age:@"21" sex:@"女" photo:@"xiaoqi" describe:@"这种方法虽然是使用fram的方式计算,但是如果没有autoLayout,计算的过程就会复杂几倍,有时候可能还需要一个专门的类去管理子控件的frame.在我看来是一个比较不错的方法.这种方法虽然是使用fram的方式计算,但是如果没有autoLayout,计算的过程就会复杂几倍,有时候可能还需要一个专门的类去管理子控件的frame.在我看来是一个比较不错的方法."];
    
     D_Model *model4 = [[D_Model alloc]initWithName:@"小八" age:@"24" sex:@"男" photo:@"xiaoba" describe:@"这种方法虽然是使用fram的方式计算,但是如果没有autoLayout,计算的过程就会复杂几倍,有时候可能还需要一个专门的类去管理子控件的frame.在我看来是一个比较不错的方法."];
    
     D_Model *model5 = [[D_Model alloc]initWithName:@"小九" age:@"21" sex:@"女" photo:@"xiaojiu" describe:@"这种方法虽然是使用fram的方式计算,但是如果没有autoLayout,计算的过程就会复杂几倍,有时候可能还需要一个专门的类去管理子控件的frame.在我看来是一个比较不错的方法.这种方法虽然是使用fram的方式计算,但是如果没有autoLayout,计算的过程就会复杂几倍,有时候可能还需要一个专门的类去管理子控件的frame.在我看来是一个比较不错的方法.这种方法虽然是使用fram的方式计算,但是如果没有autoLayout,计算的过程就会复杂几倍,有时候可能还需要一个专门的类去管理子控件的frame.在我看来是一个比较不错的方法."];
    
    self.array = [NSMutableArray arrayWithObjects:model1, model2, model3, model4, model5, nil];
    
    
    [self.tableView registerClass:[Home_D_TableViewCell class] forCellReuseIdentifier:reuseIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.array.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    D_Model *model =[self.array objectAtIndex:indexPath.row];
    CGFloat hight=[Home_D_TableViewCell hightWithString:model.describe];
    return hight+100;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Home_D_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    }
    
    cell.model = [self.array objectAtIndex:indexPath.row];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
