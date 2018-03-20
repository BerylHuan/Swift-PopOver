


import UIKit

class PopoverTableViewController: UITableViewController {
    lazy var items:[String] =  ["死神","海贼王","火影忍者","妖精的尾巴","全职猎人","灌篮高手","七龙珠","浪客剑心","死亡笔记","棋魂","网球王子","黑子的篮球","圣斗士","名侦探柯南","一拳超人","D格雷少年","天上天下"]
    //取消按钮
    var cancelBarButtonItem : UIBarButtonItem!
//    取消单元格后响应的方法
    var selectionHandler: ((_ selectecItem: String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "Cell")
        cancelBarButtonItem = UIBarButtonItem(title: "取消", style: .plain, target: self, action:#selector(PopoverTableViewController.performCancel))
       self.navigationItem.leftBarButtonItem = cancelBarButtonItem
      
    }
    @objc func performCancel(){
        dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    获取行数据
    let selectedItem:String = items[indexPath.row]
//    执行回调方法
    selectionHandler?(selectedItem)
//    让自身消失
    dismiss(animated: true, completion: nil)
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
      
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return items.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath) as UITableViewCell
        cell.textLabel!.text = items[indexPath.row]
        return cell;
    }
    
}
