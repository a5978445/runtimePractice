# runtimePractice
this is a runtime Practice project


## 功能
1. runtime register class
2. runtime add instance method
3. runtime add class method
4. runtime add property and ivar
5. message forward invocation
6. dynamic resolve
7. and so on about runtime

## about objc_setAssociatedObject method
内部存在一个hash biao ,类似于这样

```
{
   object: {
   
   				key : Association
   			}

}

Association(ploicy, value)
```

[Objective-C Associated Objects 的实现原理](http://blog.leichunfeng.com/blog/2015/06/26/objective-c-associated-objects-implementation-principle/)

