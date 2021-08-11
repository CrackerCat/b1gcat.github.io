# IDA.idc sample



## 打印地址

```c
#include <idc.idc>

static main() {
    auto start = 0x08049155;
    auto length= 0x19;
    auto i;
    
    for (i=0; i<0x19; i++) {
        Message("%02x", Byte(start + i));
    }
}
```

