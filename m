Received: from zg8tmtu5ljg5lje1ms4xmtka.icoremail.net (zg8tmtu5ljg5lje1ms4xmtka.icoremail.net [159.89.151.119])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDA5139AF0
	for <llvm@lists.linux.dev>; Thu, 14 Mar 2024 05:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.89.151.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710395995; cv=none; b=RiMhz4a5WVbrPA5P6SLPRufT4zpyy7wIe2/nxNPez4+qppMdYxfLsTYwCk82r03UcTu56fQc6tOOklGyVSaaST3VMS3PzT1ZGgdZ4Fvl4SGmezjcz63mMTPUt7trKfgqRF6w9JbuIlUmq9aqNOX2YkbvtvjUzHEyoXfc8o3Et14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710395995; c=relaxed/simple;
	bh=1B4t1nZ+bMa1THF1ZkPv7BtvBPdoV1xxKH8iSMbROto=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q5iHCcXA6v9X2G0yJe4U1Sgnws6OvFYOXXTcUWXGHffml73/CPnJTfYIQEHZmMQYJdsMtXEKmX29m8c6OqeD9ClvV5YrtukSiDTQNlhKaL+qVxTbAqBrbEBZJWCjdb6fVb2aJ0gke0c8fuOdku0roMwW+wZayTlis+uYkosHuAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=159.89.151.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app2 (Coremail) with SMTP id HwEQrAC36cUgkvJl3uCpAA--.17451S2;
	Thu, 14 Mar 2024 13:58:56 +0800 (CST)
Received: from [172.19.193.108] (unknown [10.12.190.56])
	by gateway (Coremail) with SMTP id _____wCXkL8ckvJl0hP9AA--.49473S2;
	Thu, 14 Mar 2024 13:58:53 +0800 (CST)
Message-ID: <421183dd-73d4-43b1-bfb3-f7c7db7d82cb@hust.edu.cn>
Date: Thu, 14 Mar 2024 13:58:51 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/zh_CN: Add dev-tools/ubsan Chinese translation
To: Yanteng Si <siyanteng@loongson.cn>, Alex Shi <alexs@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Vegard Nossum <vegard.nossum@oracle.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20240302140058.1527765-1-dzm91@hust.edu.cn>
 <26730f76-871d-4a6d-8b16-ea3e52ef5357@loongson.cn>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <26730f76-871d-4a6d-8b16-ea3e52ef5357@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HwEQrAC36cUgkvJl3uCpAA--.17451S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW3WF1rCr1kGF15ArW7tw4UXFb_yoW7Kw15pr
	n5KFWxGrW8JryrJr1UKF15JFyjyr18A3ZrJrn2qF1jqF1qkr1Yqr12qryqgr9rWrW8AFy7
	JFnFgF42vr12k3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBjb7Iv0xC_tr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAac4AC62xK8x
	CEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0U
	Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VACjcxG62k0Y48FwI0_Gr1j6F4UJwAv7VCjz4
	8v1sIEY20_GFW3Jr1UJwAv7VCY1x0262k0Y48FwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWU
	JVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fZr
	1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
	0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jSeHDUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/

ping?

