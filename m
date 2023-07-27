Received: from mgamail.intel.com (unknown [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9921E56E;
	Thu, 27 Jul 2023 11:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690458964; x=1721994964;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Zy2If9UAVh1KW5pmvNV9oV/p1EPBUOfm0H8Og6pFT9E=;
  b=k5rgoqRLimYSilVA/hRhINPHe3LwDTMd9XISKbiSCrzCatfgDBcVVR0E
   amZkV1ZHrTiEMJvfZPKJOqm8/lMRx7Lrfaym6Om49rQSC/zQFv7trUa5K
   9dYtRPFV6nz67ReOPFKWDVhzTy3J//BX+taiW5ulbPRtVjLIq2HFu5RIB
   XTkGyl/UTPlOSiBf/W5oUESkeT8r9rKi+8xZ8VZxTr2gBilrKZk58lvFD
   xPqxVB8Vcv7NTL967fmzSLWeO7RAcR5N2K4SwxrOaeqdkY9dfi2KzmYm6
   jPOCN0+7Zq/EQroFdIC1qHKYqXuqHOZulvEPMTXgP6VYuL4ZOkBLaX+h3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="367161352"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="367161352"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 04:56:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="817067566"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="817067566"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 27 Jul 2023 04:56:02 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOzb7-0002FH-16;
	Thu, 27 Jul 2023 11:56:01 +0000
Date: Thu, 27 Jul 2023 19:55:11 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [netdev-net:main 3/7] ld.lld: error:
 vmlinux.a(init/main.o):(function set_reset_devices: .init.text+0x0):
 relocation R_RISCV_HI20 out of range: 534665 is not in [-524288, 524287];
 references 'reset_devices'
Message-ID: <202307271927.vX8yNpra-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Wei Fang <wei.fang@nxp.com>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git main
head:   ff0df20827f6ac32822f9855998c4db3e99af47c
commit: 15cec633fc7bfe4cd69aa012c3b35b31acfc86f2 [3/7] net: fec: tx processing does not call XDP APIs if budget is 0
config: riscv-randconfig-r035-20230727 (https://download.01.org/0day-ci/archive/20230727/202307271927.vX8yNpra-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230727/202307271927.vX8yNpra-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307271927.vX8yNpra-lkp@intel.com/

Note: the netdev-net/main HEAD ff0df20827f6ac32822f9855998c4db3e99af47c builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(init/main.o):(function set_reset_devices: .init.text+0x0): relocation R_RISCV_HI20 out of range: 534665 is not in [-524288, 524287]; references 'reset_devices'
   >>> referenced by main.c:182 (init/main.c:182)
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function debug_kernel: .init.text+0x14): relocation R_RISCV_HI20 out of range: 533328 is not in [-524288, 524287]; references 'console_printk'
   >>> referenced by main.c:182 (init/main.c:182)
   >>> defined in vmlinux.a(kernel/printk/printk.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function do_early_param: .init.text+0x150): relocation R_RISCV_HI20 out of range: 529696 is not in [-524288, 524287]; references '__setup_end'
   >>> referenced by main.c:245 (init/main.c:245)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function do_early_param: .init.text+0x158): relocation R_RISCV_HI20 out of range: 529695 is not in [-524288, 524287]; references '__setup_start'
   >>> referenced by main.c:245 (init/main.c:245)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function do_early_param: .init.text+0x16c): relocation R_RISCV_HI20 out of range: 533054 is not in [-524288, 524287]; references '.L.str.34'
   >>> referenced by main.c:245 (init/main.c:245)
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function parse_early_param: .init.text+0x204): relocation R_RISCV_HI20 out of range: 529638 is not in [-524288, 524287]; references 'parse_early_param.done'
   >>> referenced by main.c:252 (init/main.c:252)
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function parse_early_param: .init.text+0x210): relocation R_RISCV_HI20 out of range: 529638 is not in [-524288, 524287]; references 'boot_command_line'
   >>> referenced by main.c:252 (init/main.c:252)
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function parse_early_param: .init.text+0x23c): relocation R_RISCV_HI20 out of range: 529638 is not in [-524288, 524287]; references 'parse_early_param.tmp_cmdline'
   >>> referenced by main.c:252 (init/main.c:252)
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function parse_early_param: .init.text+0x258): relocation R_RISCV_HI20 out of range: 532924 is not in [-524288, 524287]; references '.L.str.2'
   >>> referenced by main.c:253 (init/main.c:253)
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function parse_early_param: .init.text+0x260): relocation R_RISCV_HI20 out of range: 529533 is not in [-524288, 524287]; references 'do_early_param'
   >>> referenced by main.c:253 (init/main.c:253)
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function quiet_kernel: .init.text+0x28): relocation R_RISCV_HI20 out of range: 533328 is not in [-524288, 524287]; references 'console_printk'
   >>> referenced by main.c:183 (init/main.c:183)
   >>> defined in vmlinux.a(kernel/printk/printk.o)
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
