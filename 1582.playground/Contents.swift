// https://leetcode.com/problems/special-positions-in-a-binary-matrix/description/?envType=daily-question&envId=2023-12-12

class Solution {
    func numSpecial(_ mat: [[Int]]) -> Int {
        let rows = mat.count
        let columns = mat[0].count

        var specialPositions = 0
        for row in 0..<rows {
            for column in 0..<columns {
                if isPositionSpecial(row: row, column: column, matrix: mat) {
                    specialPositions += 1
                }
            }
        }

        return specialPositions
    }

    private func isPositionSpecial(row: Int, column: Int, matrix: [[Int]]) -> Bool {
        let element = matrix[row][column]
        guard element != 0 else {
            return false
        }

        let rows = matrix.count
        let columns = matrix[0].count

        // Searching row (fixed row, variable column)

        for j in 0..<columns {
            if j == column {
                continue
            }

            let neighboor = matrix[row][j]

            if neighboor != 0 {
                return false
            }
        }

        // Searching column (fixed column, variable rows)

        for i in 0..<rows {
            if i == row {
                continue
            }

            let neighboor = matrix[i][column]

            if neighboor != 0 {
                return false
            }
        }

        return true
    }
}

let mat1 = [[1,0,0],[0,0,1],[1,0,0]]
let output1 = 1

let mat2 = [[1,0,0],[0,1,0],[0,0,1]]
let output2 = 3