On 2024/3/6 17:15, Yanteng Si wrote:
>
> 在 2024/3/2 22:00, Dongliang Mu 写道:
>> Translate dev-tools/ubsan.rst into Chinese, add it into
>> zh_CN/dev-tools/index.rst.
>>
>> Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
>
> Reviewed-by: Yanteng Si <siyanteng@loongson.cn>
>
>
> Thanks,
>
> Yanteng
>
>> ---
>>   .../translations/zh_CN/dev-tools/index.rst    |  2 +-
>>   .../translations/zh_CN/dev-tools/ubsan.rst    | 91 +++++++++++++++++++
>>   2 files changed, 92 insertions(+), 1 deletion(-)
>>   create mode 100644 
>> Documentation/translations/zh_CN/dev-tools/ubsan.rst
>>
>> diff --git a/Documentation/translations/zh_CN/dev-tools/index.rst 
>> b/Documentation/translations/zh_CN/dev-tools/index.rst
>> index c2db3e566b1b..c4463f0750f0 100644
>> --- a/Documentation/translations/zh_CN/dev-tools/index.rst
>> +++ b/Documentation/translations/zh_CN/dev-tools/index.rst
>> @@ -22,13 +22,13 @@ 
>> Documentation/translations/zh_CN/dev-tools/testing-overview.rst
>>      sparse
>>      gcov
>>      kasan
>> +   ubsan
>>      gdb-kernel-debugging
>>
>>   Todolist:
>>
>>    - coccinelle
>>    - kcov
>> - - ubsan
>>    - kmemleak
>>    - kcsan
>>    - kfence
>> diff --git a/Documentation/translations/zh_CN/dev-tools/ubsan.rst 
>> b/Documentation/translations/zh_CN/dev-tools/ubsan.rst
>> new file mode 100644
>> index 000000000000..2487696b3772
>> --- /dev/null
>> +++ b/Documentation/translations/zh_CN/dev-tools/ubsan.rst
>> @@ -0,0 +1,91 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +.. include:: ../disclaimer-zh_CN.rst
>> +
>> +:Original: Documentation/dev-tools/ubsan.rst
>> +:Translator: Dongliang Mu <dzm91@hust.edu.cn>
>> +
>> +未定义行为消毒剂 - UBSAN
>> +====================================
>> +
>> +UBSAN是一种动态未定义行为检查工具。
>> +
>> +UBSAN使用编译时插桩捕捉未定义行为。编译器在可能导致未定义行为的操作前插入特定 
>>
>> +检测代码。如果检查失败，即检测到未定义行为，__ubsan_handle_* 
>> 函数将被调用打印
>> +错误信息。
>> +
>> +GCC自4.9.x [1_] （详见 ``-fsanitize=undefined`` 
>> 选项及其子选项）版本后引入这
>> +一特性。GCC 5.x 版本实现了更多检查器 [2_]。
>> +
>> +报告样例
>> +--------------
>> +
>> +::
>> +
>> + 
>> ================================================================================
>> +     UBSAN: Undefined behaviour in ../include/linux/bitops.h:110:33
>> +     shift exponent 32 is to large for 32-bit type 'unsigned int'
>> +     CPU: 0 PID: 0 Comm: swapper Not tainted 4.4.0-rc1+ #26
>> +      0000000000000000 ffffffff82403cc8 ffffffff815e6cd6 
>> 0000000000000001
>> +      ffffffff82403cf8 ffffffff82403ce0 ffffffff8163a5ed 
>> 0000000000000020
>> +      ffffffff82403d78 ffffffff8163ac2b ffffffff815f0001 
>> 0000000000000002
>> +     Call Trace:
>> +      [<ffffffff815e6cd6>] dump_stack+0x45/0x5f
>> +      [<ffffffff8163a5ed>] ubsan_epilogue+0xd/0x40
>> +      [<ffffffff8163ac2b>] 
>> __ubsan_handle_shift_out_of_bounds+0xeb/0x130
>> +      [<ffffffff815f0001>] ? radix_tree_gang_lookup_slot+0x51/0x150
>> +      [<ffffffff8173c586>] _mix_pool_bytes+0x1e6/0x480
>> +      [<ffffffff83105653>] ? dmi_walk_early+0x48/0x5c
>> +      [<ffffffff8173c881>] add_device_randomness+0x61/0x130
>> +      [<ffffffff83105b35>] ? dmi_save_one_device+0xaa/0xaa
>> +      [<ffffffff83105653>] dmi_walk_early+0x48/0x5c
>> +      [<ffffffff831066ae>] dmi_scan_machine+0x278/0x4b4
>> +      [<ffffffff8111d58a>] ? vprintk_default+0x1a/0x20
>> +      [<ffffffff830ad120>] ? early_idt_handler_array+0x120/0x120
>> +      [<ffffffff830b2240>] setup_arch+0x405/0xc2c
>> +      [<ffffffff830ad120>] ? early_idt_handler_array+0x120/0x120
>> +      [<ffffffff830ae053>] start_kernel+0x83/0x49a
>> +      [<ffffffff830ad120>] ? early_idt_handler_array+0x120/0x120
>> +      [<ffffffff830ad386>] x86_64_start_reservations+0x2a/0x2c
>> +      [<ffffffff830ad4f3>] x86_64_start_kernel+0x16b/0x17a
>> + 
>> ================================================================================
>> +
>> +用法
>> +-----
>> +
>> +使用如下内核配置启用UBSAN::
>> +
>> +    CONFIG_UBSAN=y
>> +
>> +使用如下内核配置检查整个内核::
>> +
>> +        CONFIG_UBSAN_SANITIZE_ALL=y
>> +
>> +为了在特定文件或目录启动代码插桩，需要在相应的内核Makefile中添加一行类似内容: 
>>
>> +
>> +- 单文件（如main.o）::
>> +
>> +    UBSAN_SANITIZE_main.o := y
>> +
>> +- 一个目录中的所有文件::
>> +
>> +    UBSAN_SANITIZE := y
>> +
>> +即使设置了``CONFIG_UBSAN_SANITIZE_ALL=y``，为了避免文件被插桩，可使用::
>> +
>> +  UBSAN_SANITIZE_main.o := n
>> +
>> +与::
>> +
>> +  UBSAN_SANITIZE := n
>> +
>> +未对齐的内存访问检测可通过开启独立选项 - CONFIG_UBSAN_ALIGNMENT 检测。
>> +该选项在支持未对齐访问的架构上(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y) 
>>
>> +默认为关闭。该选项仍可通过内核配置启用，但它将产生大量的UBSAN报告。
>> +
>> +参考文献
>> +----------
>> +
>> +.. _1: 
>> https://gcc.gnu.org/onlinedocs/gcc-4.9.0/gcc/Debugging-Options.html
>> +.. _2: https://gcc.gnu.org/onlinedocs/gcc/Debugging-Options.html
>> +.. _3: https://clang.llvm.org/docs/UndefinedBehaviorSanitizer.html
>> -- 
>> 2.39.2
>>
>>

