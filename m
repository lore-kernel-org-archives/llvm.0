Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F39A3D
	for <llvm@lists.linux.dev>; Wed, 27 Jul 2022 07:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658907174; x=1690443174;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=3tUr9o4XtgqSSOj6k+rQU7NSjzLE5T5O5gATaSlQ9No=;
  b=Pr1nFrvbjFsycOQk7uuaWfw84waEP/AmCnuKdhg3RrjSbvQYMMLYv119
   FYUrnfKJqxgM6XRXqmq2APtnqQKGQc9TA4pzBN8CjuZ40HOi/jY6VQheu
   fTKLlssE6vHPgsZdJC2JKgvhxUwIQebWMgCBy53zJpcw+OGTlTJV/aDGJ
   Dpln3aZb6awOPTqmgnBgGy0+XqT07q509v6fNMjwiND6rAVRRTn53h//L
   cY2g8zMqzsoMQKLRHIczpyVQqMyiYkdkCue1bFz655tVzIjvTMeJh6Bq/
   tjxgY7qJvdxNvTrlO3pJseElLvOxoMF13XK5+f20Dv7zZU7LT8bro6usu
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10420"; a="267935588"
X-IronPort-AV: E=Sophos;i="5.93,195,1654585200"; 
   d="scan'208";a="267935588"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2022 00:32:45 -0700
X-IronPort-AV: E=Sophos;i="5.93,195,1654585200"; 
   d="scan'208";a="659079451"
Received: from rongch2-mobl.ccr.corp.intel.com (HELO [10.249.171.125]) ([10.249.171.125])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2022 00:32:43 -0700
Subject: Re: [kbuild-all] Re: drivers/iio/adc/ti-tsc2046.c:242:62: warning:
 taking address of packed member 'data' of class or structure
 'tsc2046_adc_atom' may result in an unaligned pointer value
To: Nathan Chancellor <nathan@kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: kernel test robot <lkp@intel.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>, llvm@lists.linux.dev,
 kbuild-all@lists.01.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <202207251140.M7YAqoLC-lkp@intel.com>
 <CAHp75Vf0LjA8+JQNmKNYTe-1U58mSUsTiqQWbLAcrBXWs8NGjQ@mail.gmail.com>
 <YuAFeyKirrneGPSB@dev-arch.thelio-3990X>
From: "Chen, Rong A" <rong.a.chen@intel.com>
Message-ID: <3b82019e-a913-1a5e-3118-1ed61d8bae87@intel.com>
Date: Wed, 27 Jul 2022 15:32:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YuAFeyKirrneGPSB@dev-arch.thelio-3990X>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 7/26/2022 11:17 PM, Nathan Chancellor wrote:
> On Tue, Jul 26, 2022 at 10:07:09AM +0200, Andy Shevchenko wrote:
>> Seems yet another false positive from Clang.
> 
> This warning should not show up because it is disabled in the main
> Makefile. Unfortunately, a recent change in clang made '-mtune' warn
> when it is not supported in the backend, which is the case for ARM:
> 
> https://github.com/ClangBuiltLinux/linux/issues/1674
> 
> As a result, all subsequent cc-option calls fail, which was the root
> cause of this warning last time, just with MIPS:
> 
> https://lore.kernel.org/YenXz+RznXBuJMSR@dev-arch.archlinux-ax161/
> 
> Intel folks, could you update your version of clang or add this
> particular warning to your blocklist? It should be resolved with
> https://github.com/llvm/llvm-project/commit/1d23f6c5a4f6ebb101c282f8f506588fe4d9e92f.

Hi Nathan,

Thanks for the advice, we have updated the clang in our environment.

Best Regards,
Rong Chen

