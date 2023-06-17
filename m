Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A2CA93D;
	Sat, 17 Jun 2023 15:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687017281; x=1718553281;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZdsMTa3RELwfB1Ls0tkXNiHJIg9OsHYWfGc1Vw3FNlc=;
  b=PTVE2lJZGRdMq6kcUfEazF4d5nnv0wka7PwgYIeHD5J2QynwVp6ztTpx
   TeRd4T1MKLTyUbsdrDnjWWnTv3G+9rOpNb3KVh7V45rthokFMMvyKEDT2
   Drk5fb6E0/p2KVPsw5o8Mq2N6wxYjx+sTXj1Io915FVspNzfMnrH+OLBU
   ie4GdxYNiPbE2fEEDSQixxcI/GY8hcx6wVx1ejY73Z6rz+0OcJXkeCSWT
   EgVHczgmPsbM7x+Y3naWVPFcBneRHtfOn/P7XDHudvWpNnJ4c63f8UyyT
   AWlpeZgt69hOlG7KnSvCLlC9BaiL0up//6zSlBB0wsQLvQvaNPHdRRwrq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="359409451"
X-IronPort-AV: E=Sophos;i="6.00,250,1681196400"; 
   d="scan'208";a="359409451"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2023 08:54:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="803151099"
X-IronPort-AV: E=Sophos;i="6.00,250,1681196400"; 
   d="scan'208";a="803151099"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 17 Jun 2023 08:54:38 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAYG5-0002sg-2c;
	Sat, 17 Jun 2023 15:54:37 +0000
Date: Sat, 17 Jun 2023 23:54:13 +0800
From: kernel test robot <lkp@intel.com>
To: Manuel Lauss <manuel.lauss@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Sasha Levin <sashal@kernel.org>
Subject: [linux-stable-rc:linux-4.19.y 6274/6288]
 arch/mips/kernel/cpu-probe.c:2050:7: error: duplicate case value '786432'
