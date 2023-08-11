Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D5C1869;
	Fri, 11 Aug 2023 09:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691745052; x=1723281052;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=34A13lgBgtVodLG5J4KXeIyraaHm8BajR+D9zSX6nww=;
  b=LrzuGMttJjYqq5S8UFhUpeZuYdXU544NH7eQfBQUscDWiZ+hLGcOYAOz
   RTPqHiAeglbnMNPw9utI7aTF75zafkGpDliEoydHyMNv9Lqs7NePphSsM
   xsE8xUZAUoBUWBnlJzXjNrJu2JyVQ0RrleTbuo0/qWWkPpRszdQM+k6+n
   a0iHH1B4I4MzKLMAaMiAO1BEhEiEyIm45ayIYiLgx9yYSt2nhnjZDRY7e
   6n86TpC4tahusHRqMCHneT46xxmwq4RCbtJKlHBs++SXixLEvsLckHX9U
   gcxjv9QzFNuJq1RDGOojt8AcETQqMTuxTkZ6LeCrYQJo0A7ust4ZBaBHt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="375349995"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="375349995"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 02:10:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="797958364"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="797958364"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 11 Aug 2023 02:10:38 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUOAH-0007fK-1O;
	Fri, 11 Aug 2023 09:10:37 +0000
Date: Fri, 11 Aug 2023 17:10:01 +0800
From: kernel test robot <lkp@intel.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Sourabh Jain <sourabhjain@linux.ibm.com>
Subject: [akpm-mm:mm-nonmm-unstable 56/78] kernel/crash_core.c:331:16: error:
 incomplete definition of type 'struct crash_mem'