> 
> Cheers,
> Nathan
> 
>> On Mon, Jul 25, 2022 at 5:55 AM kernel test robot <lkp@intel.com> wrote:
>>>
>>> Hi Oleksij,
>>>
>>> FYI, the error/warning still remains.
>>>
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>>> head:   e0dccc3b76fb35bb257b4118367a883073d7390e
>>> commit: 9374e8f5a38defe90bc65b2decf317c1c62d91dd iio: adc: add ADC driver for the TI TSC2046 controller
>>> date:   1 year, 2 months ago
>>> config: arm-randconfig-r025-20220724 (https://download.01.org/0day-ci/archive/20220725/202207251140.M7YAqoLC-lkp@intel.com/config)
>>> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 9e88cbcc403bdf82f29259ad60ff60a8fc4434a1)
>>> reproduce (this is a W=1 build):
>>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>>          chmod +x ~/bin/make.cross
>>>          # install arm cross compiling tool for clang build
>>>          # apt-get install binutils-arm-linux-gnueabi
>>>          # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9374e8f5a38defe90bc65b2decf317c1c62d91dd
>>>          git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>>>          git fetch --no-tags linus master
>>>          git checkout 9374e8f5a38defe90bc65b2decf317c1c62d91dd
>>>          # save the config file
>>>          mkdir build_dir && cp config build_dir/.config
>>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/iio/adc/ drivers/staging/ fs/
>>>
>>> If you fix the issue, kindly add following tag where applicable
>>> Reported-by: kernel test robot <lkp@intel.com>
>>>
>>> All warnings (new ones prefixed by >>):
>>>
>>>>> drivers/iio/adc/ti-tsc2046.c:242:62: warning: taking address of packed member 'data' of class or structure 'tsc2046_adc_atom' may result in an unaligned pointer value [-Waddress-of-packed-member]
>>
>> What the heck? The get_unaligned_*() is exactly to get unaligned data.
>>
>>>             return FIELD_GET(TI_TSC2046_DATA_12BIT, get_unaligned_be16(&buf->data));
>>>                                                                         ^~~~~~~~~
>>>     include/linux/bitfield.h:108:27: note: expanded from macro 'FIELD_GET'
>>>                     __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
>>>                                             ^~~~
>>>     include/linux/bitfield.h:52:38: note: expanded from macro '__BF_FIELD_CHECK'
>>>                     BUILD_BUG_ON_MSG((_mask) > (typeof(_reg))~0ull,         \
>>>                                                        ^~~~
>>>     include/linux/build_bug.h:39:58: note: expanded from macro 'BUILD_BUG_ON_MSG'
>>>     #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>>>                                                              ^~~~
>>>     note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
>>>     include/linux/compiler_types.h:308:9: note: expanded from macro '__compiletime_assert'
>>>                     if (!(condition))                                       \
>>>                           ^~~~~~~~~
>>>     include/linux/compiler.h:56:47: note: expanded from macro 'if'
>>>     #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
>>>                                                   ^~~~
>>>     include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
>>>     #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
>>>                                                        ^~~~
>>>>> drivers/iio/adc/ti-tsc2046.c:242:62: warning: taking address of packed member 'data' of class or structure 'tsc2046_adc_atom' may result in an unaligned pointer value [-Waddress-of-packed-member]
>>>             return FIELD_GET(TI_TSC2046_DATA_12BIT, get_unaligned_be16(&buf->data));
>>>                                                                         ^~~~~~~~~
>>>     include/linux/bitfield.h:108:27: note: expanded from macro 'FIELD_GET'
>>>                     __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
>>>                                             ^~~~
>>>     include/linux/bitfield.h:52:38: note: expanded from macro '__BF_FIELD_CHECK'
>>>                     BUILD_BUG_ON_MSG((_mask) > (typeof(_reg))~0ull,         \
>>>                                                        ^~~~
>>>     include/linux/build_bug.h:39:58: note: expanded from macro 'BUILD_BUG_ON_MSG'
>>>     #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>>>                                                              ^~~~
>>>     note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
>>>     include/linux/compiler_types.h:308:9: note: expanded from macro '__compiletime_assert'
>>>                     if (!(condition))                                       \
>>>                           ^~~~~~~~~
>>>     include/linux/compiler.h:56:47: note: expanded from macro 'if'
>>>     #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
>>>                                                   ^~~~
>>>     include/linux/compiler.h:58:61: note: expanded from macro '__trace_if_var'
>>>     #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
>>>                                                                 ^~~~
>>>>> drivers/iio/adc/ti-tsc2046.c:242:62: warning: taking address of packed member 'data' of class or structure 'tsc2046_adc_atom' may result in an unaligned pointer value [-Waddress-of-packed-member]
>>>             return FIELD_GET(TI_TSC2046_DATA_12BIT, get_unaligned_be16(&buf->data));
>>>                                                                         ^~~~~~~~~
>>>     include/linux/bitfield.h:108:27: note: expanded from macro 'FIELD_GET'
>>>                     __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
>>>                                             ^~~~
>>>     include/linux/bitfield.h:52:38: note: expanded from macro '__BF_FIELD_CHECK'
>>>                     BUILD_BUG_ON_MSG((_mask) > (typeof(_reg))~0ull,         \
>>>                                                        ^~~~
>>>     include/linux/build_bug.h:39:58: note: expanded from macro 'BUILD_BUG_ON_MSG'
>>>     #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>>>                                                              ^~~~
>>>     note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
>>>     include/linux/compiler.h:56:47: note: expanded from macro 'if'
>>>     #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
>>>                                                   ^~~~
>>>     include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_var'
>>>     #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
>>>                                                                                          ^~~~
>>>     include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_value'
>>>             (cond) ?                                        \
>>>              ^~~~
>>>     3 warnings generated.
>>>
>>>
>>> vim +242 drivers/iio/adc/ti-tsc2046.c
>>>
>>>     239
>>>     240  static u16 tsc2046_adc_get_value(struct tsc2046_adc_atom *buf)
>>>     241  {
>>>   > 242          return FIELD_GET(TI_TSC2046_DATA_12BIT, get_unaligned_be16(&buf->data));
>>>     243  }
>>
>>
>> -- 
>> With Best Regards,
>> Andy Shevchenko
> _______________________________________________
> kbuild-all mailing list -- kbuild-all@lists.01.org
> To unsubscribe send an email to kbuild-all-leave@lists.01.org
> 
