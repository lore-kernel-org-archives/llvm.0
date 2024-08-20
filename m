Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5B018B48A;
	Tue, 20 Aug 2024 09:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724145935; cv=none; b=V+FW9T/yaA3RKN7vpqUW5wN0kjwemehO97ERV4jTDTF+HUWFcmtW13iF5bpN/5euktmnkiWlkZfNKUh2JyjJypcCixGbCHsNcSl5ziOvjX80XL7jh+5LfKCBM4CS9fAXqq+5p+WQS8VHZOWHNhXgNZaJc3VrQudPI0kqNRfDnG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724145935; c=relaxed/simple;
	bh=THweWyUnKikOWA2A+WsOKdmg2rS+0jZaR0q7DErdGs8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S8nlDIEYoauMn/MzWM6D1O3adBbyINPKkbyXIBIXWBe7CUMsFFz/1aao5C/41FoH1B6fAvqD4RL8iyq/XFYL5BDbYCuu6gbjdhJpvlvMWamceVsxL9zZG6MfLet/OfL2sJORIXwkcQxHMZ8Cq9dxb70b/TWDA4gMPZfQ5CkSfMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aoge4Aoc; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aoge4Aoc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724145934; x=1755681934;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=THweWyUnKikOWA2A+WsOKdmg2rS+0jZaR0q7DErdGs8=;
  b=aoge4Aoc1i3uX4EAhJOxafixsqN3Uq+jF5sJkSXt5W8CctqzjpeyHV6Y
   GCWsWNkQiTE5GMljXdzcIteDx/dtHBrUdCFKXbLLHg3L0Up2gg2YT7kYn
   7mWuy+1edTjHUzp1yf+vmk/WB0nCO2x8fIMWRHWq8iEMgHGvr3A3DJirY
   zVOzxPOGIYSZCYkXu3Zq1Fb9v2Vh98eNEc83r6IXbCM8SxXJ9IooLSa9E
   3kgwnrO8QZNnmCJWcLv4GoY38QDnu8H2+YiRvhREIQiDOGxlunVeW5oT4
   FgT2h/t7/bihwxfyuAWs8XrFb68O8D9FVnbfwC9DquEdGBriU9im8T/BH
   g==;
X-CSE-ConnectionGUID: sIJgxArdTG2TNHOnUpPEzQ==
X-CSE-MsgGUID: WPdulMMcQRef+s6haj0d/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22282115"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; 
   d="scan'208";a="22282115"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 02:25:33 -0700
X-CSE-ConnectionGUID: uKJSlvzWTU+N3dv/t9vFdA==
X-CSE-MsgGUID: M23/lFdcQLSJJU+C9YW+0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; 
   d="scan'208";a="64850206"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 Aug 2024 02:25:26 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgL7E-0009y0-1o;
	Tue, 20 Aug 2024 09:25:24 +0000
Date: Tue, 20 Aug 2024 17:25:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jesse Taube <jesse@rivosinc.com>, linux-riscv@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Xiao Wang <xiao.w.wang@intel.com>, Andy Chiu <andy.chiu@sifive.com>,
	Eric Biggers <ebiggers@google.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Baoquan He <bhe@redhat.com>, Anup Patel <apatel@ventanamicro.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Erick Archer <erick.archer@gmx.com>
Subject: Re: [PATCH v8 4/6] RISC-V: Detect unaligned vector accesses supported
Message-ID: <202408201720.u8SfprDk-lkp@intel.com>
References: <20240819212605.1837175-5-jesse@rivosinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819212605.1837175-5-jesse@rivosinc.com>

Hi Jesse,

kernel test robot noticed the following build errors:

[auto build test ERROR on 32d5f7add080a936e28ab4142bfeea6b06999789]

url:    https://github.com/intel-lab-lkp/linux/commits/Jesse-Taube/RISC-V-Check-scalar-unaligned-access-on-all-CPUs/20240820-052900
base:   32d5f7add080a936e28ab4142bfeea6b06999789
patch link:    https://lore.kernel.org/r/20240819212605.1837175-5-jesse%40rivosinc.com
patch subject: [PATCH v8 4/6] RISC-V: Detect unaligned vector accesses supported
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240820/202408201720.u8SfprDk-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 26670e7fa4f032a019d23d56c6a02926e854e8af)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240820/202408201720.u8SfprDk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408201720.u8SfprDk-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/kernel/sys_hwprobe.c:7:
   In file included from include/linux/syscalls.h:93:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:6:
   In file included from include/linux/ring_buffer.h:5:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> arch/riscv/kernel/sys_hwprobe.c:263:7: error: use of undeclared identifier 'RISCV_HWPROBE_KEY_VECTOR_MISALIGNED_PERF'
     263 |         case RISCV_HWPROBE_KEY_VECTOR_MISALIGNED_PERF:
         |              ^
   1 warning and 1 error generated.


vim +/RISCV_HWPROBE_KEY_VECTOR_MISALIGNED_PERF +263 arch/riscv/kernel/sys_hwprobe.c

   234	
   235	static void hwprobe_one_pair(struct riscv_hwprobe *pair,
   236				     const struct cpumask *cpus)
   237	{
   238		switch (pair->key) {
   239		case RISCV_HWPROBE_KEY_MVENDORID:
   240		case RISCV_HWPROBE_KEY_MARCHID:
   241		case RISCV_HWPROBE_KEY_MIMPID:
   242			hwprobe_arch_id(pair, cpus);
   243			break;
   244		/*
   245		 * The kernel already assumes that the base single-letter ISA
   246		 * extensions are supported on all harts, and only supports the
   247		 * IMA base, so just cheat a bit here and tell that to
   248		 * userspace.
   249		 */
   250		case RISCV_HWPROBE_KEY_BASE_BEHAVIOR:
   251			pair->value = RISCV_HWPROBE_BASE_BEHAVIOR_IMA;
   252			break;
   253	
   254		case RISCV_HWPROBE_KEY_IMA_EXT_0:
   255			hwprobe_isa_ext0(pair, cpus);
   256			break;
   257	
   258		case RISCV_HWPROBE_KEY_CPUPERF_0:
   259		case RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF:
   260			pair->value = hwprobe_misaligned(cpus);
   261			break;
   262	
 > 263		case RISCV_HWPROBE_KEY_VECTOR_MISALIGNED_PERF:
   264			pair->value = hwprobe_vec_misaligned(cpus);
   265			break;
   266	
   267		case RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE:
   268			pair->value = 0;
   269			if (hwprobe_ext0_has(cpus, RISCV_HWPROBE_EXT_ZICBOZ))
   270				pair->value = riscv_cboz_block_size;
   271			break;
   272		case RISCV_HWPROBE_KEY_HIGHEST_VIRT_ADDRESS:
   273			pair->value = user_max_virt_addr();
   274			break;
   275	
   276		case RISCV_HWPROBE_KEY_TIME_CSR_FREQ:
   277			pair->value = riscv_timebase;
   278			break;
   279	
   280		/*
   281		 * For forward compatibility, unknown keys don't fail the whole
   282		 * call, but get their element key set to -1 and value set to 0
   283		 * indicating they're unrecognized.
   284		 */
   285		default:
   286			pair->key = -1;
   287			pair->value = 0;
   288			break;
   289		}
   290	}
   291	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
