Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2807F;
	Mon, 26 Jun 2023 03:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687748708; x=1719284708;
  h=date:from:cc:subject:message-id:mime-version;
  bh=1UqRGbPFwdNjvgf/tKht35pe8Z2hbtFC3n6ZOQiLu0s=;
  b=bmdqLy6nJnyznJyJyPee8eiqhTw8NKeOVhZHemyXO6ZMzwQK+27RbtLG
   0ls9BGi6+f0F3nKsh2+tJI16VN2N9D9fxniDsdsz4wYsgCECondGyikLD
   FeOM1QuV4Lt1rHEW5UrPj9lwNxt+VQRdl8R+zmfT3i4Db40OcgC0XBPh/
   a6I9yhz982sjKI5AhFjcXws2sCkcWPaiEoxM+x8IZTZ1q1dEoatYlKFUs
   n/G8vnE4EwKZ0zcHC240U5AXV7fJygfJy16l4okIoA9eXQIRXiwK/JSdy
   3rR3LOTKeycch7sOPLn0PNJJxcjTHG7DFpWVTi/346zaUTZtBy1j/3JW3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="340747201"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; 
   d="scan'208";a="340747201"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2023 20:05:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="693310922"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; 
   d="scan'208";a="693310922"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 25 Jun 2023 20:05:06 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qDcXJ-000ARN-2v;
	Mon, 26 Jun 2023 03:05:05 +0000
Date: Mon, 26 Jun 2023 11:04:42 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [stable:linux-6.3.y 192/2125] ld.lld: error:
 vmlinux.a(kernel/bpf/btf.o):(function btf_parse_vmlinux: .text+0x4848):
 relocation R_RISCV_PCREL_HI20 out of range: -525535 is not in [-524288,
 524287]; references __start_BTF
Message-ID: <202306261125.47OqzBwu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Jesse Taube <mr.bossman075@gmail.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Damien Le Moal <damien.lemoal@opensource.wdc.com>
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Sasha Levin <sashal@kernel.org>

Hi Jesse,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-6.3.y
head:   00d3ac724541a0661b148b16cf34fac135a4fd53
commit: 38618d092443f8bcadcc2a6301b200f0354e8818 [192/2125] soc: canaan: Make K210_SYSCTL depend on CLK_K210
config: riscv-randconfig-r003-20230626 (https://download.01.org/0day-ci/archive/20230626/202306261125.47OqzBwu-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230626/202306261125.47OqzBwu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306261125.47OqzBwu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(kernel/bpf/btf.o):(function btf_parse_vmlinux: .text+0x4848): relocation R_RISCV_PCREL_HI20 out of range: -525535 is not in [-524288, 524287]; references __start_BTF
   >>> referenced by btf.c:525 (kernel/bpf/btf.c:525)
   >>> defined in vmlinux.a(kernel/bpf/btf.o)
--
>> ld.lld: error: vmlinux.a(kernel/bpf/btf.o):(function btf_parse_vmlinux: .text+0x4854): relocation R_RISCV_PCREL_HI20 out of range: -525535 is not in [-524288, 524287]; references __stop_BTF
   >>> referenced by btf.c:525 (kernel/bpf/btf.c:525)
   >>> defined in vmlinux.a(kernel/bpf/btf.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
