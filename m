Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF03F53B7;
	Sat, 22 Jul 2023 11:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690025906; x=1721561906;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3ZnY0adUzDc9KeclChJY/oZz8ZCj56AQEINf6QkulQI=;
  b=lQxgHuiKRr0e6U7SNK60aJMpG/vI+IaJzNBHFkVCh6GwYUQ2hXhNS5tb
   Fy0Oh0a9qy0j+DE4NPjePv1ERaywOLDT1OTs3H3XyZs7asfQmkiU86GFK
   BOvRyDkxJkCnpY5s9EJBa3xkyndV8TZIJGXC0idpqV5U/kJySQ/coFaby
   g9FD7pTeN8XPXp6FBVHQixGW5ug9VRX4v1M+4ueuOiB7VLZDaGJuTr+uC
   LZm03QgzNd0dypG4aHbK5H4IzN6cmP1fMPX/vkaceZGmnxMGmM/Odxm8U
   54RY6uGYTE7pgwJGwR5jS+o7bhclO/wxQWzzHgafScHS64dDrfhxKbx7l
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="433419406"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="433419406"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2023 04:38:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="760251948"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="760251948"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 22 Jul 2023 04:38:23 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNAwJ-0008HR-03;
	Sat, 22 Jul 2023 11:38:23 +0000
Date: Sat, 22 Jul 2023 19:38:18 +0800
From: kernel test robot <lkp@intel.com>
To: Guo Ren <guoren@linux.alibaba.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [csky-linux:sg2042-master-qspinlock-64ilp32_v3 4/42] ld.lld: error:
 relocation R_RISCV_HI20 cannot be used against symbol 'text_mutex';
 recompile with -fPIC
Message-ID: <202307221952.G50a18Cp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/c-sky/csky-linux sg2042-master-qspinlock-64ilp32_v3
head:   7f9f76d36814ed6fcbca4c27a5d2ec3724c46add
commit: 752cdce676034dc7d1c10e53ff298b0960333e67 [4/42] riscv: errata: Add ERRATA_THEAD_WRITE_ONCE fixup
config: riscv-randconfig-r042-20230720 (https://download.01.org/0day-ci/archive/20230722/202307221952.G50a18Cp-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230722/202307221952.G50a18Cp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307221952.G50a18Cp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: relocation R_RISCV_HI20 cannot be used against symbol 'text_mutex'; recompile with -fPIC
   >>> defined in vmlinux.a(kernel/extable.o)
   >>> referenced by errata.c
   >>>               arch/riscv/errata/thead/errata.o:(thead_errata_patch_func) in archive vmlinux.a
--
>> ld.lld: error: relocation R_RISCV_LO12_I cannot be used against symbol 'text_mutex'; recompile with -fPIC
   >>> defined in vmlinux.a(kernel/extable.o)
   >>> referenced by errata.c
   >>>               arch/riscv/errata/thead/errata.o:(thead_errata_patch_func) in archive vmlinux.a
--
>> ld.lld: error: relocation R_RISCV_HI20 cannot be used against symbol 'thead_errata_patch_func.______f'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/riscv/errata/thead/errata.o)
   >>> referenced by errata.c
   >>>               arch/riscv/errata/thead/errata.o:(thead_errata_patch_func) in archive vmlinux.a
--
>> ld.lld: error: relocation R_RISCV_LO12_I cannot be used against symbol 'thead_errata_patch_func.______f'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/riscv/errata/thead/errata.o)
   >>> referenced by errata.c
   >>>               arch/riscv/errata/thead/errata.o:(thead_errata_patch_func) in archive vmlinux.a
--
>> ld.lld: error: relocation R_RISCV_HI20 cannot be used against symbol 'thead_errata_patch_func.______f.3'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/riscv/errata/thead/errata.o)
   >>> referenced by errata.c
   >>>               arch/riscv/errata/thead/errata.o:(thead_errata_patch_func) in archive vmlinux.a
--
>> ld.lld: error: relocation R_RISCV_LO12_I cannot be used against symbol 'thead_errata_patch_func.______f.3'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/riscv/errata/thead/errata.o)
   >>> referenced by errata.c
   >>>               arch/riscv/errata/thead/errata.o:(thead_errata_patch_func) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
