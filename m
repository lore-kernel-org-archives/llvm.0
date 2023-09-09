Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BE815D4;
	Sat,  9 Sep 2023 05:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694236792; x=1725772792;
  h=date:from:cc:subject:message-id:mime-version;
  bh=6RFRvnZEGBESuA+ExdFFFUwuz07LHaNuvmoSb/21WdA=;
  b=OA7D3Um2sgd6GmfRRHu5vou8LxRay4nhUErBO7qv+oWyua+QUVtxFy34
   WukplW3Z5X3J8Bt8TyBInUPC8nqa4OTQbp3rOxBO1dj++mkhWdn9azXvD
   BlpAjakiXr+wp4F79JRkl5+L2kkAPHvNkc+hG2qOc/mnZnplVarYRl9Jv
   ItHoEmtRHtJAIjPrpKlflY8QTHmRG+yJx/5aSIzas+6+tAN3xNWA2EzPb
   snFjVV+O35GZtVsa1l6bGScwVLODrnX7UTh9p69Syqk9nz4X1E3e7A8ws
   LQJ/rGVuG8BDPXJdHAKIYFJ6TsYYx/pGiidPGX+h9ufrAorpeNcoF3JND
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="357259401"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="357259401"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2023 22:19:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="742742152"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="742742152"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 08 Sep 2023 22:19:45 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeqNj-0002x5-0J;
	Sat, 09 Sep 2023 05:19:43 +0000
Date: Sat, 9 Sep 2023 13:19:12 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function
 kallsyms_on_each_match_symbol: .text+0x908): relocation R_RISCV_PCREL_HI20
 out of range: -524528 is not in [-524288, 524287]; references
 kallsyms_relative_base
Message-ID: <202309091338.yB6FrBkQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Zhen Lei <thunder.leizhen@huawei.com>
CC: Luis Chamberlain <mcgrof@kernel.org>

Hi Zhen,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   32bf43e4efdb87e0f7e90ba3883e07b8522322ad
commit: 4dc533e0f2c04174e1ae4aa98e7cffc1c04b9998 kallsyms: Add helper kallsyms_on_each_match_symbol()
date:   10 months ago
config: riscv-randconfig-r021-20230908 (https://download.01.org/0day-ci/archive/20230909/202309091338.yB6FrBkQ-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230909/202309091338.yB6FrBkQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309091338.yB6FrBkQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_on_each_match_symbol: .text+0x908): relocation R_RISCV_PCREL_HI20 out of range: -524528 is not in [-524288, 524287]; references kallsyms_relative_base
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_on_each_match_symbol: .text+0x914): relocation R_RISCV_PCREL_HI20 out of range: -524528 is not in [-524288, 524287]; references kallsyms_seqs_of_names
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_on_each_match_symbol: .text+0x91c): relocation R_RISCV_PCREL_HI20 out of range: -524528 is not in [-524288, 524287]; references kallsyms_offsets
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_lookup_names: .text+0x144): relocation R_RISCV_PCREL_HI20 out of range: -524527 is not in [-524288, 524287]; references kallsyms_num_syms
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_lookup_names: .text+0x17c): relocation R_RISCV_PCREL_HI20 out of range: -524527 is not in [-524288, 524287]; references kallsyms_seqs_of_names
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
