class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        let sortedNums = nums.sorted(by: >)
        return (sortedNums[0] - 1) * (sortedNums[1] - 1)
    }
}
