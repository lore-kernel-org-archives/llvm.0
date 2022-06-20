Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B93B7F6
	for <llvm@lists.linux.dev>; Mon, 20 Jun 2022 09:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655716042; x=1687252042;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=yE0sYolA28odjwqHlF8UTbPGPqdwVkp66FhqarJnG6Y=;
  b=ZhTgAzBAYxwDbyoVcZd2Pgwx2V+TjkHIepayqYLOpqlCiwFja/H/CmiA
   PhpL55ynLe79YFBbX14r3W6T4/EAFGGNCvXY/ffQ+bUPube95JVXI9gNb
   OAUcgkVsb0hOXUvdxkN997Vay9PE+RytsKFY9WxdFtp3U3YdQE7D8oqxy
   PgpdK0sXWZQHkwuicMcU7NQaXL6XWc1eyu29WKjLSzPm9Ew0iV9qOGRA4
   u81CBct7rerI9Svr2oyPKK9cDhnVp/UteFlG6c8n9J8/19oQOcwOb3pLq
   Q0V39qSFsZ196lVKsmU79W+tR+Uc3y+RL8fzgL3MNtHGs3mWAW0kbcAlk
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="341527107"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="341527107"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2022 02:07:21 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="643024196"
Received: from rongch2-mobl.ccr.corp.intel.com (HELO [10.255.30.150]) ([10.255.30.150])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2022 02:07:19 -0700
Subject: Re: [kbuild-all] Re: [RFC 4/6] reset: add polarfire soc reset support
To: Conor Dooley <mail@conchuod.ie>, kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
References: <20220619164935.1492823-5-mail@conchuod.ie>
 <202206200343.mg3VsC0H-lkp@intel.com>
 <2b30919a-ccb9-9891-d145-e2e4107d244e@conchuod.ie>
From: "Chen, Rong A" <rong.a.chen@intel.com>
Message-ID: <75352a1f-cdd5-bd56-48db-6c27c4a4ccf9@intel.com>
Date: Mon, 20 Jun 2022 17:07:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <2b30919a-ccb9-9891-d145-e2e4107d244e@conchuod.ie>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Conor,

Thanks for the reply, we have ignored the series in our CI.

Best Regards,
Rong Chen

