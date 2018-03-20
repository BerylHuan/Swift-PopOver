

import UIKit

class ViewController: UIViewController ,UIPopoverPresentationControllerDelegate{
    var selectedItem: String?
    
    @IBOutlet weak var lab: UILabel!
    @IBOutlet weak var rightItem: UIBarButtonItem!
    
    lazy var popoverContentController: UINavigationController = {
        let controller = PopoverTableViewController(style : .plain)
        controller.selectionHandler = self.selectionHandler
        let navigationController = UINavigationController(rootViewController: controller)
        return navigationController
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
    }
    func selectionHandler(selectedItem: String){
        lab.text = "选中了-=\(selectedItem)=-这部漫画"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showPopover(_ sender: UIBarButtonItem) {

        self.popoverContentController.modalPresentationStyle = .popover
      self.popoverContentController.popoverPresentationController?.barButtonItem = rightItem
        self.present(self.popoverContentController, animated: true) {}
    }
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}

