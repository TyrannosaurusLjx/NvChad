import os
import numpy as np
import scipy as sp
import pandas as pd
import matplotlib.pyplot as plt
  
---
author: luojunxun
title: report-2024-12-11
tags: report
summary: final report of frontiers of mathmatics
id: 20241206092221
alias: 
---

# report-2024-12-11

## 注意事项


(1)读书报告的大致形式见附件。

(2)基本遗传算法的程序是与读书报告的内容相互独立的。

  ⚠️ 使用语言可以是Python、Matlab、C（C++）都可以。

  需要有一个文字文件来说明程序的大致框架、运行格式、以及最终运行结果（需要有运行结果的说明，可以截图来说明）。

(3)最终递交读书报告的纸质版需要与最终递交的电子版要一致。

(4)本学期期末需要递交的内容清单如下：

⭕️ 基本遗传算法的程度和文字说明，打包压缩，文件名为：学号姓名程序

⭕️ 读书报告最终电子版、读书报告PPT展示最终版、参考文献、如有程序代码，需要有相应程序代码文件及其相应的文字说明。将以上四部分（或无程序的是三部分）打包压缩，文件名为：学号姓名读书报告

⭕️读书报告最终版的纸质版。

⚠️ 以上要求每一位同学都必须递交的内容，如有缺少，则会扣除相应的成绩。

![report-2024-12-11](img/report-2024-12-11.png)

## 可能的问题

### 欺骗问题

在第一次报告中提到了遗传算法的欺骗问题, 具体来说, 就是在算法运行过程中, 一些优秀个体被过度选择, 导致种群多样性降低, 影响了算法的搜索能力, 使得算法陷入局部最优解

举一个例子

$$
f(x, y) =
\begin{cases}
    5 - x^2 - y^2 & |x|,|y| \leq \epsilon \\
    x^2 + y ^2 & \epsilon \leq  |x|,|y| \leq 2
\end{cases}
$$ 


#### 解决方法

- 精英保留策略

- 动态改变变异概率

    - 类似人类近亲繁殖的方式, 保持种群多样性

- 选择算子

    - 轮盘赌和锦标赛选择

- 适应度函数归一


### EM 算法的一个问题

[EM](20241205153949.md)

$$
Q(\theta, \theta^{(i)}) = E_{Z|X, \theta^{(i)}}[logL(\theta; X, Z)] = \sum_Z P(Z|X, \theta^{(i)})logL(\theta; X, Z)
$$ 