Message-ID: <202306172304.OtXP5VDT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.19.y
head:   d1785513fcf91e8e81e50a9adddfc08a064709cf
commit: fa4caeb3f05cc831edac116c08ff80a769d88241 [6274/6288] MIPS: Restore Au1300 support
config: mips-pic32mzda_defconfig (https://download.01.org/0day-ci/archive/20230617/202306172304.OtXP5VDT-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230617/202306172304.OtXP5VDT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306172304.OtXP5VDT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/mips/kernel/cpu-probe.c:2050:7: error: duplicate case value '786432'
    2050 |         case PRID_COMP_NETLOGIC:
         |              ^
   arch/mips/include/asm/cpu.h:44:28: note: expanded from macro 'PRID_COMP_NETLOGIC'
      44 | #define PRID_COMP_NETLOGIC      0x0c0000
         |                                 ^
   arch/mips/kernel/cpu-probe.c:2024:7: note: previous case defined here
    2024 |         case PRID_COMP_NETLOGIC:
         |              ^
   arch/mips/include/asm/cpu.h:44:28: note: expanded from macro 'PRID_COMP_NETLOGIC'
      44 | #define PRID_COMP_NETLOGIC      0x0c0000
         |                                 ^
   1 error generated.


vim +/786432 +2050 arch/mips/kernel/cpu-probe.c

9966db25defba4 Ralf Baechle       2007-10-11  1995  
078a55fc824c16 Paul Gortmaker     2013-06-18  1996  void cpu_probe(void)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1997  {
^1da177e4c3f41 Linus Torvalds     2005-04-16  1998  	struct cpuinfo_mips *c = &current_cpu_data;
9966db25defba4 Ralf Baechle       2007-10-11  1999  	unsigned int cpu = smp_processor_id();
^1da177e4c3f41 Linus Torvalds     2005-04-16  2000  
05510f2b481939 Marcin Nowakowski  2017-03-07  2001  	/*
05510f2b481939 Marcin Nowakowski  2017-03-07  2002  	 * Set a default elf platform, cpu probe may later
05510f2b481939 Marcin Nowakowski  2017-03-07  2003  	 * overwrite it with a more precise value
05510f2b481939 Marcin Nowakowski  2017-03-07  2004  	 */
05510f2b481939 Marcin Nowakowski  2017-03-07  2005  	set_elf_platform(cpu, "mips");
05510f2b481939 Marcin Nowakowski  2017-03-07  2006  
^1da177e4c3f41 Linus Torvalds     2005-04-16  2007  	c->processor_id = PRID_IMP_UNKNOWN;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2008  	c->fpu_id	= FPIR_IMP_NONE;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2009  	c->cputype	= CPU_UNKNOWN;
4f12b91d2da577 Markos Chandras    2014-07-18  2010  	c->writecombine = _CACHE_UNCACHED;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2011  
9b26616c8d9dae Maciej W. Rozycki  2015-04-03  2012  	c->fpu_csr31	= FPU_CSR_RN;
9b26616c8d9dae Maciej W. Rozycki  2015-04-03  2013  	c->fpu_msk31	= FPU_CSR_RSVD | FPU_CSR_ABS2008 | FPU_CSR_NAN2008;
9b26616c8d9dae Maciej W. Rozycki  2015-04-03  2014  
^1da177e4c3f41 Linus Torvalds     2005-04-16  2015  	c->processor_id = read_c0_prid();
8ff374b9c296b9 Maciej W. Rozycki  2013-09-17  2016  	switch (c->processor_id & PRID_COMP_MASK) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  2017  	case PRID_COMP_LEGACY:
cea7e2dfdef53f Ralf Baechle       2008-10-30  2018  		cpu_probe_legacy(c, cpu);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2019  		break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2020  	case PRID_COMP_MIPS:
cea7e2dfdef53f Ralf Baechle       2008-10-30  2021  		cpu_probe_mips(c, cpu);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2022  		break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2023  	case PRID_COMP_ALCHEMY:
fa4caeb3f05cc8 Manuel Lauss       2023-05-10  2024  	case PRID_COMP_NETLOGIC:
cea7e2dfdef53f Ralf Baechle       2008-10-30  2025  		cpu_probe_alchemy(c, cpu);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2026  		break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2027  	case PRID_COMP_SIBYTE:
cea7e2dfdef53f Ralf Baechle       2008-10-30  2028  		cpu_probe_sibyte(c, cpu);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2029  		break;
1c0c13eb935c95 Aurelien Jarno     2007-09-25  2030  	case PRID_COMP_BROADCOM:
cea7e2dfdef53f Ralf Baechle       2008-10-30  2031  		cpu_probe_broadcom(c, cpu);
1c0c13eb935c95 Aurelien Jarno     2007-09-25  2032  		break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2033  	case PRID_COMP_SANDCRAFT:
cea7e2dfdef53f Ralf Baechle       2008-10-30  2034  		cpu_probe_sandcraft(c, cpu);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2035  		break;
a92b05880d261e Daniel Laird       2008-03-06  2036  	case PRID_COMP_NXP:
cea7e2dfdef53f Ralf Baechle       2008-10-30  2037  		cpu_probe_nxp(c, cpu);
bdf21b18b4abf9 Pete Popov         2005-07-14  2038  		break;
0dd4781bca5687 David Daney        2008-12-11  2039  	case PRID_COMP_CAVIUM:
0dd4781bca5687 David Daney        2008-12-11  2040  		cpu_probe_cavium(c, cpu);
0dd4781bca5687 David Daney        2008-12-11  2041  		break;
b2edcfc814017e Huacai Chen        2016-03-03  2042  	case PRID_COMP_LOONGSON:
b2edcfc814017e Huacai Chen        2016-03-03  2043  		cpu_probe_loongson(c, cpu);
b2edcfc814017e Huacai Chen        2016-03-03  2044  		break;
252617a4ab714d Paul Burton        2015-05-24  2045  	case PRID_COMP_INGENIC_D0:
252617a4ab714d Paul Burton        2015-05-24  2046  	case PRID_COMP_INGENIC_D1:
252617a4ab714d Paul Burton        2015-05-24  2047  	case PRID_COMP_INGENIC_E1:
83ccf69d8f1183 Lars-Peter Clausen 2010-07-17  2048  		cpu_probe_ingenic(c, cpu);
83ccf69d8f1183 Lars-Peter Clausen 2010-07-17  2049  		break;
a7117c6bddcbff Jayachandran C     2011-05-11 @2050  	case PRID_COMP_NETLOGIC:
a7117c6bddcbff Jayachandran C     2011-05-11  2051  		cpu_probe_netlogic(c, cpu);
a7117c6bddcbff Jayachandran C     2011-05-11  2052  		break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2053  	}
dec8b1ca990055 Franck Bui-Huu     2007-10-08  2054  
cea7e2dfdef53f Ralf Baechle       2008-10-30  2055  	BUG_ON(!__cpu_name[cpu]);
cea7e2dfdef53f Ralf Baechle       2008-10-30  2056  	BUG_ON(c->cputype == CPU_UNKNOWN);
cea7e2dfdef53f Ralf Baechle       2008-10-30  2057  
dec8b1ca990055 Franck Bui-Huu     2007-10-08  2058  	/*
dec8b1ca990055 Franck Bui-Huu     2007-10-08  2059  	 * Platform code can force the cpu type to optimize code
dec8b1ca990055 Franck Bui-Huu     2007-10-08  2060  	 * generation. In that case be sure the cpu type is correctly
dec8b1ca990055 Franck Bui-Huu     2007-10-08  2061  	 * manually setup otherwise it could trigger some nasty bugs.
dec8b1ca990055 Franck Bui-Huu     2007-10-08  2062  	 */
dec8b1ca990055 Franck Bui-Huu     2007-10-08  2063  	BUG_ON(current_cpu_type() != c->cputype);
dec8b1ca990055 Franck Bui-Huu     2007-10-08  2064  
2e274768e4dd95 Florian Fainelli   2016-02-09  2065  	if (cpu_has_rixi) {
2e274768e4dd95 Florian Fainelli   2016-02-09  2066  		/* Enable the RIXI exceptions */
2e274768e4dd95 Florian Fainelli   2016-02-09  2067  		set_c0_pagegrain(PG_IEC);
2e274768e4dd95 Florian Fainelli   2016-02-09  2068  		back_to_back_c0_hazard();
2e274768e4dd95 Florian Fainelli   2016-02-09  2069  		/* Verify the IEC bit is set */
2e274768e4dd95 Florian Fainelli   2016-02-09  2070  		if (read_c0_pagegrain() & PG_IEC)
2e274768e4dd95 Florian Fainelli   2016-02-09  2071  			c->options |= MIPS_CPU_RIXIEX;
2e274768e4dd95 Florian Fainelli   2016-02-09  2072  	}
2e274768e4dd95 Florian Fainelli   2016-02-09  2073  
0103d23f44b1e9 Kevin Cernekee     2010-05-02  2074  	if (mips_fpu_disabled)
0103d23f44b1e9 Kevin Cernekee     2010-05-02  2075  		c->options &= ~MIPS_CPU_FPU;
0103d23f44b1e9 Kevin Cernekee     2010-05-02  2076  
0103d23f44b1e9 Kevin Cernekee     2010-05-02  2077  	if (mips_dsp_disabled)
ee80f7c73dc1b1 Steven J. Hill     2012-08-03  2078  		c->ases &= ~(MIPS_ASE_DSP | MIPS_ASE_DSP2P);
0103d23f44b1e9 Kevin Cernekee     2010-05-02  2079  
3d528b326d7da8 Markos Chandras    2014-07-14  2080  	if (mips_htw_disabled) {
3d528b326d7da8 Markos Chandras    2014-07-14  2081  		c->options &= ~MIPS_CPU_HTW;
3d528b326d7da8 Markos Chandras    2014-07-14  2082  		write_c0_pwctl(read_c0_pwctl() &
3d528b326d7da8 Markos Chandras    2014-07-14  2083  			       ~(1 << MIPS_PWCTL_PWEN_SHIFT));
3d528b326d7da8 Markos Chandras    2014-07-14  2084  	}
3d528b326d7da8 Markos Chandras    2014-07-14  2085  
7aecd5ca80d1c0 Maciej W. Rozycki  2015-04-03  2086  	if (c->options & MIPS_CPU_FPU)
7aecd5ca80d1c0 Maciej W. Rozycki  2015-04-03  2087  		cpu_set_fpu_opts(c);
7aecd5ca80d1c0 Maciej W. Rozycki  2015-04-03  2088  	else
7aecd5ca80d1c0 Maciej W. Rozycki  2015-04-03  2089  		cpu_set_nofpu_opts(c);
9966db25defba4 Ralf Baechle       2007-10-11  2090  
8d5ded16ee7564 Joshua Kinard      2015-06-02  2091  	if (cpu_has_bp_ghist)
8d5ded16ee7564 Joshua Kinard      2015-06-02  2092  		write_c0_r10k_diag(read_c0_r10k_diag() |
8d5ded16ee7564 Joshua Kinard      2015-06-02  2093  				   R10K_DIAG_E_GHIST);
8d5ded16ee7564 Joshua Kinard      2015-06-02  2094  
8b8aa636f02879 Leonid Yegoshin    2014-11-13  2095  	if (cpu_has_mips_r2_r6) {
f6771dbb27c704 Ralf Baechle       2007-11-08  2096  		c->srsets = ((read_c0_srsctl() >> 26) & 0x0f) + 1;
da4b62cd6762ce Al Cooper          2012-07-13  2097  		/* R2 has Performance Counter Interrupt indicator */
da4b62cd6762ce Al Cooper          2012-07-13  2098  		c->options |= MIPS_CPU_PCI;
da4b62cd6762ce Al Cooper          2012-07-13  2099  	}
f6771dbb27c704 Ralf Baechle       2007-11-08  2100  	else
f6771dbb27c704 Ralf Baechle       2007-11-08  2101  		c->srsets = 1;
91dfc423cc8cfd Guenter Roeck      2010-02-02  2102  
4c0630346e2fcf Paul Burton        2015-07-27  2103  	if (cpu_has_mips_r6)
4c0630346e2fcf Paul Burton        2015-07-27  2104  		elf_hwcap |= HWCAP_MIPS_R6;
4c0630346e2fcf Paul Burton        2015-07-27  2105  
a8ad136789b425 Paul Burton        2014-01-28  2106  	if (cpu_has_msa) {
a5e9a69e2cb64c Paul Burton        2014-01-27  2107  		c->msa_id = cpu_get_msa_id();
a8ad136789b425 Paul Burton        2014-01-28  2108  		WARN(c->msa_id & MSA_IR_WRPF,
a8ad136789b425 Paul Burton        2014-01-28  2109  		     "Vector register partitioning unimplemented!");
3cc9fa7fb3e38e Paul Burton        2015-07-27  2110  		elf_hwcap |= HWCAP_MIPS_MSA;
a8ad136789b425 Paul Burton        2014-01-28  2111  	}
a5e9a69e2cb64c Paul Burton        2014-01-27  2112  
34ab38cd80982b Jiaxun Yang        2019-10-10  2113  	if (cpu_has_mips16)
34ab38cd80982b Jiaxun Yang        2019-10-10  2114  		elf_hwcap |= HWCAP_MIPS_MIPS16;
34ab38cd80982b Jiaxun Yang        2019-10-10  2115  
34ab38cd80982b Jiaxun Yang        2019-10-10  2116  	if (cpu_has_mdmx)
34ab38cd80982b Jiaxun Yang        2019-10-10  2117  		elf_hwcap |= HWCAP_MIPS_MDMX;
34ab38cd80982b Jiaxun Yang        2019-10-10  2118  
34ab38cd80982b Jiaxun Yang        2019-10-10  2119  	if (cpu_has_mips3d)
34ab38cd80982b Jiaxun Yang        2019-10-10  2120  		elf_hwcap |= HWCAP_MIPS_MIPS3D;
34ab38cd80982b Jiaxun Yang        2019-10-10  2121  
34ab38cd80982b Jiaxun Yang        2019-10-10  2122  	if (cpu_has_smartmips)
34ab38cd80982b Jiaxun Yang        2019-10-10  2123  		elf_hwcap |= HWCAP_MIPS_SMARTMIPS;
34ab38cd80982b Jiaxun Yang        2019-10-10  2124  
34ab38cd80982b Jiaxun Yang        2019-10-10  2125  	if (cpu_has_dsp)
34ab38cd80982b Jiaxun Yang        2019-10-10  2126  		elf_hwcap |= HWCAP_MIPS_DSP;
34ab38cd80982b Jiaxun Yang        2019-10-10  2127  
34ab38cd80982b Jiaxun Yang        2019-10-10  2128  	if (cpu_has_dsp2)
34ab38cd80982b Jiaxun Yang        2019-10-10  2129  		elf_hwcap |= HWCAP_MIPS_DSP2;
34ab38cd80982b Jiaxun Yang        2019-10-10  2130  
34ab38cd80982b Jiaxun Yang        2019-10-10  2131  	if (cpu_has_dsp3)
34ab38cd80982b Jiaxun Yang        2019-10-10  2132  		elf_hwcap |= HWCAP_MIPS_DSP3;
34ab38cd80982b Jiaxun Yang        2019-10-10  2133  
34ab38cd80982b Jiaxun Yang        2019-10-10  2134  	if (cpu_has_mips16e2)
34ab38cd80982b Jiaxun Yang        2019-10-10  2135  		elf_hwcap |= HWCAP_MIPS_MIPS16E2;
34ab38cd80982b Jiaxun Yang        2019-10-10  2136  
34ab38cd80982b Jiaxun Yang        2019-10-10  2137  	if (cpu_has_loongson_mmi)
34ab38cd80982b Jiaxun Yang        2019-10-10  2138  		elf_hwcap |= HWCAP_LOONGSON_MMI;
34ab38cd80982b Jiaxun Yang        2019-10-10  2139  
34ab38cd80982b Jiaxun Yang        2019-10-10  2140  	if (cpu_has_loongson_ext)
34ab38cd80982b Jiaxun Yang        2019-10-10  2141  		elf_hwcap |= HWCAP_LOONGSON_EXT;
34ab38cd80982b Jiaxun Yang        2019-10-10  2142  
34ab38cd80982b Jiaxun Yang        2019-10-10  2143  	if (cpu_has_loongson_ext2)
34ab38cd80982b Jiaxun Yang        2019-10-10  2144  		elf_hwcap |= HWCAP_LOONGSON_EXT2;
34ab38cd80982b Jiaxun Yang        2019-10-10  2145  
6ad816e77ed775 James Hogan        2016-05-11  2146  	if (cpu_has_vz)
6ad816e77ed775 James Hogan        2016-05-11  2147  		cpu_probe_vz(c);
6ad816e77ed775 James Hogan        2016-05-11  2148  
91dfc423cc8cfd Guenter Roeck      2010-02-02  2149  	cpu_probe_vmbits(c);
949e51bea342da David Daney        2010-10-14  2150  

:::::: The code at line 2050 was first introduced by commit
:::::: a7117c6bddcbfff2fa237a14a853b32cb94bf59a MIPS: Netlogic XLR/XLS processor IDs.

:::::: TO: Jayachandran C <jayachandranc@netlogicmicro.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
