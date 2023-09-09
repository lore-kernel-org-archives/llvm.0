Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBEF15B4;
	Sat,  9 Sep 2023 03:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694231565; x=1725767565;
  h=date:from:cc:subject:message-id:mime-version;
  bh=5jmsiqnlfi0/iUuKVVXAn8i93l/x7fRdY+INKVfRR3w=;
  b=F5Qa0FTTJa21q81SdjC42MTHfEdLfEJqsUcTpNRUojmTBzy1Wm6IN1R+
   n6ygR66qyHaL3JvlyI50XKj8bPgDgIePeX6m1E8K/HHro7k29EEFCKSln
   ld97k6/HPP+zVvm4Gt1CE43m969VcKpV2ItVHEYxXcwS825iQy5H6KqJO
   MzaVi9eguJqNi6UEEM0DhJ1xJy23/bnrJ4FUpwPWe+QtAE+fbuH/Bb2Kd
   UaSAbDzbT2rqHBVGkHZRBNkYP63dBprf/zcz2zg2+IwUQrweiaSpynBWR
   jVhgYF84i28F1OgJoZzh1sKO5alReuoSKdwIF0r1qu75ybk49K+HTdRQV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="376697959"
X-IronPort-AV: E=Sophos;i="6.02,238,1688454000"; 
   d="scan'208";a="376697959"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2023 20:52:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="857632570"
X-IronPort-AV: E=Sophos;i="6.02,238,1688454000"; 
   d="scan'208";a="857632570"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 08 Sep 2023 20:52:42 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qep1U-0002tb-2Q;
	Sat, 09 Sep 2023 03:52:40 +0000
Date: Sat, 9 Sep 2023 11:52:14 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function
 kallsyms_expand_symbol: .text+0x312): relocation R_RISCV_PCREL_HI20 out of
 range: -524388 is not in [-524288, 524287]; references kallsyms_names
Message-ID: <202309091100.M8NNLyhb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Jesse Taube <mr.bossman075@gmail.com>
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Damien Le Moal <damien.lemoal@opensource.wdc.com>

Hi Jesse,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   32bf43e4efdb87e0f7e90ba3883e07b8522322ad
commit: 49f965b6fbca63904d7397ce96066fa992f401a3 soc: canaan: Make K210_SYSCTL depend on CLK_K210
date:   6 months ago
config: riscv-randconfig-r002-20230909 (https://download.01.org/0day-ci/archive/20230909/202309091100.M8NNLyhb-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230909/202309091100.M8NNLyhb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309091100.M8NNLyhb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_expand_symbol: .text+0x312): relocation R_RISCV_PCREL_HI20 out of range: -524388 is not in [-524288, 524287]; references kallsyms_names
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_expand_symbol: .text+0x352): relocation R_RISCV_PCREL_HI20 out of range: -524388 is not in [-524288, 524287]; references kallsyms_token_index
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_expand_symbol: .text+0x35a): relocation R_RISCV_PCREL_HI20 out of range: -524388 is not in [-524288, 524287]; references kallsyms_token_table
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function get_symbol_pos: .text+0x51a): relocation R_RISCV_PCREL_HI20 out of range: -524388 is not in [-524288, 524287]; references kallsyms_offsets
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function get_symbol_pos: .text+0x538): relocation R_RISCV_PCREL_HI20 out of range: -524388 is not in [-524288, 524287]; references kallsyms_num_syms
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function get_symbol_pos: .text+0x542): relocation R_RISCV_PCREL_HI20 out of range: -524388 is not in [-524288, 524287]; references kallsyms_relative_base
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function get_symbol_offset: .text+0x742): relocation R_RISCV_PCREL_HI20 out of range: -524388 is not in [-524288, 524287]; references kallsyms_markers
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
