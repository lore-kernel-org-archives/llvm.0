Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3BCA951
	for <llvm@lists.linux.dev>; Thu, 16 Mar 2023 19:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678994878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fImmudqQAPvp2eH+ams2dZTbGBMnPVYB7oFFavPP6G0=;
	b=DtSj7XO13lmzBXsX39mFE/mFOMqMhV1523YDaax9lzmZa3uBv11KlIb0hMi/mpz+jxe8S/
	PMfWTFIW9SbMeDtmmhAPc3kE+5+fLoxn+HRXoaTBhEpwe9dVKnqyhOXeGuBACCfkKGowiv
	veFIZ4AVsDKLP+UKeg18e9Lx9XK9Tfo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-n-kSo0fSNVCjoBbCylLlhg-1; Thu, 16 Mar 2023 15:27:56 -0400
X-MC-Unique: n-kSo0fSNVCjoBbCylLlhg-1
Received: by mail-wm1-f69.google.com with SMTP id s18-20020a7bc392000000b003deaf780ab6so1075518wmj.4
        for <llvm@lists.linux.dev>; Thu, 16 Mar 2023 12:27:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678994875;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fImmudqQAPvp2eH+ams2dZTbGBMnPVYB7oFFavPP6G0=;
        b=12Kx2qMvXp1LxqHWn4r2xCyDg8PICbI7+2cW4B/0jIygbv6o21hjNsk4AVOM0w04BA
         RSS6tPKIhVdoQk+mbPvMdvxehSrOSvKRsmDKLAF0qBvYMkrtAKF/7HtbVuq88U8qqxj8
         iaivZOfzHRSz0okPiaOv6whVWJ14A6jIHlmhda2JagrySU+UbbIRaJFjw14lNtAnf03q
         tCbfM96PKagele40L6LIWgZe7cRXPZsD3Xb3QJKfBbHiqZ7UxWTC3uWPYUDZ1q4+U3Gd
         c8/YEuKyvI7oloUOEAdhwXFtCWYQzqTh/UGx7kV4I3rJSl0NGlox9HoW1Wn7cTJcuXpE
         q4xw==
X-Gm-Message-State: AO0yUKUvNMMF0mV4oAznx1jHOqJ5vsf3FprY0LRKYyv7cIpp98+SRUej
	daGdn5H3h7Cuoyo3PcrYjx36VcE99GAxrDBGgZQJ0Th4gIBHaHFPcwMXNJ+QZ3Hyr6Dqje27QRT
	7FNjCsEX9ds/9mAQ8zMWcWAE=
X-Received: by 2002:a05:600c:3504:b0:3ea:d620:579b with SMTP id h4-20020a05600c350400b003ead620579bmr21505822wmq.0.1678994874868;
        Thu, 16 Mar 2023 12:27:54 -0700 (PDT)
X-Google-Smtp-Source: AK7set8GTV1DoOllsX0AKCvswWCH0RB+DuRNDWXRXkuarNCjDhhMAZ/dFIMlYk71EyW2UfWPqkJXag==
X-Received: by 2002:a05:600c:3504:b0:3ea:d620:579b with SMTP id h4-20020a05600c350400b003ead620579bmr21505796wmq.0.1678994874208;
        Thu, 16 Mar 2023 12:27:54 -0700 (PDT)
Received: from [192.168.0.159] (185-219-167-205-static.vivo.cz. [185.219.167.205])
        by smtp.gmail.com with ESMTPSA id v7-20020a05600c214700b003eaf666cbe0sm5792052wml.27.2023.03.16.12.27.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 12:27:54 -0700 (PDT)
Message-ID: <d03f403d-242f-6de2-3420-c5021f42df50@redhat.com>
Date: Thu, 16 Mar 2023 20:27:48 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [linux-next:master 3796/4036]
 kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type
 'struct module'
To: Nathan Chancellor <nathan@kernel.org>, kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>,
 Alexei Starovoitov <ast@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>
References: <202303161404.OrmfCy09-lkp@intel.com>
 <20230316151434.GA1276310@dev-arch.thelio-3990X>
