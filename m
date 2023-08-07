Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB11217736;
	Mon,  7 Aug 2023 22:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691446217; x=1722982217;
  h=date:from:cc:subject:message-id:mime-version;
  bh=cPb0mGwj+ggqjTlb47F7P/NZMdgKiMZAxZzveoSEGzc=;
  b=K16tatp2l6lk9EiLttCe76HFZhrY4j3FQffbgOpkYfm24I+x7UMiBSUU
   R9lQkqqD3sV2QtVU+28ACvayXVBQfLEwSjzMZr6jilqfaVqX44FTsMR+3
   9B44IAogfbBBJVj0TLIR2jCqTHWgsNF/4U3rROVRWp7GZqYXJTqg1frl9
   /hDEUf30PbN6uJbRWoKRDCzQj3/PIwA3Zy2pDoR2JP3l2nMaqNgraI+s0
   +nXAJCoBgKnTBziH1Tczh/wyDLBIWVxSt+cIeRxpAKdyE7Z9ayd0Ja3ZJ
   aKFxS+xowhn+1fulP9nA3fy0SKVrD03bFL5UNFEHv/YwO/EetMKkfdlvJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="360749111"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="360749111"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2023 15:10:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="977620641"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="977620641"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 07 Aug 2023 15:10:16 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qT8QZ-0004uR-18;
	Mon, 07 Aug 2023 22:10:15 +0000
Date: Tue, 8 Aug 2023 06:09:34 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [iwi:peci-next 1/7] ld.lld: error: vmlinux.a(init/main.o):(function
 trace_event_raw_event_initcall_level: .text+0x144): relocation R_RISCV_HI20
 out of range: 527722 is not in [-524288, 524287]; references
 'trace_trigger_soft_disabled.______f'
Message-ID: <202308080516.im85ji03-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Naresh Solanki <naresh.solanki@9elements.com>
CC: Iwona Winiarska <iwona.winiarska@intel.com>
CC: Patrick Rudolph <patrick.rudolph@9elements.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwi/linux.git peci-next
head:   d7c99890fe06a170c77af12b0c105babb3a47a04
commit: 37dd6b9f5bb0081082349d808fb4ac07f76fbf97 [1/7] peci: cpu: Add Intel Sapphire Rapids support
config: riscv-randconfig-r031-20230808 (https://download.01.org/0day-ci/archive/20230808/202308080516.im85ji03-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230808/202308080516.im85ji03-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308080516.im85ji03-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(init/main.o):(function trace_event_raw_event_initcall_level: .text+0x144): relocation R_RISCV_HI20 out of range: 527722 is not in [-524288, 524287]; references 'trace_trigger_soft_disabled.______f'
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function trace_event_raw_event_initcall_level: .text+0x164): relocation R_RISCV_HI20 out of range: 527722 is not in [-524288, 524287]; references 'trace_trigger_soft_disabled.______f.21'
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function trace_event_raw_event_initcall_start: .text+0x240): relocation R_RISCV_HI20 out of range: 527722 is not in [-524288, 524287]; references 'trace_trigger_soft_disabled.______f'
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function trace_event_raw_event_initcall_start: .text+0x260): relocation R_RISCV_HI20 out of range: 527722 is not in [-524288, 524287]; references 'trace_trigger_soft_disabled.______f.21'
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
