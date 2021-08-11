# Angr 模版

## 通用

```python
import angr


def main():
    p = angr.Project("ch23.bin")
    # 创建一个Angr工程,可以追加参数：load_options={"auto_load_libs": False}
    # auto_load_libs 设置是否自动载入依赖的库，如果设置为 True 的话会自动载入依赖的库
    # 然后分析到库函数调用时也会进入库函数，这样会增加分析的工作量，也有能会跑挂

    state = p.factory.entry_state(add_options=angr.options.unicorn)
    # 获取入口函数，也可以指定某个地址
    sm = p.factory.simgr(state)
    # 在入口准备开始符号执行
    sm.explore(find=0x00008634, avoid=[0x00008644, 0x000084E8])
    # 遍历可能的路径并找到成功的那条路径
    # 最终想找到的路径是0x804868B，要避开的路径是0x804869E，这里可以写多个avoid，用[]
    print(sm.found[0].posix.dumps(0))
    # 返回当前状态输入 dumps(0)表示输入


if __name__ == '__main__':
    main()

```

## 注意

```python
还可以设置 angr 的选项，使用 unicorn 引擎来做模拟执行

p = angr.Project(xxx’)

#对于 c++ 的程序，如果调用了 c++ 的函数，使用 full_init_state
state = p.factory.full_init_state(add_options=angr.options.unicorn)

#state = p.factory.entry_state(add_options=angr.options.unicorn)
```

