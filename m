Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C1C1C06;
	Sat,  3 Jun 2023 03:17:22 +0000 (UTC)
Received: from canpemm500002.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4QY4KC6rwWzqSMn;
	Sat,  3 Jun 2023 10:57:03 +0800 (CST)
Received: from [10.174.151.185] (10.174.151.185) by
 canpemm500002.china.huawei.com (7.192.104.244) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sat, 3 Jun 2023 11:01:46 +0800
Subject: Re: [PATCH] sched/fair: remove unneeded header files
To: kernel test robot <lkp@intel.com>, <mingo@redhat.com>,
	<peterz@infradead.org>, <juri.lelli@redhat.com>, <vincent.guittot@linaro.org>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>,
	<dietmar.eggemann@arm.com>, <rostedt@goodmis.org>, <bsegall@google.com>,
	<mgorman@suse.de>, <bristot@redhat.com>, <vschneid@redhat.com>,
	<linux-kernel@vger.kernel.org>
References: <20230527173727.1669047-1-linmiaohe@huawei.com>
 <202305280847.ss7JHZEe-lkp@intel.com>
From: Miaohe Lin <linmiaohe@huawei.com>
Message-ID: <accf18ec-24c2-a249-0593-db38b6634156@huawei.com>
Date: Sat, 3 Jun 2023 11:01:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202305280847.ss7JHZEe-lkp@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.151.185]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 canpemm500002.china.huawei.com (7.192.104.244)
X-CFilter-Loop: Reflected

On 2023/5/28 8:29, kernel test robot wrote:
> Hi Miaohe,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on tip/sched/core]
> [also build test ERROR on linus/master v6.4-rc3 next-20230525]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Miaohe-Lin/sched-fair-remove-unneeded-header-files/20230527-174628
> base:   tip/sched/core
> patch link:    https://lore.kernel.org/r/20230527173727.1669047-1-linmiaohe%40huawei.com
> patch subject: [PATCH] sched/fair: remove unneeded header files
> config: x86_64-randconfig-a012-20230528 (https://download.01.org/0day-ci/archive/20230528/202305280847.ss7JHZEe-lkp@intel.com/config)
> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> reproduce (this is a W=1 build):
>         mkdir -p ~/bin
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/intel-lab-lkp/linux/commit/653731fdd11d1ecb757fe4b90484ef4a777fb584
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Miaohe-Lin/sched-fair-remove-unneeded-header-files/20230527-174628
>         git checkout 653731fdd11d1ecb757fe4b90484ef4a777fb584
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202305280847.ss7JHZEe-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> kernel/sched/fair.c:1585:7: error: implicit declaration of function 'node_is_toptier' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
>                !node_is_toptier(src_nid)) {
>                 ^
>    kernel/sched/fair.c:2844:7: error: implicit declaration of function 'node_is_toptier' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
>            if (!node_is_toptier(mem_node) &&
>                 ^
>>> kernel/sched/fair.c:3014:8: error: implicit declaration of function 'vma_migratable' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
>                    if (!vma_migratable(vma) || !vma_policy_mof(vma) ||
>                         ^
>>> kernel/sched/fair.c:3014:32: error: implicit declaration of function 'vma_policy_mof' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
>                    if (!vma_migratable(vma) || !vma_policy_mof(vma) ||
>                                                 ^
>>> kernel/sched/fair.c:3015:4: error: implicit declaration of function 'is_vm_hugetlb_page' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
>                            is_vm_hugetlb_page(vma) || (vma->vm_flags & VM_MIXEDMAP)) {
>                            ^
>    kernel/sched/fair.c:6159:6: warning: no previous prototype for function 'init_cfs_bandwidth' [-Wmissing-prototypes]
>    void init_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
>         ^
>    kernel/sched/fair.c:6159:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>    void init_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
>    ^
>    static 
>    kernel/sched/fair.c:11973:6: warning: no previous prototype for function 'task_vruntime_update' [-Wmissing-prototypes]
>    void task_vruntime_update(struct rq *rq, struct task_struct *p, bool in_fi)
>         ^
>    kernel/sched/fair.c:11973:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>    void task_vruntime_update(struct rq *rq, struct task_struct *p, bool in_fi)
>    ^
>    static 
>    kernel/sched/fair.c:12595:6: warning: no previous prototype for function 'free_fair_sched_group' [-Wmissing-prototypes]
>    void free_fair_sched_group(struct task_group *tg) { }
>         ^
>    kernel/sched/fair.c:12595:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>    void free_fair_sched_group(struct task_group *tg) { }
>    ^
>    static 
>    kernel/sched/fair.c:12597:5: warning: no previous prototype for function 'alloc_fair_sched_group' [-Wmissing-prototypes]
>    int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
>        ^
>    kernel/sched/fair.c:12597:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>    int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
>    ^
>    static 
>    kernel/sched/fair.c:12602:6: warning: no previous prototype for function 'online_fair_sched_group' [-Wmissing-prototypes]
>    void online_fair_sched_group(struct task_group *tg) { }
>         ^
>    kernel/sched/fair.c:12602:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>    void online_fair_sched_group(struct task_group *tg) { }
>    ^
>    static 
>    kernel/sched/fair.c:12604:6: warning: no previous prototype for function 'unregister_fair_sched_group' [-Wmissing-prototypes]
>    void unregister_fair_sched_group(struct task_group *tg) { }
>         ^
>    kernel/sched/fair.c:12604:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>    void unregister_fair_sched_group(struct task_group *tg) { }
>    ^
>    static 
>    6 warnings and 5 errors generated.

Will fix all of these in v2. Thanks for reporting.

