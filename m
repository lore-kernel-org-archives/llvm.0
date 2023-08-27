Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DE42115;
	Sun, 27 Aug 2023 09:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693127688; x=1724663688;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s/oGnlJieEgL+CIkLK5s/5+SachWchw9Xu862OmgmHo=;
  b=ZRF+8TA5dTdr36Ih+9A4ywbPSSRQHY1TckZWuw9LQpDYBe89N/1CtS44
   v6yzviNoxN86Ad8aBsb22rhNZa8rLX1zAUsbQlYk4nhNtzFtZT0tgcCz1
   QtkjCeHdhE6zy970nwhdToi1rV5km57kEnbfzVSMvOxdR32sDN4ElmGYo
   l9R7rhvIEqkcWz6Nuc+2PPQqTE6Dxt6xqLRZQK1+c36nWy4ojZslRIoG/
   pe61n1J5/pg1Qtq0bcg6aRUvNzYgCtVIGxgMF9UfDdFGrOntNmKR1FxaO
   HwmyOSQeDSJrxdD/IOEJkvLUWmeuafOcO2MZWWyjrNOYtztuIWPEujMwE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="365133118"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="365133118"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2023 02:14:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="741062959"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="741062959"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 27 Aug 2023 02:14:42 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaBr0-0005b5-0m;
	Sun, 27 Aug 2023 09:14:42 +0000
Date: Sun, 27 Aug 2023 17:14:08 +0800
From: kernel test robot <lkp@intel.com>
To: Chuyi Zhou <zhouchuyi@bytedance.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH bpf-next 1/4] bpf: Introduce css_task open-coded
 iterator kfuncs
Message-ID: <202308271613.AkJ57Io7-lkp@intel.com>
References: <20230827072057.1591929-2-zhouchuyi@bytedance.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230827072057.1591929-2-zhouchuyi@bytedance.com>

Hi Chuyi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Chuyi-Zhou/bpf-Introduce-css_task-open-coded-iterator-kfuncs/20230827-152340
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230827072057.1591929-2-zhouchuyi%40bytedance.com
patch subject: [RFC PATCH bpf-next 1/4] bpf: Introduce css_task open-coded iterator kfuncs
config: riscv-randconfig-r005-20230827 (https://download.01.org/0day-ci/archive/20230827/202308271613.AkJ57Io7-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230827/202308271613.AkJ57Io7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308271613.AkJ57Io7-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> kernel/bpf/task_iter.c:839:24: error: invalid application of 'sizeof' to an incomplete type 'struct css_task_iter'
     839 |         kit->css_it = kzalloc(sizeof(struct css_task_iter), GFP_KERNEL);
         |                               ^     ~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/task_iter.c:827:9: note: forward declaration of 'struct css_task_iter'
     827 |         struct css_task_iter *css_it;
         |                ^
>> kernel/bpf/task_iter.c:842:2: error: call to undeclared function 'css_task_iter_start'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     842 |         css_task_iter_start(css, flags, kit->css_it);
         |         ^
   kernel/bpf/task_iter.c:842:2: note: did you mean '__sg_page_iter_start'?
   include/linux/scatterlist.h:573:6: note: '__sg_page_iter_start' declared here
     573 | void __sg_page_iter_start(struct sg_page_iter *piter,
         |      ^
>> kernel/bpf/task_iter.c:830:17: warning: no previous prototype for function 'bpf_iter_css_task_new' [-Wmissing-prototypes]
     830 | __bpf_kfunc int bpf_iter_css_task_new(struct bpf_iter_css_task *it,
         |                 ^
   kernel/bpf/task_iter.c:830:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     830 | __bpf_kfunc int bpf_iter_css_task_new(struct bpf_iter_css_task *it,
         |             ^
         |             static 
>> kernel/bpf/task_iter.c:852:9: error: call to undeclared function 'css_task_iter_next'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     852 |         return css_task_iter_next(kit->css_it);
         |                ^
>> kernel/bpf/task_iter.c:852:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'struct task_struct *' [-Wint-conversion]
     852 |         return css_task_iter_next(kit->css_it);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/bpf/task_iter.c:846:33: warning: no previous prototype for function 'bpf_iter_css_task_next' [-Wmissing-prototypes]
     846 | __bpf_kfunc struct task_struct *bpf_iter_css_task_next(struct bpf_iter_css_task *it)
         |                                 ^
   kernel/bpf/task_iter.c:846:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     846 | __bpf_kfunc struct task_struct *bpf_iter_css_task_next(struct bpf_iter_css_task *it)
         |             ^
         |             static 
>> kernel/bpf/task_iter.c:861:2: error: call to undeclared function 'css_task_iter_end'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     861 |         css_task_iter_end(kit->css_it);
         |         ^
>> kernel/bpf/task_iter.c:855:18: warning: no previous prototype for function 'bpf_iter_css_task_destroy' [-Wmissing-prototypes]
     855 | __bpf_kfunc void bpf_iter_css_task_destroy(struct bpf_iter_css_task *it)
         |                  ^
   kernel/bpf/task_iter.c:855:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     855 | __bpf_kfunc void bpf_iter_css_task_destroy(struct bpf_iter_css_task *it)
         |             ^
         |             static 
   3 warnings and 5 errors generated.


vim +839 kernel/bpf/task_iter.c

   829	
 > 830	__bpf_kfunc int bpf_iter_css_task_new(struct bpf_iter_css_task *it,
   831			struct cgroup_subsys_state *css, unsigned int flags)
   832	{
   833		struct bpf_iter_css_task_kern *kit = (void *)it;
   834	
   835		BUILD_BUG_ON(sizeof(struct bpf_iter_css_task_kern) != sizeof(struct bpf_iter_css_task));
   836		BUILD_BUG_ON(__alignof__(struct bpf_iter_css_task_kern) !=
   837						__alignof__(struct bpf_iter_css_task));
   838	
 > 839		kit->css_it = kzalloc(sizeof(struct css_task_iter), GFP_KERNEL);
   840		if (!kit->css_it)
   841			return -ENOMEM;
 > 842		css_task_iter_start(css, flags, kit->css_it);
   843		return 0;
   844	}
   845	
 > 846	__bpf_kfunc struct task_struct *bpf_iter_css_task_next(struct bpf_iter_css_task *it)
   847	{
   848		struct bpf_iter_css_task_kern *kit = (void *)it;
   849	
   850		if (!kit->css_it)
   851			return NULL;
 > 852		return css_task_iter_next(kit->css_it);
   853	}
   854	
 > 855	__bpf_kfunc void bpf_iter_css_task_destroy(struct bpf_iter_css_task *it)
   856	{
   857		struct bpf_iter_css_task_kern *kit = (void *)it;
   858	
   859		if (!kit->css_it)
   860			return;
 > 861		css_task_iter_end(kit->css_it);
   862		kfree(kit->css_it);
   863	}
   864	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