From: Viktor Malik <vmalik@redhat.com>
In-Reply-To: <20230316151434.GA1276310@dev-arch.thelio-3990X>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/16/23 16:14, Nathan Chancellor wrote:
> On Thu, Mar 16, 2023 at 02:59:48PM +0800, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>> head:   6f72958a49f68553f2b6ff713e8c8e51a34c1e1e
>> commit: 2a6427ca8f3a8f08498c7b60e486c95af88d0afd [3796/4036] bpf: Fix attaching fentry/fexit/fmod_ret/lsm to modules
>> config: riscv-randconfig-r042-20230313 (https://download.01.org/0day-ci/archive/20230316/202303161404.OrmfCy09-lkp@intel.com/config)
>> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
>> reproduce (this is a W=1 build):
>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # install riscv cross compiling tool for clang build
>>          # apt-get install binutils-riscv64-linux-gnu
>>          # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=2a6427ca8f3a8f08498c7b60e486c95af88d0afd
>>          git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>>          git fetch --no-tags linux-next master
>>          git checkout 2a6427ca8f3a8f08498c7b60e486c95af88d0afd
>>          # save the config file
>>          mkdir build_dir && cp config build_dir/.config
>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash kernel/
>>
>> If you fix the issue, kindly add following tag where applicable
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Link: https://lore.kernel.org/oe-kbuild-all/202303161404.OrmfCy09-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
>>
>>     In file included from kernel/bpf/verifier.c:27:
>>>> kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type 'struct module'
>>             list_for_each_entry_rcu(mod, &modules, list,
>>             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>     include/linux/rculist.h:391:13: note: expanded from macro 'list_for_each_entry_rcu'
>>                  pos = list_entry_rcu((head)->next, typeof(*pos), member);  \
>>                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>     include/linux/rculist.h:307:2: note: expanded from macro 'list_entry_rcu'
>>             container_of(READ_ONCE(ptr), type, member)
>>             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>     include/linux/container_of.h:20:47: note: expanded from macro 'container_of'
>>             static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>>             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
>>     include/linux/compiler_types.h:340:74: note: expanded from macro '__same_type'
>>     #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
>>                                                                              ^
>>     include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
>>     #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
>>                                      ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
>>     include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
>>     #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>>                                                            ^~~~
>>     include/linux/printk.h:348:8: note: forward declaration of 'struct module'
>>     struct module;
>>            ^
>>     In file included from kernel/bpf/verifier.c:27:
>>>> kernel/bpf/../module/internal.h:212:2: error: offsetof of incomplete type 'typeof (*mod)' (aka 'struct module')
>>             list_for_each_entry_rcu(mod, &modules, list,
>>             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>     include/linux/rculist.h:391:13: note: expanded from macro 'list_for_each_entry_rcu'
>>                  pos = list_entry_rcu((head)->next, typeof(*pos), member);  \
>>                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>     include/linux/rculist.h:307:2: note: expanded from macro 'list_entry_rcu'
>>             container_of(READ_ONCE(ptr), type, member)
>>             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>     include/linux/container_of.h:23:21: note: expanded from macro 'container_of'
>>             ((type *)(__mptr - offsetof(type, member))); })
>>                                ^~~~~~~~~~~~~~~~~~~~~~
>>     include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
>>     #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
>>                                     ^                  ~~~~
>>     include/linux/printk.h:348:8: note: forward declaration of 'struct module'
>>     struct module;
>>            ^
>>     In file included from kernel/bpf/verifier.c:27:
>>>> kernel/bpf/../module/internal.h:212:2: error: assigning to 'struct module *' from incompatible type 'void'
>>             list_for_each_entry_rcu(mod, &modules, list,
>>             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>     include/linux/rculist.h:391:11: note: expanded from macro 'list_for_each_entry_rcu'
>>                  pos = list_entry_rcu((head)->next, typeof(*pos), member);  \
>>                      ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>     In file included from kernel/bpf/verifier.c:27:
>>>> kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type 'struct module'
>>             list_for_each_entry_rcu(mod, &modules, list,
>>             ^                       ~~~
>>     include/linux/rculist.h:392:7: note: expanded from macro 'list_for_each_entry_rcu'
>>                     &pos->member != (head);                                 \
>>                      ~~~^
>>     include/linux/printk.h:348:8: note: forward declaration of 'struct module'
>>     struct module;
>>            ^
>>     In file included from kernel/bpf/verifier.c:27:
>>>> kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type 'struct module'
>>             list_for_each_entry_rcu(mod, &modules, list,
>>             ^                       ~~~
>>     include/linux/rculist.h:393:27: note: expanded from macro 'list_for_each_entry_rcu'
>>                     pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>>                                          ~~~^
>>     include/linux/rculist.h:307:25: note: expanded from macro 'list_entry_rcu'
>>             container_of(READ_ONCE(ptr), type, member)
>>                                    ^~~
>>     include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
>>             compiletime_assert_rwonce_type(x);                              \
>>                                            ^
>>     note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
>>     include/linux/compiler_types.h:387:23: note: expanded from macro '_compiletime_assert'
>>             __compiletime_assert(condition, msg, prefix, suffix)
>>                                  ^~~~~~~~~
>>     include/linux/compiler_types.h:379:9: note: expanded from macro '__compiletime_assert'
>>                     if (!(condition))                                       \
>>                           ^~~~~~~~~
>>     include/linux/container_of.h:19:26: note: expanded from macro 'container_of'
>>             void *__mptr = (void *)(ptr);                                   \
>>                                     ^~~
>>     include/linux/printk.h:348:8: note: forward declaration of 'struct module'
>>     struct module;
>>            ^
>>     In file included from kernel/bpf/verifier.c:27:
>>>> kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type 'struct module'
>>             list_for_each_entry_rcu(mod, &modules, list,
>>             ^                       ~~~
>>     include/linux/rculist.h:393:27: note: expanded from macro 'list_for_each_entry_rcu'
>>                     pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>>                                          ~~~^
>>     include/linux/rculist.h:307:25: note: expanded from macro 'list_entry_rcu'
>>             container_of(READ_ONCE(ptr), type, member)
>>                                    ^~~
>>     include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
>>             compiletime_assert_rwonce_type(x);                              \
>>                                            ^
>>     note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
>>     include/linux/compiler_types.h:387:23: note: expanded from macro '_compiletime_assert'
>>             __compiletime_assert(condition, msg, prefix, suffix)
>>                                  ^~~~~~~~~
>>     include/linux/compiler_types.h:379:9: note: expanded from macro '__compiletime_assert'
>>                     if (!(condition))                                       \
>>                           ^~~~~~~~~
>>     include/linux/container_of.h:19:26: note: expanded from macro 'container_of'
>>             void *__mptr = (void *)(ptr);                                   \
>>                                     ^~~
>>     include/linux/printk.h:348:8: note: forward declaration of 'struct module'
>>     struct module;
>>            ^
>>     In file included from kernel/bpf/verifier.c:27:
>>>> kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type 'struct module'
>>             list_for_each_entry_rcu(mod, &modules, list,
>>             ^                       ~~~
>>     include/linux/rculist.h:393:27: note: expanded from macro 'list_for_each_entry_rcu'
>>                     pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>>                                          ~~~^
>>     include/linux/rculist.h:307:25: note: expanded from macro 'list_entry_rcu'
>>             container_of(READ_ONCE(ptr), type, member)
>>                                    ^~~
>>     include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
>>             compiletime_assert_rwonce_type(x);                              \
>>                                            ^
>>     note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
>>     include/linux/compiler_types.h:387:23: note: expanded from macro '_compiletime_assert'
>>             __compiletime_assert(condition, msg, prefix, suffix)
>>                                  ^~~~~~~~~
>>     include/linux/compiler_types.h:379:9: note: expanded from macro '__compiletime_assert'
>>                     if (!(condition))                                       \
>>                           ^~~~~~~~~
>>     include/linux/container_of.h:19:26: note: expanded from macro 'container_of'
>>             void *__mptr = (void *)(ptr);                                   \
>>                                     ^~~
>>     include/linux/printk.h:348:8: note: forward declaration of 'struct module'
>>     struct module;
>>            ^
>>     In file included from kernel/bpf/verifier.c:27:
>>>> kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type 'struct module'
>>             list_for_each_entry_rcu(mod, &modules, list,
>>             ^                       ~~~
>>     include/linux/rculist.h:393:27: note: expanded from macro 'list_for_each_entry_rcu'
>>                     pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>>                                          ~~~^
>>     include/linux/rculist.h:307:25: note: expanded from macro 'list_entry_rcu'
>>             container_of(READ_ONCE(ptr), type, member)
>>                                    ^~~
>>     include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
>>             compiletime_assert_rwonce_type(x);                              \
>>                                            ^
>>     note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
>>     include/linux/compiler_types.h:387:23: note: expanded from macro '_compiletime_assert'
>>             __compiletime_assert(condition, msg, prefix, suffix)
>>                                  ^~~~~~~~~
>>     include/linux/compiler_types.h:379:9: note: expanded from macro '__compiletime_assert'
>>                     if (!(condition))                                       \
>>                           ^~~~~~~~~
>>     include/linux/container_of.h:19:26: note: expanded from macro 'container_of'
>>             void *__mptr = (void *)(ptr);                                   \
>>                                     ^~~
>>     include/linux/printk.h:348:8: note: forward declaration of 'struct module'
>>     struct module;
>>            ^
>>     In file included from kernel/bpf/verifier.c:27:
>>>> kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type 'struct module'
>>             list_for_each_entry_rcu(mod, &modules, list,
>>             ^                       ~~~
>>     include/linux/rculist.h:393:27: note: expanded from macro 'list_for_each_entry_rcu'
>>                     pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>>                                          ~~~^
>>     include/linux/rculist.h:307:25: note: expanded from macro 'list_entry_rcu'
>>             container_of(READ_ONCE(ptr), type, member)
>>                                    ^~~
>>     include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
>>             compiletime_assert_rwonce_type(x);                              \
>>                                            ^
>>     note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
>>     include/linux/compiler_types.h:387:23: note: expanded from macro '_compiletime_assert'
>>             __compiletime_assert(condition, msg, prefix, suffix)
>>                                  ^~~~~~~~~
>>     include/linux/compiler_types.h:379:9: note: expanded from macro '__compiletime_assert'
>>                     if (!(condition))                                       \
>>                           ^~~~~~~~~
>>     include/linux/container_of.h:19:26: note: expanded from macro 'container_of'
>>             void *__mptr = (void *)(ptr);                                   \
>>                                     ^~~
>>     include/linux/printk.h:348:8: note: forward declaration of 'struct module'
>>     struct module;
>>            ^
>>     In file included from kernel/bpf/verifier.c:27:
>>>> kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type 'struct module'
>>             list_for_each_entry_rcu(mod, &modules, list,
>>             ^                       ~~~
>>     include/linux/rculist.h:393:27: note: expanded from macro 'list_for_each_entry_rcu'
>>                     pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>>                                          ~~~^
>>     include/linux/rculist.h:307:25: note: expanded from macro 'list_entry_rcu'
>>             container_of(READ_ONCE(ptr), type, member)
>>                                    ^~~
>>     include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
>>             __READ_ONCE(x);                                                 \
>>                         ^
>>     include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
>>     #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
>>                                                                      ^
>>     include/linux/compiler_types.h:355:13: note: expanded from macro '__unqual_scalar_typeof'
>>                     _Generic((x),                                           \
>>                               ^
>>     include/linux/container_of.h:19:26: note: expanded from macro 'container_of'
>>             void *__mptr = (void *)(ptr);                                   \
>>                                     ^~~
>>     include/linux/printk.h:348:8: note: forward declaration of 'struct module'
>>     struct module;
>>            ^
>>     In file included from kernel/bpf/verifier.c:27:
>>>> kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type 'struct module'
>>             list_for_each_entry_rcu(mod, &modules, list,
>>             ^                       ~~~
>>     include/linux/rculist.h:393:27: note: expanded from macro 'list_for_each_entry_rcu'
>>                     pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>>                                          ~~~^
>>     include/linux/rculist.h:307:25: note: expanded from macro 'list_entry_rcu'
>>             container_of(READ_ONCE(ptr), type, member)
>>                                    ^~~
>>     include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
>>             __READ_ONCE(x);                                                 \
>>                         ^
>>     include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
>>     #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
>>                                                                      ^
>>     include/linux/compiler_types.h:362:15: note: expanded from macro '__unqual_scalar_typeof'
>>                              default: (x)))
>>                                        ^
>>     include/linux/container_of.h:19:26: note: expanded from macro 'container_of'
>>             void *__mptr = (void *)(ptr);                                   \
>>                                     ^~~
>>     include/linux/printk.h:348:8: note: forward declaration of 'struct module'
>>     struct module;
>>            ^
>>     In file included from kernel/bpf/verifier.c:27:
>>>> kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type 'struct module'
>>             list_for_each_entry_rcu(mod, &modules, list,
>>             ^                       ~~~
>>     include/linux/rculist.h:393:27: note: expanded from macro 'list_for_each_entry_rcu'
>>                     pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>>                                          ~~~^
>>     include/linux/rculist.h:307:25: note: expanded from macro 'list_entry_rcu'
>>             container_of(READ_ONCE(ptr), type, member)
>>                                    ^~~
>>     include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
>>             __READ_ONCE(x);                                                 \
>>                         ^
>>     include/asm-generic/rwonce.h:44:72: note: expanded from macro '__READ_ONCE'
>>     #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
>>                                                                             ^
>>     include/linux/container_of.h:19:26: note: expanded from macro 'container_of'
>>             void *__mptr = (void *)(ptr);                                   \
>>                                     ^~~
>>     include/linux/printk.h:348:8: note: forward declaration of 'struct module'
>>     struct module;
>>            ^
>>     In file included from kernel/bpf/verifier.c:27:
>>>> kernel/bpf/../module/internal.h:212:2: error: operand of type 'void' where arithmetic or pointer type is required
>>             list_for_each_entry_rcu(mod, &modules, list,
>>             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>     include/linux/rculist.h:393:9: note: expanded from macro 'list_for_each_entry_rcu'
>>                     pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>>                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>     include/linux/rculist.h:307:2: note: expanded from macro 'list_entry_rcu'
>>             container_of(READ_ONCE(ptr), type, member)
>>             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>     include/linux/container_of.h:19:25: note: expanded from macro 'container_of'
>>             void *__mptr = (void *)(ptr);                                   \
>>                                    ^~~~~
>>     In file included from kernel/bpf/verifier.c:27:
>>>> kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type 'struct module'
>>             list_for_each_entry_rcu(mod, &modules, list,
>>             ^                       ~~~
>>     include/linux/rculist.h:393:27: note: expanded from macro 'list_for_each_entry_rcu'
>>                     pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>>                                          ~~~^
>>     include/linux/rculist.h:307:25: note: expanded from macro 'list_entry_rcu'
>>             container_of(READ_ONCE(ptr), type, member)
>>                                    ^~~
>>     include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
>>             compiletime_assert_rwonce_type(x);                              \
>>                                            ^
>>     note: (skipping 6 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
>>     include/linux/compiler_types.h:340:63: note: expanded from macro '__same_type'
>>     #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
>>                                                                   ^
>>     include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
>>     #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
>>                                                      ^~~~
>>     include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
>>     #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>>                                                            ^~~~
>>     include/linux/printk.h:348:8: note: forward declaration of 'struct module'
>>     struct module;
>>            ^
>>     In file included from kernel/bpf/verifier.c:27:
>>>> kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type 'struct module'
>>             list_for_each_entry_rcu(mod, &modules, list,
>>             ^                       ~~~
>>     include/linux/rculist.h:393:27: note: expanded from macro 'list_for_each_entry_rcu'
>>                     pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>>                                          ~~~^
>>     include/linux/rculist.h:307:25: note: expanded from macro 'list_entry_rcu'
>>             container_of(READ_ONCE(ptr), type, member)
>>                                    ^~~
>>     include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
>>             compiletime_assert_rwonce_type(x);                              \
>>                                            ^
>>     note: (skipping 6 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
>>     include/linux/compiler_types.h:340:63: note: expanded from macro '__same_type'
>>     #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
>>                                                                   ^
>>     include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
>>     #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
>>                                                      ^~~~
>>     include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
>>     #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>>                                                            ^~~~
>>     include/linux/printk.h:348:8: note: forward declaration of 'struct module'
>>     struct module;
>>            ^
>>     In file included from kernel/bpf/verifier.c:27:
>>>> kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type 'struct module'
>>             list_for_each_entry_rcu(mod, &modules, list,
>>             ^                       ~~~
>>     include/linux/rculist.h:393:27: note: expanded from macro 'list_for_each_entry_rcu'
>>                     pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>>                                          ~~~^
>>     include/linux/rculist.h:307:25: note: expanded from macro 'list_entry_rcu'
>>             container_of(READ_ONCE(ptr), type, member)
>>                                    ^~~
>>     include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
>>             compiletime_assert_rwonce_type(x);                              \
>>                                            ^
>>     note: (skipping 6 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
>>     include/linux/compiler_types.h:340:63: note: expanded from macro '__same_type'
>>     #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
>>                                                                   ^
>>     include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
>>     #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
>>                                                      ^~~~
>>     include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
>>     #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>>                                                            ^~~~
>>     include/linux/printk.h:348:8: note: forward declaration of 'struct module'
>>     struct module;
>>            ^
>>     In file included from kernel/bpf/verifier.c:27:
>>>> kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type 'struct module'
>>             list_for_each_entry_rcu(mod, &modules, list,
>>             ^                       ~~~
>>     include/linux/rculist.h:393:27: note: expanded from macro 'list_for_each_entry_rcu'
>>                     pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>>                                          ~~~^
>>     include/linux/rculist.h:307:25: note: expanded from macro 'list_entry_rcu'
>>             container_of(READ_ONCE(ptr), type, member)
>>                                    ^~~
>>     include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
>>             compiletime_assert_rwonce_type(x);                              \
>>                                            ^
>>     note: (skipping 6 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
>>     include/linux/compiler_types.h:340:63: note: expanded from macro '__same_type'
>>     #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
>>                                                                   ^
>>     include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
>>     #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
>>                                                      ^~~~
>>     include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
>>     #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>>                                                            ^~~~
>>     include/linux/printk.h:348:8: note: forward declaration of 'struct module'
>>     struct module;
>>            ^
>>     In file included from kernel/bpf/verifier.c:27:
>>>> kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type 'struct module'
>>             list_for_each_entry_rcu(mod, &modules, list,
>>             ^                       ~~~
>>     include/linux/rculist.h:393:27: note: expanded from macro 'list_for_each_entry_rcu'
>>                     pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>>                                          ~~~^
>>     include/linux/rculist.h:307:25: note: expanded from macro 'list_entry_rcu'
>>             container_of(READ_ONCE(ptr), type, member)
>>                                    ^~~
>>     include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
>>             compiletime_assert_rwonce_type(x);                              \
>>                                            ^
>>     note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
>>     include/linux/compiler_types.h:340:63: note: expanded from macro '__same_type'
>>     #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
>>                                                                   ^
>>     include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
>>     #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
>>                                                      ^~~~
>>     include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
>>     #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>>                                                            ^~~~
>>     include/linux/printk.h:348:8: note: forward declaration of 'struct module'
>>     struct module;
>>            ^
>>     In file included from kernel/bpf/verifier.c:27:
>>>> kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type 'struct module'
>>             list_for_each_entry_rcu(mod, &modules, list,
>>             ^                       ~~~
>>     include/linux/rculist.h:393:27: note: expanded from macro 'list_for_each_entry_rcu'
>>                     pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>>                                          ~~~^
>>     include/linux/rculist.h:307:25: note: expanded from macro 'list_entry_rcu'
>>             container_of(READ_ONCE(ptr), type, member)
>>                                    ^~~
>>     include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
>>             __READ_ONCE(x);                                                 \
>>                         ^
>>     note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
>>     include/linux/compiler_types.h:340:63: note: expanded from macro '__same_type'
>>     #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
>>                                                                   ^
>>     include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
>>     #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
>>                                                      ^~~~
>>     include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
>>     #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>>                                                            ^~~~
>>     include/linux/printk.h:348:8: note: forward declaration of 'struct module'
>>     struct module;
>>            ^
>>     fatal error: too many errors emitted, stopping now [-ferror-limit=]
>>     20 errors generated.
>>
>>
>> vim +212 kernel/bpf/../module/internal.h
>>
>> 58d208de3e8d87 Aaron Tomlin     2022-03-22  204
>> 58d208de3e8d87 Aaron Tomlin     2022-03-22  205  static inline void mod_tree_insert(struct module *mod) { }
>> 58d208de3e8d87 Aaron Tomlin     2022-03-22  206  static inline void mod_tree_remove_init(struct module *mod) { }
>> 58d208de3e8d87 Aaron Tomlin     2022-03-22  207  static inline void mod_tree_remove(struct module *mod) { }
>> 446d55666d5599 Christophe Leroy 2022-02-23  208  static inline struct module *mod_find(unsigned long addr, struct mod_tree_root *tree)
>> 58d208de3e8d87 Aaron Tomlin     2022-03-22  209  {
>> 58d208de3e8d87 Aaron Tomlin     2022-03-22  210  	struct module *mod;
>> 58d208de3e8d87 Aaron Tomlin     2022-03-22  211
>> 58d208de3e8d87 Aaron Tomlin     2022-03-22 @212  	list_for_each_entry_rcu(mod, &modules, list,
>> 58d208de3e8d87 Aaron Tomlin     2022-03-22  213  				lockdep_is_held(&module_mutex)) {
>> 58d208de3e8d87 Aaron Tomlin     2022-03-22  214  		if (within_module(addr, mod))
>> 58d208de3e8d87 Aaron Tomlin     2022-03-22  215  			return mod;
>> 58d208de3e8d87 Aaron Tomlin     2022-03-22  216  	}
>> 58d208de3e8d87 Aaron Tomlin     2022-03-22  217
>> 58d208de3e8d87 Aaron Tomlin     2022-03-22  218  	return NULL;
>> 58d208de3e8d87 Aaron Tomlin     2022-03-22  219  }
>> 58d208de3e8d87 Aaron Tomlin     2022-03-22  220  #endif /* CONFIG_MODULES_TREE_LOOKUP */
>> b33465fe9c52a3 Aaron Tomlin     2022-03-22  221
>>
>> :::::: The code at line 212 was first introduced by commit
>> :::::: 58d208de3e8d87dbe196caf0b57cc58c7a3836ca module: Move latched RB-tree support to a separate file
>>
>> :::::: TO: Aaron Tomlin <atomlin@redhat.com>
>> :::::: CC: Luis Chamberlain <mcgrof@kernel.org>
> 
> This is not a clang specific error, I see it with GCC 12.2.0:
> 
> $ make -skj"$(nproc)" ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- O=build aspeed_g5_defconfig kernel/bpf/verifier.o
> In file included from ../include/linux/container_of.h:5,
>                   from ../include/linux/list.h:5,
>                   from ../include/linux/timer.h:5,
>                   from ../include/linux/workqueue.h:9,
>                   from ../include/linux/bpf.h:10,
>                   from ../include/linux/bpf-cgroup.h:5,
>                   from ../kernel/bpf/verifier.c:7:
> ../kernel/bpf/../module/internal.h: In function 'mod_find':
> ../include/linux/container_of.h:20:54: error: invalid use of undefined type 'struct module'
>     20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>        |                                                      ^~
> ../include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
>     78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>        |                                                        ^~~~
> ../include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
>     20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>        |         ^~~~~~~~~~~~~
> ../include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
>     20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>        |                       ^~~~~~~~~~~
> ../include/linux/rculist.h:307:9: note: in expansion of macro 'container_of'
>    307 |         container_of(READ_ONCE(ptr), type, member)
>        |         ^~~~~~~~~~~~
> ../include/linux/rculist.h:391:20: note: in expansion of macro 'list_entry_rcu'
>    391 |              pos = list_entry_rcu((head)->next, typeof(*pos), member);  \
>        |                    ^~~~~~~~~~~~~~
> ../kernel/bpf/../module/internal.h:212:9: note: in expansion of macro 'list_for_each_entry_rcu'
>    212 |         list_for_each_entry_rcu(mod, &modules, list,
>        |         ^~~~~~~~~~~~~~~~~~~~~~~
> ./../include/linux/compiler_types.h:340:27: error: expression in static assertion is not an integer
>    340 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
>        |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
>     78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>        |                                                        ^~~~
> ../include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
>     20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>        |         ^~~~~~~~~~~~~
> ../include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
>     20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>        |                       ^~~~~~~~~~~
> ../include/linux/rculist.h:307:9: note: in expansion of macro 'container_of'
>    307 |         container_of(READ_ONCE(ptr), type, member)
>        |         ^~~~~~~~~~~~
> ../include/linux/rculist.h:391:20: note: in expansion of macro 'list_entry_rcu'
>    391 |              pos = list_entry_rcu((head)->next, typeof(*pos), member);  \
>        |                    ^~~~~~~~~~~~~~
> ../kernel/bpf/../module/internal.h:212:9: note: in expansion of macro 'list_for_each_entry_rcu'
>    212 |         list_for_each_entry_rcu(mod, &modules, list,
>        |         ^~~~~~~~~~~~~~~~~~~~~~~
> In file included from ../include/uapi/linux/posix_types.h:5,
>                   from ../include/uapi/linux/types.h:14,
>                   from ../include/linux/types.h:6,
>                   from ../include/uapi/linux/btf.h:6,
>                   from ../kernel/bpf/verifier.c:6:
> ../include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct module'
>     16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
>        |                                 ^~~~~~~~~~~~~~~~~~
> ../include/linux/container_of.h:23:28: note: in expansion of macro 'offsetof'
>     23 |         ((type *)(__mptr - offsetof(type, member))); })
>        |                            ^~~~~~~~
> ../include/linux/rculist.h:307:9: note: in expansion of macro 'container_of'
>    307 |         container_of(READ_ONCE(ptr), type, member)
>        |         ^~~~~~~~~~~~
> ../include/linux/rculist.h:391:20: note: in expansion of macro 'list_entry_rcu'
>    391 |              pos = list_entry_rcu((head)->next, typeof(*pos), member);  \
>        |                    ^~~~~~~~~~~~~~
> ../kernel/bpf/../module/internal.h:212:9: note: in expansion of macro 'list_for_each_entry_rcu'
>    212 |         list_for_each_entry_rcu(mod, &modules, list,
>        |         ^~~~~~~~~~~~~~~~~~~~~~~
> In file included from ../include/linux/pid.h:5,
>                   from ../include/linux/sched.h:14,
>                   from ../include/linux/sched/mm.h:7,
>                   from ../include/linux/xarray.h:19,
>                   from ../include/linux/radix-tree.h:21,
>                   from ../include/linux/idr.h:15,
>                   from ../include/linux/kernfs.h:12,
>                   from ../include/linux/sysfs.h:16,
>                   from ../include/linux/kobject.h:20,
>                   from ../include/linux/module.h:21,
>                   from ../include/linux/bpf.h:20:
> ../include/linux/rculist.h:392:21: error: invalid use of undefined type 'struct module'
>    392 |                 &pos->member != (head);                                 \
>        |                     ^~
> ../kernel/bpf/../module/internal.h:212:9: note: in expansion of macro 'list_for_each_entry_rcu'
>    212 |         list_for_each_entry_rcu(mod, &modules, list,
>        |         ^~~~~~~~~~~~~~~~~~~~~~~
> ../include/linux/rculist.h:393:41: error: invalid use of undefined type 'struct module'
>    393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>        |                                         ^~
> ../include/linux/container_of.h:19:33: note: in definition of macro 'container_of'
>     19 |         void *__mptr = (void *)(ptr);                                   \
>        |                                 ^~~
> ./../include/linux/compiler_types.h:387:9: note: in expansion of macro '__compiletime_assert'
>    387 |         __compiletime_assert(condition, msg, prefix, suffix)
>        |         ^~~~~~~~~~~~~~~~~~~~
> ./../include/linux/compiler_types.h:399:9: note: in expansion of macro '_compiletime_assert'
>    399 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>        |         ^~~~~~~~~~~~~~~~~~~
> ../include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
>     36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
>        |         ^~~~~~~~~~~~~~~~~~
> ../include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
>     36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
>        |                            ^~~~~~~~~~~~~
> ../include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
>     49 |         compiletime_assert_rwonce_type(x);                              \
>        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../include/linux/rculist.h:307:22: note: in expansion of macro 'READ_ONCE'
>    307 |         container_of(READ_ONCE(ptr), type, member)
>        |                      ^~~~~~~~~
> ../include/linux/rculist.h:393:23: note: in expansion of macro 'list_entry_rcu'
>    393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>        |                       ^~~~~~~~~~~~~~
> ../kernel/bpf/../module/internal.h:212:9: note: in expansion of macro 'list_for_each_entry_rcu'
>    212 |         list_for_each_entry_rcu(mod, &modules, list,
>        |         ^~~~~~~~~~~~~~~~~~~~~~~
> ../include/linux/rculist.h:393:41: error: invalid use of undefined type 'struct module'
>    393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>        |                                         ^~
> ../include/linux/container_of.h:19:33: note: in definition of macro 'container_of'
>     19 |         void *__mptr = (void *)(ptr);                                   \
>        |                                 ^~~
> ./../include/linux/compiler_types.h:387:9: note: in expansion of macro '__compiletime_assert'
>    387 |         __compiletime_assert(condition, msg, prefix, suffix)
>        |         ^~~~~~~~~~~~~~~~~~~~
> ./../include/linux/compiler_types.h:399:9: note: in expansion of macro '_compiletime_assert'
>    399 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>        |         ^~~~~~~~~~~~~~~~~~~
> ../include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
>     36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
>        |         ^~~~~~~~~~~~~~~~~~
> ../include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
>     36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
>        |                            ^~~~~~~~~~~~~
> ../include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
>     49 |         compiletime_assert_rwonce_type(x);                              \
>        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../include/linux/rculist.h:307:22: note: in expansion of macro 'READ_ONCE'
>    307 |         container_of(READ_ONCE(ptr), type, member)
>        |                      ^~~~~~~~~
> ../include/linux/rculist.h:393:23: note: in expansion of macro 'list_entry_rcu'
>    393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>        |                       ^~~~~~~~~~~~~~
> ../kernel/bpf/../module/internal.h:212:9: note: in expansion of macro 'list_for_each_entry_rcu'
>    212 |         list_for_each_entry_rcu(mod, &modules, list,
>        |         ^~~~~~~~~~~~~~~~~~~~~~~
> ../include/linux/rculist.h:393:41: error: invalid use of undefined type 'struct module'
>    393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>        |                                         ^~
> ../include/linux/container_of.h:19:33: note: in definition of macro 'container_of'
>     19 |         void *__mptr = (void *)(ptr);                                   \
>        |                                 ^~~
> ./../include/linux/compiler_types.h:387:9: note: in expansion of macro '__compiletime_assert'
>    387 |         __compiletime_assert(condition, msg, prefix, suffix)
>        |         ^~~~~~~~~~~~~~~~~~~~
> ./../include/linux/compiler_types.h:399:9: note: in expansion of macro '_compiletime_assert'
>    399 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>        |         ^~~~~~~~~~~~~~~~~~~
> ../include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
>     36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
>        |         ^~~~~~~~~~~~~~~~~~
> ../include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
>     36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
>        |                            ^~~~~~~~~~~~~
> ../include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
>     49 |         compiletime_assert_rwonce_type(x);                              \
>        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../include/linux/rculist.h:307:22: note: in expansion of macro 'READ_ONCE'
>    307 |         container_of(READ_ONCE(ptr), type, member)
>        |                      ^~~~~~~~~
> ../include/linux/rculist.h:393:23: note: in expansion of macro 'list_entry_rcu'
>    393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>        |                       ^~~~~~~~~~~~~~
> ../kernel/bpf/../module/internal.h:212:9: note: in expansion of macro 'list_for_each_entry_rcu'
>    212 |         list_for_each_entry_rcu(mod, &modules, list,
>        |         ^~~~~~~~~~~~~~~~~~~~~~~
> ../include/linux/rculist.h:393:41: error: invalid use of undefined type 'struct module'
>    393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>        |                                         ^~
> ../include/linux/container_of.h:19:33: note: in definition of macro 'container_of'
>     19 |         void *__mptr = (void *)(ptr);                                   \
>        |                                 ^~~
> ./../include/linux/compiler_types.h:387:9: note: in expansion of macro '__compiletime_assert'
>    387 |         __compiletime_assert(condition, msg, prefix, suffix)
>        |         ^~~~~~~~~~~~~~~~~~~~
> ./../include/linux/compiler_types.h:399:9: note: in expansion of macro '_compiletime_assert'
>    399 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>        |         ^~~~~~~~~~~~~~~~~~~
> ../include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
>     36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
>        |         ^~~~~~~~~~~~~~~~~~
> ../include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
>     36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
>        |                            ^~~~~~~~~~~~~
> ../include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
>     49 |         compiletime_assert_rwonce_type(x);                              \
>        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../include/linux/rculist.h:307:22: note: in expansion of macro 'READ_ONCE'
>    307 |         container_of(READ_ONCE(ptr), type, member)
>        |                      ^~~~~~~~~
> ../include/linux/rculist.h:393:23: note: in expansion of macro 'list_entry_rcu'
>    393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>        |                       ^~~~~~~~~~~~~~
> ../kernel/bpf/../module/internal.h:212:9: note: in expansion of macro 'list_for_each_entry_rcu'
>    212 |         list_for_each_entry_rcu(mod, &modules, list,
>        |         ^~~~~~~~~~~~~~~~~~~~~~~
> ../include/linux/rculist.h:393:41: error: invalid use of undefined type 'struct module'
>    393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>        |                                         ^~
> ../include/linux/container_of.h:19:33: note: in definition of macro 'container_of'
>     19 |         void *__mptr = (void *)(ptr);                                   \
>        |                                 ^~~
> ./../include/linux/compiler_types.h:387:9: note: in expansion of macro '__compiletime_assert'
>    387 |         __compiletime_assert(condition, msg, prefix, suffix)
>        |         ^~~~~~~~~~~~~~~~~~~~
> ./../include/linux/compiler_types.h:399:9: note: in expansion of macro '_compiletime_assert'
>    399 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>        |         ^~~~~~~~~~~~~~~~~~~
> ../include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
>     36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
>        |         ^~~~~~~~~~~~~~~~~~
> ../include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
>     49 |         compiletime_assert_rwonce_type(x);                              \
>        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../include/linux/rculist.h:307:22: note: in expansion of macro 'READ_ONCE'
>    307 |         container_of(READ_ONCE(ptr), type, member)
>        |                      ^~~~~~~~~
> ../include/linux/rculist.h:393:23: note: in expansion of macro 'list_entry_rcu'
>    393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>        |                       ^~~~~~~~~~~~~~
> ../kernel/bpf/../module/internal.h:212:9: note: in expansion of macro 'list_for_each_entry_rcu'
>    212 |         list_for_each_entry_rcu(mod, &modules, list,
>        |         ^~~~~~~~~~~~~~~~~~~~~~~
> ../include/linux/rculist.h:393:41: error: invalid use of undefined type 'struct module'
>    393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>        |                                         ^~
> ../include/linux/container_of.h:19:33: note: in definition of macro 'container_of'
>     19 |         void *__mptr = (void *)(ptr);                                   \
>        |                                 ^~~
> ../include/asm-generic/rwonce.h:44:43: note: in expansion of macro '__unqual_scalar_typeof'
>     44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
>        |                                           ^~~~~~~~~~~~~~~~~~~~~~
> ../include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
>     50 |         __READ_ONCE(x);                                                 \
>        |         ^~~~~~~~~~~
> ../include/linux/rculist.h:307:22: note: in expansion of macro 'READ_ONCE'
>    307 |         container_of(READ_ONCE(ptr), type, member)
>        |                      ^~~~~~~~~
> ../include/linux/rculist.h:393:23: note: in expansion of macro 'list_entry_rcu'
>    393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>        |                       ^~~~~~~~~~~~~~
> ../kernel/bpf/../module/internal.h:212:9: note: in expansion of macro 'list_for_each_entry_rcu'
>    212 |         list_for_each_entry_rcu(mod, &modules, list,
>        |         ^~~~~~~~~~~~~~~~~~~~~~~
> ../include/linux/rculist.h:393:41: error: invalid use of undefined type 'struct module'
>    393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>        |                                         ^~
> ../include/linux/container_of.h:19:33: note: in definition of macro 'container_of'
>     19 |         void *__mptr = (void *)(ptr);                                   \
>        |                                 ^~~
> ../include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
>     50 |         __READ_ONCE(x);                                                 \
>        |         ^~~~~~~~~~~
> ../include/linux/rculist.h:307:22: note: in expansion of macro 'READ_ONCE'
>    307 |         container_of(READ_ONCE(ptr), type, member)
>        |                      ^~~~~~~~~
> ../include/linux/rculist.h:393:23: note: in expansion of macro 'list_entry_rcu'
>    393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>        |                       ^~~~~~~~~~~~~~
> ../kernel/bpf/../module/internal.h:212:9: note: in expansion of macro 'list_for_each_entry_rcu'
>    212 |         list_for_each_entry_rcu(mod, &modules, list,
>        |         ^~~~~~~~~~~~~~~~~~~~~~~
> ../include/linux/rculist.h:393:41: error: invalid use of undefined type 'struct module'
>    393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>        |                                         ^~
> ../include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
>     78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>        |                                                        ^~~~
> ../include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
>     20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>        |         ^~~~~~~~~~~~~
> ../include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
>     20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>        |                       ^~~~~~~~~~~
> ../include/linux/rculist.h:307:9: note: in expansion of macro 'container_of'
>    307 |         container_of(READ_ONCE(ptr), type, member)
>        |         ^~~~~~~~~~~~
> ./../include/linux/compiler_types.h:387:9: note: in expansion of macro '__compiletime_assert'
>    387 |         __compiletime_assert(condition, msg, prefix, suffix)
>        |         ^~~~~~~~~~~~~~~~~~~~
> ./../include/linux/compiler_types.h:399:9: note: in expansion of macro '_compiletime_assert'
>    399 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>        |         ^~~~~~~~~~~~~~~~~~~
> ../include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
>     36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
>        |         ^~~~~~~~~~~~~~~~~~
> ../include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
>     36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
>        |                            ^~~~~~~~~~~~~
> ../include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
>     49 |         compiletime_assert_rwonce_type(x);                              \
>        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../include/linux/rculist.h:307:22: note: in expansion of macro 'READ_ONCE'
>    307 |         container_of(READ_ONCE(ptr), type, member)
>        |                      ^~~~~~~~~
> ../include/linux/rculist.h:393:23: note: in expansion of macro 'list_entry_rcu'
>    393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>        |                       ^~~~~~~~~~~~~~
> ../kernel/bpf/../module/internal.h:212:9: note: in expansion of macro 'list_for_each_entry_rcu'
>    212 |         list_for_each_entry_rcu(mod, &modules, list,
>        |         ^~~~~~~~~~~~~~~~~~~~~~~
> ../include/linux/rculist.h:393:41: error: invalid use of undefined type 'struct module'
>    393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>        |                                         ^~
> ../include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
>     78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>        |                                                        ^~~~
> ../include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
>     20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>        |         ^~~~~~~~~~~~~
> ../include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
>     20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>        |                       ^~~~~~~~~~~
> ../include/linux/rculist.h:307:9: note: in expansion of macro 'container_of'
>    307 |         container_of(READ_ONCE(ptr), type, member)
>        |         ^~~~~~~~~~~~
> ./../include/linux/compiler_types.h:387:9: note: in expansion of macro '__compiletime_assert'
>    387 |         __compiletime_assert(condition, msg, prefix, suffix)
>        |         ^~~~~~~~~~~~~~~~~~~~
> ./../include/linux/compiler_types.h:399:9: note: in expansion of macro '_compiletime_assert'
>    399 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>        |         ^~~~~~~~~~~~~~~~~~~
> ../include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
>     36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
>        |         ^~~~~~~~~~~~~~~~~~
> ../include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
>     36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
>        |                            ^~~~~~~~~~~~~
> ../include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
>     49 |         compiletime_assert_rwonce_type(x);                              \
>        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../include/linux/rculist.h:307:22: note: in expansion of macro 'READ_ONCE'
>    307 |         container_of(READ_ONCE(ptr), type, member)
>        |                      ^~~~~~~~~
> ../include/linux/rculist.h:393:23: note: in expansion of macro 'list_entry_rcu'
>    393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>        |                       ^~~~~~~~~~~~~~
> ../kernel/bpf/../module/internal.h:212:9: note: in expansion of macro 'list_for_each_entry_rcu'
>    212 |         list_for_each_entry_rcu(mod, &modules, list,
>        |         ^~~~~~~~~~~~~~~~~~~~~~~
> ../include/linux/rculist.h:393:41: error: invalid use of undefined type 'struct module'
>    393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>        |                                         ^~
> ../include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
>     78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>        |                                                        ^~~~
> ../include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
>     20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>        |         ^~~~~~~~~~~~~
> ../include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
>     20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>        |                       ^~~~~~~~~~~
> ../include/linux/rculist.h:307:9: note: in expansion of macro 'container_of'
>    307 |         container_of(READ_ONCE(ptr), type, member)
>        |         ^~~~~~~~~~~~
> ./../include/linux/compiler_types.h:387:9: note: in expansion of macro '__compiletime_assert'
>    387 |         __compiletime_assert(condition, msg, prefix, suffix)
>        |         ^~~~~~~~~~~~~~~~~~~~
> ./../include/linux/compiler_types.h:399:9: note: in expansion of macro '_compiletime_assert'
>    399 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>        |         ^~~~~~~~~~~~~~~~~~~
> ../include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
>     36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
>        |         ^~~~~~~~~~~~~~~~~~
> ../include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
>     36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
>        |                            ^~~~~~~~~~~~~
> ../include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
>     49 |         compiletime_assert_rwonce_type(x);                              \
>        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../include/linux/rculist.h:307:22: note: in expansion of macro 'READ_ONCE'
>    307 |         container_of(READ_ONCE(ptr), type, member)
>        |                      ^~~~~~~~~
> ../include/linux/rculist.h:393:23: note: in expansion of macro 'list_entry_rcu'
>    393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>        |                       ^~~~~~~~~~~~~~
> ../kernel/bpf/../module/internal.h:212:9: note: in expansion of macro 'list_for_each_entry_rcu'
>    212 |         list_for_each_entry_rcu(mod, &modules, list,
>        |         ^~~~~~~~~~~~~~~~~~~~~~~
> ../include/linux/rculist.h:393:41: error: invalid use of undefined type 'struct module'
>    393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>        |                                         ^~
> ../include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
>     78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>        |                                                        ^~~~
> ../include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
>     20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>        |         ^~~~~~~~~~~~~
> ../include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
>     20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>        |                       ^~~~~~~~~~~
> ../include/linux/rculist.h:307:9: note: in expansion of macro 'container_of'
>    307 |         container_of(READ_ONCE(ptr), type, member)
>        |         ^~~~~~~~~~~~
> ./../include/linux/compiler_types.h:387:9: note: in expansion of macro '__compiletime_assert'
>    387 |         __compiletime_assert(condition, msg, prefix, suffix)
>        |         ^~~~~~~~~~~~~~~~~~~~
> ./../include/linux/compiler_types.h:399:9: note: in expansion of macro '_compiletime_assert'
>    399 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>        |         ^~~~~~~~~~~~~~~~~~~
> ../include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
>     36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
>        |         ^~~~~~~~~~~~~~~~~~
> ../include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
>     36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
>        |                            ^~~~~~~~~~~~~
> ../include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
>     49 |         compiletime_assert_rwonce_type(x);                              \
>        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../include/linux/rculist.h:307:22: note: in expansion of macro 'READ_ONCE'
>    307 |         container_of(READ_ONCE(ptr), type, member)
>        |                      ^~~~~~~~~
> ../include/linux/rculist.h:393:23: note: in expansion of macro 'list_entry_rcu'
>    393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>        |                       ^~~~~~~~~~~~~~
> ../kernel/bpf/../module/internal.h:212:9: note: in expansion of macro 'list_for_each_entry_rcu'
>    212 |         list_for_each_entry_rcu(mod, &modules, list,
>        |         ^~~~~~~~~~~~~~~~~~~~~~~
> ../include/linux/rculist.h:393:41: error: invalid use of undefined type 'struct module'
>    393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>        |                                         ^~
> ../include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
>     78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>        |                                                        ^~~~
> ../include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
>     20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>        |         ^~~~~~~~~~~~~
> ../include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
>     20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>        |                       ^~~~~~~~~~~
> ../include/linux/rculist.h:307:9: note: in expansion of macro 'container_of'
>    307 |         container_of(READ_ONCE(ptr), type, member)
>        |         ^~~~~~~~~~~~
> ./../include/linux/compiler_types.h:387:9: note: in expansion of macro '__compiletime_assert'
>    387 |         __compiletime_assert(condition, msg, prefix, suffix)
>        |         ^~~~~~~~~~~~~~~~~~~~
> ./../include/linux/compiler_types.h:399:9: note: in expansion of macro '_compiletime_assert'
>    399 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>        |         ^~~~~~~~~~~~~~~~~~~
> ../include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
>     36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
>        |         ^~~~~~~~~~~~~~~~~~
> ../include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
>     49 |         compiletime_assert_rwonce_type(x);                              \
>        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../include/linux/rculist.h:307:22: note: in expansion of macro 'READ_ONCE'
>    307 |         container_of(READ_ONCE(ptr), type, member)
>        |                      ^~~~~~~~~
> ../include/linux/rculist.h:393:23: note: in expansion of macro 'list_entry_rcu'
>    393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>        |                       ^~~~~~~~~~~~~~
> ../kernel/bpf/../module/internal.h:212:9: note: in expansion of macro 'list_for_each_entry_rcu'
>    212 |         list_for_each_entry_rcu(mod, &modules, list,
>        |         ^~~~~~~~~~~~~~~~~~~~~~~
> ../include/linux/rculist.h:393:41: error: invalid use of undefined type 'struct module'
>    393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>        |                                         ^~
> ../include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
>     78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>        |                                                        ^~~~
> ../include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
>     20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>        |         ^~~~~~~~~~~~~
> ../include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
>     20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>        |                       ^~~~~~~~~~~
> ../include/linux/rculist.h:307:9: note: in expansion of macro 'container_of'
>    307 |         container_of(READ_ONCE(ptr), type, member)
>        |         ^~~~~~~~~~~~
> ../include/asm-generic/rwonce.h:44:43: note: in expansion of macro '__unqual_scalar_typeof'
>     44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
>        |                                           ^~~~~~~~~~~~~~~~~~~~~~
> ../include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
>     50 |         __READ_ONCE(x);                                                 \
>        |         ^~~~~~~~~~~
> ../include/linux/rculist.h:307:22: note: in expansion of macro 'READ_ONCE'
>    307 |         container_of(READ_ONCE(ptr), type, member)
>        |                      ^~~~~~~~~
> ../include/linux/rculist.h:393:23: note: in expansion of macro 'list_entry_rcu'
>    393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>        |                       ^~~~~~~~~~~~~~
> ../kernel/bpf/../module/internal.h:212:9: note: in expansion of macro 'list_for_each_entry_rcu'
>    212 |         list_for_each_entry_rcu(mod, &modules, list,
>        |         ^~~~~~~~~~~~~~~~~~~~~~~
> ../include/linux/rculist.h:393:41: error: invalid use of undefined type 'struct module'
>    393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>        |                                         ^~
> ../include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
>     78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>        |                                                        ^~~~
> ../include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
>     20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>        |         ^~~~~~~~~~~~~
> ../include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
>     20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>        |                       ^~~~~~~~~~~
> ../include/linux/rculist.h:307:9: note: in expansion of macro 'container_of'
>    307 |         container_of(READ_ONCE(ptr), type, member)
>        |         ^~~~~~~~~~~~
> ../include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
>     50 |         __READ_ONCE(x);                                                 \
>        |         ^~~~~~~~~~~
> ../include/linux/rculist.h:307:22: note: in expansion of macro 'READ_ONCE'
>    307 |         container_of(READ_ONCE(ptr), type, member)
>        |                      ^~~~~~~~~
> ../include/linux/rculist.h:393:23: note: in expansion of macro 'list_entry_rcu'
>    393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>        |                       ^~~~~~~~~~~~~~
> ../kernel/bpf/../module/internal.h:212:9: note: in expansion of macro 'list_for_each_entry_rcu'
>    212 |         list_for_each_entry_rcu(mod, &modules, list,
>        |         ^~~~~~~~~~~~~~~~~~~~~~~
> ../include/linux/container_of.h:20:54: error: invalid use of undefined type 'struct module'
>     20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>        |                                                      ^~
> ../include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
>     78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>        |                                                        ^~~~
> ../include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
>     20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>        |         ^~~~~~~~~~~~~
> ../include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
>     20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>        |                       ^~~~~~~~~~~
> ../include/linux/rculist.h:307:9: note: in expansion of macro 'container_of'
>    307 |         container_of(READ_ONCE(ptr), type, member)
>        |         ^~~~~~~~~~~~
> ../include/linux/rculist.h:393:23: note: in expansion of macro 'list_entry_rcu'
>    393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>        |                       ^~~~~~~~~~~~~~
> ../kernel/bpf/../module/internal.h:212:9: note: in expansion of macro 'list_for_each_entry_rcu'
>    212 |         list_for_each_entry_rcu(mod, &modules, list,
>        |         ^~~~~~~~~~~~~~~~~~~~~~~
> ../include/linux/rculist.h:393:41: error: invalid use of undefined type 'struct module'
>    393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>        |                                         ^~
> ../include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
>     78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>        |                                                        ^~~~
> ../include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
>     20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>        |         ^~~~~~~~~~~~~
> ../include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
>     21 |                       __same_type(*(ptr), void),                        \
>        |                       ^~~~~~~~~~~
> ../include/linux/rculist.h:307:9: note: in expansion of macro 'container_of'
>    307 |         container_of(READ_ONCE(ptr), type, member)
>        |         ^~~~~~~~~~~~
> ./../include/linux/compiler_types.h:387:9: note: in expansion of macro '__compiletime_assert'
>    387 |         __compiletime_assert(condition, msg, prefix, suffix)
>        |         ^~~~~~~~~~~~~~~~~~~~
> ./../include/linux/compiler_types.h:399:9: note: in expansion of macro '_compiletime_assert'
>    399 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>        |         ^~~~~~~~~~~~~~~~~~~
> ../include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
>     36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
>        |         ^~~~~~~~~~~~~~~~~~
> ../include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
>     36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
>        |                            ^~~~~~~~~~~~~
> ../include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
>     49 |         compiletime_assert_rwonce_type(x);                              \
>        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../include/linux/rculist.h:307:22: note: in expansion of macro 'READ_ONCE'
>    307 |         container_of(READ_ONCE(ptr), type, member)
>        |                      ^~~~~~~~~
> ../include/linux/rculist.h:393:23: note: in expansion of macro 'list_entry_rcu'
>    393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>        |                       ^~~~~~~~~~~~~~
> ../kernel/bpf/../module/internal.h:212:9: note: in expansion of macro 'list_for_each_entry_rcu'
>    212 |         list_for_each_entry_rcu(mod, &modules, list,
>        |         ^~~~~~~~~~~~~~~~~~~~~~~
> ../include/linux/rculist.h:393:41: error: invalid use of undefined type 'struct module'
>    393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>        |                                         ^~
> ../include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
>     78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>        |                                                        ^~~~
> ../include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
>     20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>        |         ^~~~~~~~~~~~~
> ../include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
>     21 |                       __same_type(*(ptr), void),                        \
>        |                       ^~~~~~~~~~~
> ../include/linux/rculist.h:307:9: note: in expansion of macro 'container_of'
>    307 |         container_of(READ_ONCE(ptr), type, member)
>        |         ^~~~~~~~~~~~
> ./../include/linux/compiler_types.h:387:9: note: in expansion of macro '__compiletime_assert'
>    387 |         __compiletime_assert(condition, msg, prefix, suffix)
>        |         ^~~~~~~~~~~~~~~~~~~~
> ./../include/linux/compiler_types.h:399:9: note: in expansion of macro '_compiletime_assert'
>    399 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>        |         ^~~~~~~~~~~~~~~~~~~
> ../include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
>     36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
>        |         ^~~~~~~~~~~~~~~~~~
> ../include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
>     36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
>        |                            ^~~~~~~~~~~~~
> ../include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
>     49 |         compiletime_assert_rwonce_type(x);                              \
>        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../include/linux/rculist.h:307:22: note: in expansion of macro 'READ_ONCE'
>    307 |         container_of(READ_ONCE(ptr), type, member)
>        |                      ^~~~~~~~~
> ../include/linux/rculist.h:393:23: note: in expansion of macro 'list_entry_rcu'
>    393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>        |                       ^~~~~~~~~~~~~~
> ../kernel/bpf/../module/internal.h:212:9: note: in expansion of macro 'list_for_each_entry_rcu'
>    212 |         list_for_each_entry_rcu(mod, &modules, list,
>        |         ^~~~~~~~~~~~~~~~~~~~~~~
> ../include/linux/rculist.h:393:41: error: invalid use of undefined type 'struct module'
>    393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>        |                                         ^~
> ../include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
>     78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>        |                                                        ^~~~
> ../include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
>     20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>        |         ^~~~~~~~~~~~~
> ../include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
>     21 |                       __same_type(*(ptr), void),                        \
>        |                       ^~~~~~~~~~~
> ../include/linux/rculist.h:307:9: note: in expansion of macro 'container_of'
>    307 |         container_of(READ_ONCE(ptr), type, member)
>        |         ^~~~~~~~~~~~
> ./../include/linux/compiler_types.h:387:9: note: in expansion of macro '__compiletime_assert'
>    387 |         __compiletime_assert(condition, msg, prefix, suffix)
>        |         ^~~~~~~~~~~~~~~~~~~~
> ./../include/linux/compiler_types.h:399:9: note: in expansion of macro '_compiletime_assert'
>    399 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>        |         ^~~~~~~~~~~~~~~~~~~
> ../include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
>     36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
>        |         ^~~~~~~~~~~~~~~~~~
> ../include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
>     36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
>        |                            ^~~~~~~~~~~~~
> ../include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
>     49 |         compiletime_assert_rwonce_type(x);                              \
>        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../include/linux/rculist.h:307:22: note: in expansion of macro 'READ_ONCE'
>    307 |         container_of(READ_ONCE(ptr), type, member)
>        |                      ^~~~~~~~~
> ../include/linux/rculist.h:393:23: note: in expansion of macro 'list_entry_rcu'
>    393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>        |                       ^~~~~~~~~~~~~~
> ../kernel/bpf/../module/internal.h:212:9: note: in expansion of macro 'list_for_each_entry_rcu'
>    212 |         list_for_each_entry_rcu(mod, &modules, list,
>        |         ^~~~~~~~~~~~~~~~~~~~~~~
> ../include/linux/rculist.h:393:41: error: invalid use of undefined type 'struct module'
>    393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>        |                                         ^~
> ../include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
>     78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>        |                                                        ^~~~
> ../include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
>     20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>        |         ^~~~~~~~~~~~~
> ../include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
>     21 |                       __same_type(*(ptr), void),                        \
>        |                       ^~~~~~~~~~~
> ../include/linux/rculist.h:307:9: note: in expansion of macro 'container_of'
>    307 |         container_of(READ_ONCE(ptr), type, member)
>        |         ^~~~~~~~~~~~
> ./../include/linux/compiler_types.h:387:9: note: in expansion of macro '__compiletime_assert'
>    387 |         __compiletime_assert(condition, msg, prefix, suffix)
>        |         ^~~~~~~~~~~~~~~~~~~~
> ./../include/linux/compiler_types.h:399:9: note: in expansion of macro '_compiletime_assert'
>    399 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>        |         ^~~~~~~~~~~~~~~~~~~
> ../include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
>     36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
>        |         ^~~~~~~~~~~~~~~~~~
> ../include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
>     36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
>        |                            ^~~~~~~~~~~~~
> ../include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
>     49 |         compiletime_assert_rwonce_type(x);                              \
>        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../include/linux/rculist.h:307:22: note: in expansion of macro 'READ_ONCE'
>    307 |         container_of(READ_ONCE(ptr), type, member)
>        |                      ^~~~~~~~~
> ../include/linux/rculist.h:393:23: note: in expansion of macro 'list_entry_rcu'
>    393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>        |                       ^~~~~~~~~~~~~~
> ../kernel/bpf/../module/internal.h:212:9: note: in expansion of macro 'list_for_each_entry_rcu'
>    212 |         list_for_each_entry_rcu(mod, &modules, list,
>        |         ^~~~~~~~~~~~~~~~~~~~~~~
> ../include/linux/rculist.h:393:41: error: invalid use of undefined type 'struct module'
>    393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>        |                                         ^~
> ../include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
>     78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>        |                                                        ^~~~
> ../include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
>     20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>        |         ^~~~~~~~~~~~~
> ../include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
>     21 |                       __same_type(*(ptr), void),                        \
>        |                       ^~~~~~~~~~~
> ../include/linux/rculist.h:307:9: note: in expansion of macro 'container_of'
>    307 |         container_of(READ_ONCE(ptr), type, member)
>        |         ^~~~~~~~~~~~
> ./../include/linux/compiler_types.h:387:9: note: in expansion of macro '__compiletime_assert'
>    387 |         __compiletime_assert(condition, msg, prefix, suffix)
>        |         ^~~~~~~~~~~~~~~~~~~~
> ./../include/linux/compiler_types.h:399:9: note: in expansion of macro '_compiletime_assert'
>    399 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>        |         ^~~~~~~~~~~~~~~~~~~
> ../include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
>     36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
>        |         ^~~~~~~~~~~~~~~~~~
> ../include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
>     49 |         compiletime_assert_rwonce_type(x);                              \
>        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../include/linux/rculist.h:307:22: note: in expansion of macro 'READ_ONCE'
>    307 |         container_of(READ_ONCE(ptr), type, member)
>        |                      ^~~~~~~~~
> ../include/linux/rculist.h:393:23: note: in expansion of macro 'list_entry_rcu'
>    393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>        |                       ^~~~~~~~~~~~~~
> ../kernel/bpf/../module/internal.h:212:9: note: in expansion of macro 'list_for_each_entry_rcu'
>    212 |         list_for_each_entry_rcu(mod, &modules, list,
>        |         ^~~~~~~~~~~~~~~~~~~~~~~
> ../include/linux/rculist.h:393:41: error: invalid use of undefined type 'struct module'
>    393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>        |                                         ^~
> ../include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
>     78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>        |                                                        ^~~~
> ../include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
>     20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>        |         ^~~~~~~~~~~~~
> ../include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
>     21 |                       __same_type(*(ptr), void),                        \
>        |                       ^~~~~~~~~~~
> ../include/linux/rculist.h:307:9: note: in expansion of macro 'container_of'
>    307 |         container_of(READ_ONCE(ptr), type, member)
>        |         ^~~~~~~~~~~~
> ../include/asm-generic/rwonce.h:44:43: note: in expansion of macro '__unqual_scalar_typeof'
>     44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
>        |                                           ^~~~~~~~~~~~~~~~~~~~~~
> ../include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
>     50 |         __READ_ONCE(x);                                                 \
>        |         ^~~~~~~~~~~
> ../include/linux/rculist.h:307:22: note: in expansion of macro 'READ_ONCE'
>    307 |         container_of(READ_ONCE(ptr), type, member)
>        |                      ^~~~~~~~~
> ../include/linux/rculist.h:393:23: note: in expansion of macro 'list_entry_rcu'
>    393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>        |                       ^~~~~~~~~~~~~~
> ../kernel/bpf/../module/internal.h:212:9: note: in expansion of macro 'list_for_each_entry_rcu'
>    212 |         list_for_each_entry_rcu(mod, &modules, list,
>        |         ^~~~~~~~~~~~~~~~~~~~~~~
> ../include/linux/rculist.h:393:41: error: invalid use of undefined type 'struct module'
>    393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>        |                                         ^~
> ../include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
>     78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>        |                                                        ^~~~
> ../include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
>     20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>        |         ^~~~~~~~~~~~~
> ../include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
>     21 |                       __same_type(*(ptr), void),                        \
>        |                       ^~~~~~~~~~~
> ../include/linux/rculist.h:307:9: note: in expansion of macro 'container_of'
>    307 |         container_of(READ_ONCE(ptr), type, member)
>        |         ^~~~~~~~~~~~
> ../include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
>     50 |         __READ_ONCE(x);                                                 \
>        |         ^~~~~~~~~~~
> ../include/linux/rculist.h:307:22: note: in expansion of macro 'READ_ONCE'
>    307 |         container_of(READ_ONCE(ptr), type, member)
>        |                      ^~~~~~~~~
> ../include/linux/rculist.h:393:23: note: in expansion of macro 'list_entry_rcu'
>    393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>        |                       ^~~~~~~~~~~~~~
> ../kernel/bpf/../module/internal.h:212:9: note: in expansion of macro 'list_for_each_entry_rcu'
>    212 |         list_for_each_entry_rcu(mod, &modules, list,
>        |         ^~~~~~~~~~~~~~~~~~~~~~~
> ./../include/linux/compiler_types.h:340:27: error: expression in static assertion is not an integer
>    340 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
>        |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
>     78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>        |                                                        ^~~~
> ../include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
>     20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>        |         ^~~~~~~~~~~~~
> ../include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
>     20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>        |                       ^~~~~~~~~~~
> ../include/linux/rculist.h:307:9: note: in expansion of macro 'container_of'
>    307 |         container_of(READ_ONCE(ptr), type, member)
>        |         ^~~~~~~~~~~~
> ../include/linux/rculist.h:393:23: note: in expansion of macro 'list_entry_rcu'
>    393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>        |                       ^~~~~~~~~~~~~~
> ../kernel/bpf/../module/internal.h:212:9: note: in expansion of macro 'list_for_each_entry_rcu'
>    212 |         list_for_each_entry_rcu(mod, &modules, list,
>        |         ^~~~~~~~~~~~~~~~~~~~~~~
> ../include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct module'
>     16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
>        |                                 ^~~~~~~~~~~~~~~~~~
> ../include/linux/container_of.h:23:28: note: in expansion of macro 'offsetof'
>     23 |         ((type *)(__mptr - offsetof(type, member))); })
>        |                            ^~~~~~~~
> ../include/linux/rculist.h:307:9: note: in expansion of macro 'container_of'
>    307 |         container_of(READ_ONCE(ptr), type, member)
>        |         ^~~~~~~~~~~~
> ../include/linux/rculist.h:393:23: note: in expansion of macro 'list_entry_rcu'
>    393 |                 pos = list_entry_rcu(pos->member.next, typeof(*pos), member))
>        |                       ^~~~~~~~~~~~~~
> ../kernel/bpf/../module/internal.h:212:9: note: in expansion of macro 'list_for_each_entry_rcu'
>    212 |         list_for_each_entry_rcu(mod, &modules, list,
>        |         ^~~~~~~~~~~~~~~~~~~~~~~
> 
> It appears to be some sort of header inclusion order issue?

The problem is that kernel/module/internal.h is not prepared to be
included when CONFIG_MODULES=n. It seems to me that the best solution
would be to move find_kallsyms_symbol_value into include/linux/module.h
and include that from kernel/bpf/verifier.c (instead of internal.h).

I'll post a fix tomorrow unless someone has objections or a better idea.

Viktor

> 
> Cheers,
> Nathan
> 