Message-ID: <202308111736.VWdS2xfs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   0f6b2c125ce19074c1086a70119b02dd30b089a4
commit: 3f1eba00ee9d93b66f1859d40537befe44ceb1cd [56/78] crash: move a few code bits to setup support of crash hotplug
config: x86_64-buildonly-randconfig-r003-20230811 (https://download.01.org/0day-ci/archive/20230811/202308111736.VWdS2xfs-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230811/202308111736.VWdS2xfs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308111736.VWdS2xfs-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/crash_core.c:318:40: warning: declaration of 'struct crash_mem' will not be visible outside of this function [-Wvisibility]
   int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
                                          ^
>> kernel/crash_core.c:331:16: error: incomplete definition of type 'struct crash_mem'
           nr_phdr += mem->nr_ranges;
                      ~~~^
   kernel/crash_core.c:318:40: note: forward declaration of 'struct crash_mem'
   int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
                                          ^
>> kernel/crash_core.c:343:25: error: use of undeclared identifier 'ELF_CORE_HEADER_ALIGN'
           elf_sz = ALIGN(elf_sz, ELF_CORE_HEADER_ALIGN);
                                  ^
>> kernel/crash_core.c:343:25: error: use of undeclared identifier 'ELF_CORE_HEADER_ALIGN'
   kernel/crash_core.c:393:21: error: incomplete definition of type 'struct crash_mem'
           for (i = 0; i < mem->nr_ranges; i++) {
                           ~~~^
   kernel/crash_core.c:318:40: note: forward declaration of 'struct crash_mem'
   int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
                                          ^
   kernel/crash_core.c:394:15: error: incomplete definition of type 'struct crash_mem'
                   mstart = mem->ranges[i].start;
                            ~~~^
   kernel/crash_core.c:318:40: note: forward declaration of 'struct crash_mem'
   int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
                                          ^
   kernel/crash_core.c:395:13: error: incomplete definition of type 'struct crash_mem'
                   mend = mem->ranges[i].end;
                          ~~~^
   kernel/crash_core.c:318:40: note: forward declaration of 'struct crash_mem'
   int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
                                          ^
   kernel/crash_core.c:318:5: warning: no previous prototype for function 'crash_prepare_elf64_headers' [-Wmissing-prototypes]
   int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
       ^
   kernel/crash_core.c:318:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
   ^
   static 
   kernel/crash_core.c:417:36: warning: declaration of 'struct crash_mem' will not be visible outside of this function [-Wvisibility]
   int crash_exclude_mem_range(struct crash_mem *mem,
                                      ^
   kernel/crash_core.c:424:21: error: incomplete definition of type 'struct crash_mem'
           for (i = 0; i < mem->nr_ranges; i++) {
                           ~~~^
   kernel/crash_core.c:417:36: note: forward declaration of 'struct crash_mem'
   int crash_exclude_mem_range(struct crash_mem *mem,
                                      ^
   kernel/crash_core.c:425:14: error: incomplete definition of type 'struct crash_mem'
                   start = mem->ranges[i].start;
                           ~~~^
   kernel/crash_core.c:417:36: note: forward declaration of 'struct crash_mem'
   int crash_exclude_mem_range(struct crash_mem *mem,
                                      ^
   kernel/crash_core.c:426:12: error: incomplete definition of type 'struct crash_mem'
                   end = mem->ranges[i].end;
                         ~~~^
   kernel/crash_core.c:417:36: note: forward declaration of 'struct crash_mem'
   int crash_exclude_mem_range(struct crash_mem *mem,
                                      ^
   kernel/crash_core.c:441:7: error: incomplete definition of type 'struct crash_mem'
                           mem->ranges[i].start = 0;
                           ~~~^
   kernel/crash_core.c:417:36: note: forward declaration of 'struct crash_mem'
   int crash_exclude_mem_range(struct crash_mem *mem,
                                      ^
   kernel/crash_core.c:442:7: error: incomplete definition of type 'struct crash_mem'
                           mem->ranges[i].end = 0;
                           ~~~^
   kernel/crash_core.c:417:36: note: forward declaration of 'struct crash_mem'
   int crash_exclude_mem_range(struct crash_mem *mem,
                                      ^
   kernel/crash_core.c:443:15: error: incomplete definition of type 'struct crash_mem'
                           if (i < mem->nr_ranges - 1) {
                                   ~~~^
   kernel/crash_core.c:417:36: note: forward declaration of 'struct crash_mem'
   int crash_exclude_mem_range(struct crash_mem *mem,
                                      ^
   kernel/crash_core.c:445:24: error: incomplete definition of type 'struct crash_mem'
                                   for (j = i; j < mem->nr_ranges - 1; j++) {
                                                   ~~~^
   kernel/crash_core.c:417:36: note: forward declaration of 'struct crash_mem'
   int crash_exclude_mem_range(struct crash_mem *mem,
                                      ^
   kernel/crash_core.c:446:9: error: incomplete definition of type 'struct crash_mem'
                                           mem->ranges[j].start =
                                           ~~~^
   kernel/crash_core.c:417:36: note: forward declaration of 'struct crash_mem'
   int crash_exclude_mem_range(struct crash_mem *mem,
                                      ^
   kernel/crash_core.c:447:10: error: incomplete definition of type 'struct crash_mem'
                                                   mem->ranges[j+1].start;
                                                   ~~~^
   kernel/crash_core.c:417:36: note: forward declaration of 'struct crash_mem'
   int crash_exclude_mem_range(struct crash_mem *mem,
                                      ^
   kernel/crash_core.c:448:9: error: incomplete definition of type 'struct crash_mem'
                                           mem->ranges[j].end =
                                           ~~~^
   kernel/crash_core.c:417:36: note: forward declaration of 'struct crash_mem'
   int crash_exclude_mem_range(struct crash_mem *mem,
                                      ^
   kernel/crash_core.c:449:11: error: incomplete definition of type 'struct crash_mem'
                                                           mem->ranges[j+1].end;
                                                           ~~~^
   kernel/crash_core.c:417:36: note: forward declaration of 'struct crash_mem'
   int crash_exclude_mem_range(struct crash_mem *mem,
                                      ^
   kernel/crash_core.c:458:8: error: incomplete definition of type 'struct crash_mem'
                                   mem->nr_ranges--;
                                   ~~~^
   kernel/crash_core.c:417:36: note: forward declaration of 'struct crash_mem'
   int crash_exclude_mem_range(struct crash_mem *mem,
                                      ^


vim +331 kernel/crash_core.c

   317	
 > 318	int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
   319				  void **addr, unsigned long *sz)
   320	{
   321		Elf64_Ehdr *ehdr;
   322		Elf64_Phdr *phdr;
   323		unsigned long nr_cpus = num_possible_cpus(), nr_phdr, elf_sz;
   324		unsigned char *buf;
   325		unsigned int cpu, i;
   326		unsigned long long notes_addr;
   327		unsigned long mstart, mend;
   328	
   329		/* extra phdr for vmcoreinfo ELF note */
   330		nr_phdr = nr_cpus + 1;
 > 331		nr_phdr += mem->nr_ranges;
   332	
   333		/*
   334		 * kexec-tools creates an extra PT_LOAD phdr for kernel text mapping
   335		 * area (for example, ffffffff80000000 - ffffffffa0000000 on x86_64).
   336		 * I think this is required by tools like gdb. So same physical
   337		 * memory will be mapped in two ELF headers. One will contain kernel
   338		 * text virtual addresses and other will have __va(physical) addresses.
   339		 */
   340	
   341		nr_phdr++;
   342		elf_sz = sizeof(Elf64_Ehdr) + nr_phdr * sizeof(Elf64_Phdr);
 > 343		elf_sz = ALIGN(elf_sz, ELF_CORE_HEADER_ALIGN);
   344	
   345		buf = vzalloc(elf_sz);
   346		if (!buf)
   347			return -ENOMEM;
   348	
   349		ehdr = (Elf64_Ehdr *)buf;
   350		phdr = (Elf64_Phdr *)(ehdr + 1);
   351		memcpy(ehdr->e_ident, ELFMAG, SELFMAG);
   352		ehdr->e_ident[EI_CLASS] = ELFCLASS64;
   353		ehdr->e_ident[EI_DATA] = ELFDATA2LSB;
   354		ehdr->e_ident[EI_VERSION] = EV_CURRENT;
   355		ehdr->e_ident[EI_OSABI] = ELF_OSABI;
   356		memset(ehdr->e_ident + EI_PAD, 0, EI_NIDENT - EI_PAD);
   357		ehdr->e_type = ET_CORE;
   358		ehdr->e_machine = ELF_ARCH;
   359		ehdr->e_version = EV_CURRENT;
   360		ehdr->e_phoff = sizeof(Elf64_Ehdr);
   361		ehdr->e_ehsize = sizeof(Elf64_Ehdr);
   362		ehdr->e_phentsize = sizeof(Elf64_Phdr);
   363	
   364		/* Prepare one phdr of type PT_NOTE for each present CPU */
   365		for_each_present_cpu(cpu) {
   366			phdr->p_type = PT_NOTE;
   367			notes_addr = per_cpu_ptr_to_phys(per_cpu_ptr(crash_notes, cpu));
   368			phdr->p_offset = phdr->p_paddr = notes_addr;
   369			phdr->p_filesz = phdr->p_memsz = sizeof(note_buf_t);
   370			(ehdr->e_phnum)++;
   371			phdr++;
   372		}
   373	
   374		/* Prepare one PT_NOTE header for vmcoreinfo */
   375		phdr->p_type = PT_NOTE;
   376		phdr->p_offset = phdr->p_paddr = paddr_vmcoreinfo_note();
   377		phdr->p_filesz = phdr->p_memsz = VMCOREINFO_NOTE_SIZE;
   378		(ehdr->e_phnum)++;
   379		phdr++;
   380	
   381		/* Prepare PT_LOAD type program header for kernel text region */
   382		if (need_kernel_map) {
   383			phdr->p_type = PT_LOAD;
   384			phdr->p_flags = PF_R|PF_W|PF_X;
   385			phdr->p_vaddr = (unsigned long) _text;
   386			phdr->p_filesz = phdr->p_memsz = _end - _text;
   387			phdr->p_offset = phdr->p_paddr = __pa_symbol(_text);
   388			ehdr->e_phnum++;
   389			phdr++;
   390		}
   391	
   392		/* Go through all the ranges in mem->ranges[] and prepare phdr */
   393		for (i = 0; i < mem->nr_ranges; i++) {
   394			mstart = mem->ranges[i].start;
   395			mend = mem->ranges[i].end;
   396	
   397			phdr->p_type = PT_LOAD;
   398			phdr->p_flags = PF_R|PF_W|PF_X;
   399			phdr->p_offset  = mstart;
   400	
   401			phdr->p_paddr = mstart;
   402			phdr->p_vaddr = (unsigned long) __va(mstart);
   403			phdr->p_filesz = phdr->p_memsz = mend - mstart + 1;
   404			phdr->p_align = 0;
   405			ehdr->e_phnum++;
   406			pr_debug("Crash PT_LOAD ELF header. phdr=%p vaddr=0x%llx, paddr=0x%llx, sz=0x%llx e_phnum=%d p_offset=0x%llx\n",
   407				phdr, phdr->p_vaddr, phdr->p_paddr, phdr->p_filesz,
   408				ehdr->e_phnum, phdr->p_offset);
   409			phdr++;
   410		}
   411	
   412		*addr = buf;
   413		*sz = elf_sz;
   414		return 0;
   415	}
   416	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
