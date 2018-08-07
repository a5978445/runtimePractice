# runtimePractice
this is a runtime particle program


##TODO
1. 动态添加类方法，类成员变量
2. 研究 objc_setAssociatedObject对类内存大小的影响
3. 研究protocol 相关的方法
4. 撰写ivar 与内存相关的文章
5. 研究 ivar与  property之间的关系 （进一步剖析和理解ivar， property）
6. 利用kvc初始化对象


##complete
1. dynamic create class , add instance class method and ivar , 
2. use `resolveInstanceMethod` and `resolveClassMethod` dynamic add class method
3. use `forwardInvocation` realize dynamic message forwarding


##about Ivar 和 Property
1. what ivar
2. what property
3. The connection between the ivar and property