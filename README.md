# 汽车出租管理系统
说明：此项目来源于尚学堂的开源项目，在此用于练手，感谢尚学堂老师们的付出！


一、用到的技术：<br>
 &emsp; 1.整体架构使用ssm框架，使用maven管理整个项目，使用mvc三层架构，其中各个模块的作用：<br>
     &emsp;&emsp;（1）parent模块是其他所有模块的父工程，用于整和项目，管理依赖版本<br>
     &emsp;&emsp;（2）commons模块用于存放工具类<br>
     &emsp;&emsp;（3）bean模块用于存放数据库所映射的pojo类，依赖于commons模块<br>
     &emsp;&emsp;（4）manager-api模块用于存放service接口，依赖于bean模块<br>
     &emsp;&emsp;（5）manager-impl模块用于存放srvice接口的实现类、controller类以及逆向工程生成的mapper映射文件，依赖于manager-api模块<br>
     &emsp;&emsp;（6）main模块用于存放jsp页面以及ssm配置文件，依赖于manager-impl模块<br>
 &emsp; 2.前端页面使用layui和jsp，layui网址：https://www.layui.com/   <br>
 &emsp; 3.数据库使用mysql<br>
 &emsp;4.权限控制使用Shiro<br>
 
 二、更新：<br>
 &emsp; 1.2020-07-05<br>
 &emsp; &emsp; （1）新增客户管理页面，实现客户的增删改查<br>
 &emsp; &emsp; （2）新增车辆管理页面，实现车辆信息的增删改查以及查看车辆图片<br>
 &emsp; &emsp; （3）新增汽车出租页面，可根据用户id实现用户的租车业务，并将生成的租车单存入数据库<br>
 &emsp; 2.2020-07-08<br>
  &emsp; &emsp; （1）新增德鲁伊数据源追踪页面，实现数据追踪<br>
  &emsp; &emsp; （2）新增出租单管理页面，实现出租单的查删改<br>
  &emsp; &emsp; （3）新增检查单管理页面，实现检查单的增删改查<br>
  &emsp; &emsp; （4）新增客户源饼状图页面，可以根据饼状图数据对客户来源地区进行分析<br>
 &emsp; 2.2020-07-09<br>
 &emsp; &emsp; （1）新增业务员年度业务统计页面，可以根据柱状图查看业务员业绩<br>
 &emsp; &emsp; （2）新增公司年度月份销售额页面，可以根据线性图查看公司业绩<br>
 &emsp; &emsp; （3）新增导出客户信息到excel表格的功能<br>
 &emsp; &emsp; （3）新增导出出租单信息到excel表格的功能<br>
 &emsp; &emsp; （3）新增登录页面验证码验证功能<br>
# 至此，整个项目的业务流程已搭建完毕，后续有时间的话会进行优化
