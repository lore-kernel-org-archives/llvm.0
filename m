Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F0E847E;
	Sat,  4 Nov 2023 07:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mr5wUh2e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699081426; x=1730617426;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/TptY0I0bwnO49dwFzQVSVlGYS8LLjvzTIo1BWwb/Mk=;
  b=mr5wUh2e//WooNMmuxfrUN8Eens7ehoVaHGP41FhYSrrpmuLWClRswsy
   6X7//JtuGf3JKl2Rkfp1IPWsM1dq7XQ77QAJANpH43dSHCW03uaC6IujK
   /P7aWKLk0wEgc55imCEaZ1sz91d7KF3cRQFWWCYqK9QzRy8XPlomRrsT7
   P402K5FQdsz0T8X/Gy2qYhr6vZ5wQApnomArHrUKxIv2EdqdHD1pHn4Ds
   HRdBIe9s8C5UBYMqAFtDXAOxipLTGE7f3QdHhgHaJIE+t+DxRy3GQI63K
   HOWyQAfI3D7xs6c5K7K6ASSwMskbaBJtW0F+vb1lvfNFemGM0adxk5Tc1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="374100125"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="374100125"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2023 00:03:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="905564563"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="905564563"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 04 Nov 2023 00:03:44 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzAh4-0003b6-0F;
	Sat, 04 Nov 2023 07:03:42 +0000
Date: Sat, 4 Nov 2023 15:02:57 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Anup Patel <anup@brainfault.org>, Evan Green <evan@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [avpatel:riscv_sbi_nested_v1 64/76]
 arch/riscv/kernel/sys_riscv.c:266:30: warning: implicit conversion from
 'unsigned long long' to 'unsigned long' changes value from 4294967296 to 0
Message-ID: <202311041444.GkbB4biw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_sbi_nested_v1
head:   9763a6c438da81175e07a5736eeb1e505a74e693
commit: 3b516003495c3ceb036e452b29691977d00616d0 [64/76] RISC-V: hwprobe: Expose Zicboz extension and its block size
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20231104/202311041444.GkbB4biw-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311041444.GkbB4biw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311041444.GkbB4biw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/kernel/sys_riscv.c:266:30: warning: implicit conversion from 'unsigned long long' to 'unsigned long' changes value from 4294967296 to 0 [-Wconstant-conversion]
     266 |                 if (hwprobe_ext0_has(cpus, RISCV_HWPROBE_EXT_ZICBOZ))
         |                     ~~~~~~~~~~~~~~~~       ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/uapi/asm/hwprobe.h:58:41: note: expanded from macro 'RISCV_HWPROBE_EXT_ZICBOZ'
      58 | #define         RISCV_HWPROBE_EXT_ZICBOZ        (1ULL << 32)
         |                                                  ~~~~~^~~~~
   1 warning generated.


vim +266 arch/riscv/kernel/sys_riscv.c

   236	
   237	static void hwprobe_one_pair(struct riscv_hwprobe *pair,
   238				     const struct cpumask *cpus)
   239	{
   240		switch (pair->key) {
   241		case RISCV_HWPROBE_KEY_MVENDORID:
   242		case RISCV_HWPROBE_KEY_MARCHID:
   243		case RISCV_HWPROBE_KEY_MIMPID:
   244			hwprobe_arch_id(pair, cpus);
   245			break;
   246		/*
   247		 * The kernel already assumes that the base single-letter ISA
   248		 * extensions are supported on all harts, and only supports the
   249		 * IMA base, so just cheat a bit here and tell that to
   250		 * userspace.
   251		 */
   252		case RISCV_HWPROBE_KEY_BASE_BEHAVIOR:
   253			pair->value = RISCV_HWPROBE_BASE_BEHAVIOR_IMA;
   254			break;
   255	
   256		case RISCV_HWPROBE_KEY_IMA_EXT_0:
   257			hwprobe_isa_ext0(pair, cpus);
   258			break;
   259	
   260		case RISCV_HWPROBE_KEY_CPUPERF_0:
   261			pair->value = hwprobe_misaligned(cpus);
   262			break;
   263	
   264		case RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE:
   265			pair->value = 0;
 > 266			if (hwprobe_ext0_has(cpus, RISCV_HWPROBE_EXT_ZICBOZ))
   267				pair->value = riscv_cboz_block_size;
   268			break;
   269	
   270		/*
   271		 * For forward compatibility, unknown keys don't fail the whole
   272		 * call, but get their element key set to -1 and value set to 0
   273		 * indicating they're unrecognized.
   274		 */
   275		default:
   276			pair->key = -1;
   277			pair->value = 0;
   278			break;
   279		}
   280	}
   281	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
