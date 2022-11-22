Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D34F23B1;
	Tue, 22 Nov 2022 13:24:14 +0000 (UTC)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.57])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4NGlJ032S2zJnQc;
	Tue, 22 Nov 2022 21:20:48 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 22 Nov 2022 21:24:03 +0800
Received: from [10.174.178.55] (10.174.178.55) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 22 Nov 2022 21:24:03 +0800
Subject: Re: [PATCH v9] kallsyms: Add self-test facility
To: kernel test robot <lkp@intel.com>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>
References: <20221115083349.1662-1-thunder.leizhen@huawei.com>
 <202211222003.BHvjediW-lkp@intel.com>
From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <fc467e6b-fa30-0853-f3c6-a118541cf90a@huawei.com>
Date: Tue, 22 Nov 2022 21:24:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202211222003.BHvjediW-lkp@intel.com>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.55]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500006.china.huawei.com (7.185.36.236)
X-CFilter-Loop: Reflected



On 2022/11/22 20:29, kernel test robot wrote:
> Hi Zhen,
> 
> Thank you for the patch! Yet something to improve:
> 
> [auto build test ERROR on linus/master]
> [also build test ERROR on v6.1-rc6]
> [cannot apply to next-20221122]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Zhen-Lei/kallsyms-Add-self-test-facility/20221115-163650
> patch link:    https://lore.kernel.org/r/20221115083349.1662-1-thunder.leizhen%40huawei.com
> patch subject: [PATCH v9] kallsyms: Add self-test facility
> config: hexagon-randconfig-r013-20221120
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project af8c49dc1ec44339d915d988ffe0f38da68ca0e7)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/intel-lab-lkp/linux/commit/2d938b2c6f7a6a515097ec18124ac23a6017ffaf
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Zhen-Lei/kallsyms-Add-self-test-facility/20221115-163650
>         git checkout 2d938b2c6f7a6a515097ec18124ac23a6017ffaf
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>>> kernel/kallsyms_selftest.c:281:2: error: call to undeclared function 'kallsyms_on_each_match_symbol'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>            kallsyms_on_each_match_symbol(match_symbol, stat.name, &stat);
>            ^
>    kernel/kallsyms_selftest.c:281:2: note: did you mean 'kallsyms_on_each_symbol'?
>    include/linux/kallsyms.h:70:5: note: 'kallsyms_on_each_symbol' declared here
>    int kallsyms_on_each_symbol(int (*fn)(void *, const char *, struct module *,
>        ^
>    kernel/kallsyms_selftest.c:331:3: error: call to undeclared function 'kallsyms_on_each_match_symbol'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>                    kallsyms_on_each_match_symbol(match_symbol, test_items[i].name, stat);
>                    ^
>    kernel/kallsyms_selftest.c:381:3: error: call to undeclared function 'kallsyms_on_each_match_symbol'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>                    kallsyms_on_each_match_symbol(match_symbol, namebuf, stat);
>                    ^
>    3 errors generated.

Hi, this is a false positive. Because the patches 1-6 in v8 had already been applied, so I
only updated patch 9/9 in v8, and post it separately as v9. So these errors are reported due
to missing patches 1-6 in v8. Please ignore them.

> 
> 
> vim +/kallsyms_on_each_match_symbol +281 kernel/kallsyms_selftest.c
> 
>    269	
>    270	static void test_perf_kallsyms_on_each_match_symbol(void)
>    271	{
>    272		u64 t0, t1;
>    273		unsigned long flags;
>    274		struct test_stat stat;
>    275	
>    276		memset(&stat, 0, sizeof(stat));
>    277		stat.max = INT_MAX;
>    278		stat.name = stub_name;
>    279		local_irq_save(flags);
>    280		t0 = sched_clock();
>  > 281		kallsyms_on_each_match_symbol(match_symbol, stat.name, &stat);
>    282		t1 = sched_clock();
>    283		local_irq_restore(flags);
>    284		pr_info("kallsyms_on_each_match_symbol() traverse all: %lld ns\n", t1 - t0);
>    285	}
>    286	
> 

-- 
Regards,
  Zhen Lei
