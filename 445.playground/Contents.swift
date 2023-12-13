class ListNode {
    let val: Int
    var next: ListNode?

    init(_ val: Int = 0, next: ListNode? = nil) {
        self.val = val;
        self.next = next
    }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var stack1: [Int] = []
        var stack2: [Int] = []

        var current1 = l1
        var current2 = l2

        // Push the values from both lists onto their respective stacks
        while current1 != nil {
            stack1.append(current1!.val)
            current1 = current1!.next
        }

        while current2 != nil {
            stack2.append(current2!.val)
            current2 = current2!.next
        }

        var carry = 0
        var head: ListNode? = nil

        // Perform the addition operation using the stacks
        while !stack1.isEmpty || !stack2.isEmpty || carry != 0 {
            let sum = (stack1.popLast() ?? 0) + (stack2.popLast() ?? 0) + carry
            carry = sum / 10
            let newNode = ListNode(sum % 10)
            newNode.next = head
            head = newNode
        }

        return head
    }
}
