Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A772516D;
	Tue, 25 Jul 2023 19:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690315098; x=1721851098;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2P3XGUMV1NtRncQpKb7KyFd8Aka7g+NPhuuBjng82a0=;
  b=RmfEVRjN6x7SFyFniA/npBOb8WzkfHpDhQmx1QnAwo3aYLO50xmkKQ0C
   TK4DuEgQ4PgbbjBcPKzdDlsbfctk8p+s5uAGd+EsmT1DeyqYwo/8lldvg
   8WaKu6PKWme7a1WaQDUwwaSQSnrVeJGzYOXukF7tKPjZT727sKE5bKKlD
   tK4eq0RunzR2s8rEwg0iD1DRrrDfjumIKW/XddpKqqmsF/cuGEf2Pgx9z
   00puwp1iCEYS04rnDEt005hwdh0yHQEq481W9oJvfN+8ze1KcJAKpSzf6
   2U077R0yCH+qWuFNv9HL7DmgdvLVI1yTpwPap2vfyPaxk9PQpNlATSmXJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="348105886"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="348105886"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 12:58:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="726211034"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="726211034"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 25 Jul 2023 12:58:15 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOOAg-0000Ip-2F;
	Tue, 25 Jul 2023 19:58:14 +0000
Date: Wed, 26 Jul 2023 03:57:50 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>
Subject: arch/x86/kernel/paravirt.c:337:4: warning: cast from 'void
 (*)(struct mmu_gather *, struct page *)' to 'void (*)(struct mmu_gather *,
 void *)' converts to incompatible function type
Message-ID: <202307260332.pJntWR6o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   af2e19389c2c1d8a299e04c5105b180ef0c5b5b5
commit: 552a23a0e5d0a84cecd4687043d8030673981d30 Makefile: Enable -Wcast-function-type
date:   1 year, 8 months ago
config: x86_64-randconfig-r003-20230725 (https://download.01.org/0day-ci/archive/20230726/202307260332.pJntWR6o-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307260332.pJntWR6o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307260332.pJntWR6o-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/paravirt.c:107:13: warning: no previous prototype for function 'native_pv_lock_init' [-Wmissing-prototypes]
   void __init native_pv_lock_init(void)
               ^
   arch/x86/kernel/paravirt.c:107:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init native_pv_lock_init(void)
   ^
   static 
>> arch/x86/kernel/paravirt.c:337:4: warning: cast from 'void (*)(struct mmu_gather *, struct page *)' to 'void (*)(struct mmu_gather *, void *)' converts to incompatible function type [-Wcast-function-type-strict]
                           (void (*)(struct mmu_gather *, void *))tlb_remove_page,
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +337 arch/x86/kernel/paravirt.c

5c83511bdb9832 Juergen Gross   2018-08-28  330  
5c83511bdb9832 Juergen Gross   2018-08-28  331  	/* Mmu ops. */
2faf153bb7346b Thomas Gleixner 2020-04-21  332  	.mmu.flush_tlb_user	= native_flush_tlb_local,
5c83511bdb9832 Juergen Gross   2018-08-28  333  	.mmu.flush_tlb_kernel	= native_flush_tlb_global,
5c83511bdb9832 Juergen Gross   2018-08-28  334  	.mmu.flush_tlb_one_user	= native_flush_tlb_one_user,
4ce94eabac16b1 Nadav Amit      2021-02-20  335  	.mmu.flush_tlb_multi	= native_flush_tlb_multi,
5c83511bdb9832 Juergen Gross   2018-08-28  336  	.mmu.tlb_remove_table	=
5c83511bdb9832 Juergen Gross   2018-08-28 @337  			(void (*)(struct mmu_gather *, void *))tlb_remove_page,
5c83511bdb9832 Juergen Gross   2018-08-28  338  
fdc0269e8958a1 Juergen Gross   2018-08-28  339  	.mmu.exit_mmap		= paravirt_nop,
064ce6c550a063 Brijesh Singh   2021-08-24  340  	.mmu.notify_page_enc_status_changed	= paravirt_nop,
fdc0269e8958a1 Juergen Gross   2018-08-28  341  

:::::: The code at line 337 was first introduced by commit
:::::: 5c83511bdb9832c86be20fb86b783356e2f58062 x86/paravirt: Use a single ops structure

:::::: TO: Juergen Gross <jgross@suse.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
