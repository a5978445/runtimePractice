# runtimePractice
this is a runtime particle program


##TODO



3. 研究protocol 相关的方法


##complete
1. dynamic create class , add instance class method and ivar , add class method 
2. use `resolveInstanceMethod` and `resolveClassMethod` dynamic add class method
3. use `forwardInvocation` realize dynamic message forwarding

4. about objc_setAssociatedObject method
内部存在一个hash biao ,类似于这样
{
   object: {
   
   				key : Association
   			}

}

Association(ploicy, value)

[Objective-C Associated Objects 的实现原理](http://blog.leichunfeng.com/blog/2015/06/26/objective-c-associated-objects-implementation-principle/)

5. relationship of ivar and object instance size 
6. relationship of ivar and  property
7. about kvc 
		- 他做了什么
		- 实现机制



##about Ivar 和 Property
1. what ivar
2. what property
3. The connection between the ivar and property