On 6/20/2022 3:54 AM, Conor Dooley wrote:
> Can I just make it stop trying to build the series?
> Clearly I screwed up the kconfig depends...
> 
> On 19/06/2022 20:52, kernel test robot wrote:
>> Hi Conor,
>>
>> [FYI, it's a private test report for your RFC patch.]
>> [auto build test ERROR on b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3]
>>
>> url:    https://github.com/intel-lab-lkp/linux/commits/Conor-Dooley/PolarFire-SoC-Reset-controller/20220620-005055
>> base:   b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3
>> config: riscv-randconfig-r026-20220620 (https://download.01.org/0day-ci/archive/20220620/202206200343.mg3VsC0H-lkp@intel.com/config)
>> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project af6d2a0b6825e71965f3e2701a63c239fa0ad70f)
>> reproduce (this is a W=1 build):
>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # install riscv cross compiling tool for clang build
>>          # apt-get install binutils-riscv-linux-gnu
>>          # https://github.com/intel-lab-lkp/linux/commit/760155ed7d4eb45e0d8cfbbf8c471b4b1548bc1e
>>          git remote add linux-review https://github.com/intel-lab-lkp/linux
>>          git fetch --no-tags linux-review Conor-Dooley/PolarFire-SoC-Reset-controller/20220620-005055
>>          git checkout 760155ed7d4eb45e0d8cfbbf8c471b4b1548bc1e
>>          # save the config file
>>          mkdir build_dir && cp config build_dir/.config
>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/reset/
>>
>> If you fix the issue, kindly add following tag where applicable
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>):
>>
>>>> drivers/reset/reset-mpfs.c:33:8: error: call to undeclared function 'mpfs_reset_read'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>>             reg = mpfs_reset_read(rcdev->dev);
>>                   ^
>>>> drivers/reset/reset-mpfs.c:35:2: error: call to undeclared function 'mpfs_reset_write'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>>             mpfs_reset_write(rcdev->dev, reg);
>>             ^
>>     drivers/reset/reset-mpfs.c:39:3: warning: format specifies type 'unsigned int' but the argument has type 'unsigned long' [-Wformat]
>>                     id);
>>                     ^~
>>     include/linux/dev_printk.h:155:39: note: expanded from macro 'dev_dbg'
>>             dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
>>                                          ~~~     ^~~~~~~~~~~
>>     include/linux/dynamic_debug.h:167:19: note: expanded from macro 'dynamic_dev_dbg'
>>                                dev, fmt, ##__VA_ARGS__)
>>                                     ~~~    ^~~~~~~~~~~
>>     include/linux/dynamic_debug.h:152:56: note: expanded from macro '_dynamic_func_call'
>>             __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
>>                                                                   ^~~~~~~~~~~
>>     include/linux/dynamic_debug.h:134:15: note: expanded from macro '__dynamic_func_call'
>>                     func(&id, ##__VA_ARGS__);               \
>>                                 ^~~~~~~~~~~
>>     drivers/reset/reset-mpfs.c:47:8: error: call to undeclared function 'mpfs_reset_read'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>>             reg = mpfs_reset_read(rcdev->dev);
>>                   ^
>>     drivers/reset/reset-mpfs.c:49:2: error: call to undeclared function 'mpfs_reset_write'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>>             mpfs_reset_write(rcdev->dev, val);
>>             ^
>>     drivers/reset/reset-mpfs.c:53:3: warning: format specifies type 'unsigned int' but the argument has type 'unsigned long' [-Wformat]
>>                     id);
>>                     ^~
>>     include/linux/dev_printk.h:155:39: note: expanded from macro 'dev_dbg'
>>             dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
>>                                          ~~~     ^~~~~~~~~~~
>>     include/linux/dynamic_debug.h:167:19: note: expanded from macro 'dynamic_dev_dbg'
>>                                dev, fmt, ##__VA_ARGS__)
>>                                     ~~~    ^~~~~~~~~~~
>>     include/linux/dynamic_debug.h:152:56: note: expanded from macro '_dynamic_func_call'
>>             __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
>>                                                                   ^~~~~~~~~~~
>>     include/linux/dynamic_debug.h:134:15: note: expanded from macro '__dynamic_func_call'
>>                     func(&id, ##__VA_ARGS__);               \
>>                                 ^~~~~~~~~~~
>>     drivers/reset/reset-mpfs.c:60:12: error: call to undeclared function 'mpfs_reset_read'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>>             u32 reg = mpfs_reset_read(rcdev->dev);
>>                       ^
>>     drivers/reset/reset-mpfs.c:69:3: warning: format specifies type 'unsigned int' but the argument has type 'unsigned long' [-Wformat]
>>                     id);
>>                     ^~
>>     include/linux/dev_printk.h:155:39: note: expanded from macro 'dev_dbg'
>>             dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
>>                                          ~~~     ^~~~~~~~~~~
>>     include/linux/dynamic_debug.h:167:19: note: expanded from macro 'dynamic_dev_dbg'
>>                                dev, fmt, ##__VA_ARGS__)
>>                                     ~~~    ^~~~~~~~~~~
>>     include/linux/dynamic_debug.h:152:56: note: expanded from macro '_dynamic_func_call'
>>             __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
>>                                                                   ^~~~~~~~~~~
>>     include/linux/dynamic_debug.h:134:15: note: expanded from macro '__dynamic_func_call'
>>                     func(&id, ##__VA_ARGS__);               \
>>                                 ^~~~~~~~~~~
>>     3 warnings and 5 errors generated.
>>
>>
>> vim +/mpfs_reset_read +33 drivers/reset/reset-mpfs.c
>>
>>      24	
>>      25	/*
>>      26	 * Peripheral clock resets
>>      27	 */
>>      28	
>>      29	static int mpfs_assert(struct reset_controller_dev *rcdev, unsigned long id)
>>      30	{
>>      31		u32 reg;
>>      32	
>>    > 33		reg = mpfs_reset_read(rcdev->dev);
>>      34		reg |= (1u << id);
>>    > 35		mpfs_reset_write(rcdev->dev, reg);
>>      36	
>>      37		dev_dbg(rcdev->dev,
>>      38			"Asserting reset for device with REG_SUBBLK_RESET_CR index: %u\n",
>>      39			id);
>>      40		return 0;
>>      41	}
>>      42	
>>
> _______________________________________________
> kbuild-all mailing list -- kbuild-all@lists.01.org
> To unsubscribe send an email to kbuild-all-leave@lists.01.org
> 
