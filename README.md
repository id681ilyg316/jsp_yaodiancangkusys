## 本项目实现的最终作用是基于JSP在线药店仓库销售出入库综合管理平台
## 分为1个角色
### 第1个角色为管理员角色，实现了如下功能：
 - 仓库入库统计
 - 仓库出库统计
 - 仓库库存查询
 - 供应商信息管理
 - 修改登录密码
 - 出入库单据打印
 - 员工管理
 - 管理员登录
 - 药品信息管理
 - 药品销售管理
 - 采购单管理
## 数据库设计如下：
# 数据库设计文档

**数据库名：** yaodiancangkusys

**文档版本：** 


| 表名                  | 说明       |
| :---: | :---: |
| [t_admin](#t_admin) | 管理员表 |
| [t_catelog](#t_catelog) |  |
| [t_chuku](#t_chuku) |  |
| [t_chukumingxi](#t_chukumingxi) |  |
| [t_gongyingshang](#t_gongyingshang) |  |
| [t_goods](#t_goods) |  |
| [t_ruku](#t_ruku) |  |
| [t_rukumingxi](#t_rukumingxi) |  |
| [t_yuangong](#t_yuangong) |  |

**表名：** <a id="t_admin">t_admin</a>

**说明：** 管理员表

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | UserId |   int   | 10 |   0    |    N     |  Y   |       | 用户ID  |
|  2   | username |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 用户名  |
|  3   | userPw |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 密码  |

**表名：** <a id="t_catelog">t_catelog</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   int   | 10 |   0    |    N     |  Y   |       | 自增主键  |
|  2   | name |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 名字  |
|  3   | del |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 是否删除  |

**表名：** <a id="t_chuku">t_chuku</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   int   | 10 |   0    |    N     |  Y   |       | 自增主键  |
|  2   | danjuhao |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  3   | shijian |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 时间  |
|  4   | zongjiage |   int   | 10 |   0    |    Y     |  N   |   NULL    |   |
|  5   | jingshouren |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  6   | beizhu |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 备注  |
|  7   | del |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 是否删除  |

**表名：** <a id="t_chukumingxi">t_chukumingxi</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   int   | 10 |   0    |    N     |  Y   |       | 自增主键  |
|  2   | chuku_id |   int   | 10 |   0    |    Y     |  N   |   NULL    |   |
|  3   | goods_id |   int   | 10 |   0    |    Y     |  N   |   NULL    | 商品ID  |
|  4   | shuliang |   int   | 10 |   0    |    Y     |  N   |   NULL    |   |
|  5   | beizhu |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 备注  |

**表名：** <a id="t_gongyingshang">t_gongyingshang</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   int   | 10 |   0    |    N     |  Y   |       | 自增主键  |
|  2   | mingcheng |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 名称  |
|  3   | dizhi |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 地址  |
|  4   | lianxiren |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  5   | dianhua |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 电话  |
|  6   | youbian |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  7   | chuanzhen |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  8   | youxiang |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 邮箱  |
|  9   | del |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 是否删除  |

**表名：** <a id="t_goods">t_goods</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   int   | 10 |   0    |    N     |  Y   |       | 自增主键  |
|  2   | catelog_id |   int   | 10 |   0    |    Y     |  N   |   NULL    |   |
|  3   | name |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 名字  |
|  4   | chandi |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  5   | danwei |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  6   | baozhiqi |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  7   | beizhu |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 备注  |
|  8   | del |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 是否删除  |

**表名：** <a id="t_ruku">t_ruku</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   int   | 10 |   0    |    N     |  Y   |       | 自增主键  |
|  2   | danjuhao |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  3   | shijian |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 时间  |
|  4   | zongjiage |   int   | 10 |   0    |    Y     |  N   |   NULL    |   |
|  5   | jingshouren |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  6   | beizhu |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 备注  |
|  7   | del |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 是否删除  |

**表名：** <a id="t_rukumingxi">t_rukumingxi</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   int   | 10 |   0    |    N     |  Y   |       | 自增主键  |
|  2   | ruku_id |   int   | 10 |   0    |    Y     |  N   |   NULL    |   |
|  3   | goods_id |   int   | 10 |   0    |    Y     |  N   |   NULL    | 商品ID  |
|  4   | shuliang |   int   | 10 |   0    |    Y     |  N   |   NULL    |   |
|  5   | beizhu |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 备注  |

**表名：** <a id="t_yuangong">t_yuangong</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   int   | 10 |   0    |    N     |  Y   |       | 自增主键  |
|  2   | name |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 名字  |
|  3   | sex |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 性别  |
|  4   | age |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 年龄  |
|  5   | tel |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 电话  |
|  6   | ADDRESS |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 地址  |
|  7   | zhiwei |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 职位  |
|  8   | quanxian |   int   | 10 |   0    |    Y     |  N   |   NULL    |   |
|  9   | loginName |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  10   | loginPw |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  11   | del |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 是否删除  |

**运行不出来可以微信 javape 我的公众号：源码码头**
