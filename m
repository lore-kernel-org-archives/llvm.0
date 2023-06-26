Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F543947A;
	Mon, 26 Jun 2023 13:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687786751; x=1719322751;
  h=date:from:cc:subject:message-id:mime-version;
  bh=xOg20E9f1n3I03kJ5H2YgXDDsJyOE9BoJ/x7fIh/E+4=;
  b=ELbKJNncaDc5fytlWBQFNK0nUhNxZDBbE1OrFO+8lWFQpWKpIz2W3TFz
   lyzNqTCSvRIepmnxrovTbp+3hyUXl076Tt4ReV7YG82/yZ8KpKtFPwBeX
   siYtCg5LPKYGvrz41BcwqX435Kt8yx1BxY1lmngGcR2ewba2lu+TaCeU6
   vto14sNmfHgnnrj5GfnomMB1C2Wpknmmam+K+7JqovA5PsKKms0oHIPmm
   TVtd4z1Z0lOi4caWC68Ytf3NGo+UtILv1GCOdADM/2CM4TAJE6uTaGWBW
   rcYGcvZ2DVlga8Fac/H3eAa0L3f23fjS2wGs6BPP5t8CqAb7wl+qR0s34
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="363815569"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="363815569"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2023 06:39:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="1046502806"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="1046502806"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 26 Jun 2023 06:39:09 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qDmQv-000AiH-0K;
	Mon, 26 Jun 2023 13:39:09 +0000
Date: Mon, 26 Jun 2023 21:39:02 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: ld.lld: error: vmlinux.a(kernel/bpf/btf.o):(function
 btf_parse_vmlinux: .text+0x4848): relocation R_RISCV_PCREL_HI20 out of
 range: -525535 is not in [-524288, 524287]; references __start_BTF
Message-ID: <202306262145.vzymyN85-lkp@intel.com>
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
head:   6995e2de6891c724bfeb2db33d7b87775f913ad1
commit: 49f965b6fbca63904d7397ce96066fa992f401a3 soc: canaan: Make K210_SYSCTL depend on CLK_K210
date:   3 months ago
config: riscv-randconfig-r003-20230626 (https://download.01.org/0day-ci/archive/20230626/202306262145.vzymyN85-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230626/202306262145.vzymyN85-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306262145.vzymyN85-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(kernel/bpf/btf.o):(function btf_parse_vmlinux: .text+0x4848): relocation R_RISCV_PCREL_HI20 out of range: -525535 is not in [-524288, 524287]; references __start_BTF
   >>> referenced by btf.c:525 (kernel/bpf/btf.c:525)
   >>> defined in vmlinux.a(kernel/bpf/btf.o)
--
>> ld.lld: error: vmlinux.a(kernel/bpf/btf.o):(function btf_parse_vmlinux: .text+0x4854): relocation R_RISCV_PCREL_HI20 out of range: -525535 is not in [-524288, 524287]; references __stop_BTF
   >>> referenced by btf.c:525 (kernel/bpf/btf.c:525)
   >>> defined in vmlinux.a(kernel/bpf/btf.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_lookup_names: .text+0x1a0): relocation R_RISCV_PCREL_HI20 out of range: -524978 is not in [-524288, 524287]; references kallsyms_seqs_of_names
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_on_each_symbol: .text+0x44c): relocation R_RISCV_PCREL_HI20 out of range: -524978 is not in [-524288, 524287]; references kallsyms_num_syms
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_on_each_symbol: .text+0x460): relocation R_RISCV_PCREL_HI20 out of range: -524978 is not in [-524288, 524287]; references kallsyms_relative_base
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_on_each_symbol: .text+0x464): relocation R_RISCV_PCREL_HI20 out of range: -524978 is not in [-524288, 524287]; references kallsyms_offsets
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_expand_symbol: .text+0x55c): relocation R_RISCV_PCREL_HI20 out of range: -524978 is not in [-524288, 524287]; references kallsyms_names
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_expand_symbol: .text+0x5a8): relocation R_RISCV_PCREL_HI20 out of range: -524978 is not in [-524288, 524287]; references kallsyms_token_index
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_expand_symbol: .text+0x5b0): relocation R_RISCV_PCREL_HI20 out of range: -524978 is not in [-524288, 524287]; references kallsyms_token_table
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_on_each_match_symbol: .text+0x6e8): relocation R_RISCV_PCREL_HI20 out of range: -524978 is not in [-524288, 524287]; references kallsyms_relative_base
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_on_each_match_symbol: .text+0x6f8): relocation R_RISCV_PCREL_HI20 out of range: -524978 is not in [-524288, 524287]; references kallsyms_seqs_of_names
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
