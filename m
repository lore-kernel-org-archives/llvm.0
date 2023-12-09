Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48966810;
	Sat,  9 Dec 2023 02:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JvIRyY+m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702089590; x=1733625590;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4CE9sM053J6aohwBxo6bhrvVdr6BIe2JxI8KJ0O3uRQ=;
  b=JvIRyY+mtcx3ob77mo7IDnQ/CGeHIUAfMdNV5mRuMcRW1Ltj9RRWZVM9
   /ZJVXJdSlEy3nTeZ1nmJNfifuSVzBrAVfxdxPP3VQuI/vBIL4prAHwD5h
   jVmAWQ1scwpIy3hREEzSK5C/FZj3L7xDUBIGa0xZatkofU0y9QRAD2QPI
   /NZIKJgaNstMasN/7eoYvYOfmvC1FXKf9eFt9lYfAmzB1bOaoyHZGMWQj
   vFu7ESmERgPE453gUF7+5XPLCK54Lzzq00WsGhgLkDPR36dLNhdU9h049
   G1UE23C1En98S4gU/3OL889UJuYvFdebG6SFZoYtPpOWUNMMKc3ecpXAz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="374000900"
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; 
   d="scan'208";a="374000900"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 18:39:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="945606814"
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; 
   d="scan'208";a="945606814"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 08 Dec 2023 18:39:45 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBnFn-000EiS-1c;
	Sat, 09 Dec 2023 02:39:43 +0000
Date: Sat, 9 Dec 2023 10:39:11 +0800
From: kernel test robot <lkp@intel.com>
To: Hari Bathini <hbathini@linux.ibm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/3] powerpc/pseries/fadump: add support for multiple
 boot memory regions
Message-ID: <202312091034.YzllwdF4-lkp@intel.com>
References: <20231205201835.388030-2-hbathini@linux.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205201835.388030-2-hbathini@linux.ibm.com>

Hi Hari,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes linus/master v6.7-rc4 next-20231208]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hari-Bathini/powerpc-pseries-fadump-add-support-for-multiple-boot-memory-regions/20231206-042158
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20231205201835.388030-2-hbathini%40linux.ibm.com
patch subject: [RFC PATCH 1/3] powerpc/pseries/fadump: add support for multiple boot memory regions
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20231209/202312091034.YzllwdF4-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231209/202312091034.YzllwdF4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312091034.YzllwdF4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/platforms/pseries/rtas-fadump.c:55:4: error: expected expression
      55 |                         u64 addr = be64_to_cpu(fdm->rgn[i].destination_address);
         |                         ^
>> arch/powerpc/platforms/pseries/rtas-fadump.c:57:50: error: use of undeclared identifier 'addr'
      57 |                         fadump_conf->cpu_state_dest_vaddr = (u64)__va(addr);
         |                                                                       ^
>> arch/powerpc/platforms/pseries/rtas-fadump.c:57:50: error: use of undeclared identifier 'addr'
   arch/powerpc/platforms/pseries/rtas-fadump.c:62:43: error: use of undeclared identifier 'addr'
      62 |                         fadump_conf->reserve_dump_area_start = addr;
         |                                                                ^
   4 errors generated.


vim +55 arch/powerpc/platforms/pseries/rtas-fadump.c

    35	
    36	/*
    37	 * This function is called in the capture kernel to get configuration details
    38	 * setup in the first kernel and passed to the f/w.
    39	 */
    40	static void __init rtas_fadump_get_config(struct fw_dump *fadump_conf,
    41					   const struct rtas_fadump_mem_struct *fdm)
    42	{
    43		unsigned long base, size, last_end, hole_size;
    44	
    45		last_end = 0;
    46		hole_size = 0;
    47		fadump_conf->boot_memory_size = 0;
    48		fadump_conf->boot_mem_regs_cnt = 0;
    49		pr_debug("Boot memory regions:\n");
    50		for (int i = 0; i < be16_to_cpu(fdm->header.dump_num_sections); i++) {
    51			int type = be16_to_cpu(fdm->rgn[i].source_data_type);
    52	
    53			switch (type) {
    54			case RTAS_FADUMP_CPU_STATE_DATA:
  > 55				u64 addr = be64_to_cpu(fdm->rgn[i].destination_address);
    56	
  > 57				fadump_conf->cpu_state_dest_vaddr = (u64)__va(addr);
    58				/*
    59				 * Start address of reserve dump area (permanent reservation) for
    60				 * re-registering FADump after dump capture.
    61				 */
    62				fadump_conf->reserve_dump_area_start = addr;
    63				break;
    64			case RTAS_FADUMP_HPTE_REGION:
    65				/* Not processed currently. */
    66				break;
    67			case RTAS_FADUMP_REAL_MODE_REGION:
    68				base = be64_to_cpu(fdm->rgn[i].source_address);
    69				size = be64_to_cpu(fdm->rgn[i].source_len);
    70				pr_debug("\t[%03d] base: 0x%lx, size: 0x%lx\n", i, base, size);
    71				if (!base) {
    72					fadump_conf->boot_mem_dest_addr =
    73						be64_to_cpu(fdm->rgn[i].destination_address);
    74				}
    75	
    76				fadump_conf->boot_mem_addr[fadump_conf->boot_mem_regs_cnt] = base;
    77				fadump_conf->boot_mem_sz[fadump_conf->boot_mem_regs_cnt] = size;
    78				fadump_conf->boot_memory_size += size;
    79				hole_size += (base - last_end);
    80				last_end = base + size;
    81				fadump_conf->boot_mem_regs_cnt++;
    82				break;
    83			default:
    84				pr_warn("Section type %d unsupported on this kernel. Ignoring!\n", type);
    85				break;
    86			}
    87		}
    88		fadump_conf->boot_mem_top = fadump_conf->boot_memory_size + hole_size;
    89	
    90		rtas_fadump_update_config(fadump_conf, fdm);
    91	}
    92	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
