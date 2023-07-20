Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B95F1BE60;
	Thu, 20 Jul 2023 19:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689880180; x=1721416180;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4Wfb2inEMSDHDJojVV6mLPU3xJG55Y/mqso7z8ONCk4=;
  b=g47cNl2PaTWTuXWL/kKANm6MbyFDDO8ICiOVdFUhyuWHMX4KEN3fnCVB
   yyaphBW6s316wxkt6SynsJ4Q0YVAVCARN1BRogmjl0fva+fcktR/vbZ1h
   y6EEOR6IVKCSSliK4ZOfq7fv/jy2wAK73c+VBjkm+zinoCsGWq+hgXvmN
   k7lVBWDRFXGBPpH/9b+JykNiqQknRfcGXV739JX6bwrLgrKvzcX0JxSpd
   uR4XjCI8Smyjeu68p47XgYpnHQbRIhYvjCHd6kMLNVbCUaNniHdhM4tqA
   yFMf97nXLLvUrzR7m5Lm1xowjj2hkBbrhtscMEaUGOatmRcxNwI9QzvxR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="366875440"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="366875440"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 12:09:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="718543445"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="718543445"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 20 Jul 2023 12:09:14 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMZ1V-0006Pp-2O;
	Thu, 20 Jul 2023 19:09:13 +0000
Date: Fri, 21 Jul 2023 03:08:41 +0800
From: kernel test robot <lkp@intel.com>
To: Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hari Bathini <hbathini@linux.ibm.com>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	Sachin Sant <sachinp@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] kdump fix
Message-ID: <202307210220.4FoNS76V-lkp@intel.com>
References: <2ogfzwjumrd44kxv7njfpot6fhtkzpqu77qv3bspfixdmsxcwc@umt35y2hmslm>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ogfzwjumrd44kxv7njfpot6fhtkzpqu77qv3bspfixdmsxcwc@umt35y2hmslm>

Hi Mahesh,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.5-rc2 next-20230720]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mahesh-J-Salgaonkar/kdump-fix/20230720-021115
base:   linus/master
patch link:    https://lore.kernel.org/r/2ogfzwjumrd44kxv7njfpot6fhtkzpqu77qv3bspfixdmsxcwc%40umt35y2hmslm
patch subject: [PATCH] kdump fix
config: x86_64-randconfig-r021-20230720 (https://download.01.org/0day-ci/archive/20230721/202307210220.4FoNS76V-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230721/202307210220.4FoNS76V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307210220.4FoNS76V-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/kexec_file.c:1282:18: error: use of undeclared identifier 'ELF_CORE_EFLAGS'
           ehdr->e_flags = ELF_CORE_EFLAGS;
                           ^
   1 error generated.


vim +/ELF_CORE_EFLAGS +1282 kernel/kexec_file.c

  1236	
  1237	int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
  1238				  void **addr, unsigned long *sz)
  1239	{
  1240		Elf64_Ehdr *ehdr;
  1241		Elf64_Phdr *phdr;
  1242		unsigned long nr_cpus = num_possible_cpus(), nr_phdr, elf_sz;
  1243		unsigned char *buf;
  1244		unsigned int cpu, i;
  1245		unsigned long long notes_addr;
  1246		unsigned long mstart, mend;
  1247	
  1248		/* extra phdr for vmcoreinfo ELF note */
  1249		nr_phdr = nr_cpus + 1;
  1250		nr_phdr += mem->nr_ranges;
  1251	
  1252		/*
  1253		 * kexec-tools creates an extra PT_LOAD phdr for kernel text mapping
  1254		 * area (for example, ffffffff80000000 - ffffffffa0000000 on x86_64).
  1255		 * I think this is required by tools like gdb. So same physical
  1256		 * memory will be mapped in two ELF headers. One will contain kernel
  1257		 * text virtual addresses and other will have __va(physical) addresses.
  1258		 */
  1259	
  1260		nr_phdr++;
  1261		elf_sz = sizeof(Elf64_Ehdr) + nr_phdr * sizeof(Elf64_Phdr);
  1262		elf_sz = ALIGN(elf_sz, ELF_CORE_HEADER_ALIGN);
  1263	
  1264		buf = vzalloc(elf_sz);
  1265		if (!buf)
  1266			return -ENOMEM;
  1267	
  1268		ehdr = (Elf64_Ehdr *)buf;
  1269		phdr = (Elf64_Phdr *)(ehdr + 1);
  1270		memcpy(ehdr->e_ident, ELFMAG, SELFMAG);
  1271		ehdr->e_ident[EI_CLASS] = ELFCLASS64;
  1272		ehdr->e_ident[EI_DATA] = ELFDATA2LSB;
  1273		ehdr->e_ident[EI_VERSION] = EV_CURRENT;
  1274		ehdr->e_ident[EI_OSABI] = ELF_OSABI;
  1275		memset(ehdr->e_ident + EI_PAD, 0, EI_NIDENT - EI_PAD);
  1276		ehdr->e_type = ET_CORE;
  1277		ehdr->e_machine = ELF_ARCH;
  1278		ehdr->e_version = EV_CURRENT;
  1279		ehdr->e_phoff = sizeof(Elf64_Ehdr);
  1280		ehdr->e_ehsize = sizeof(Elf64_Ehdr);
  1281		ehdr->e_phentsize = sizeof(Elf64_Phdr);
> 1282		ehdr->e_flags = ELF_CORE_EFLAGS;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
