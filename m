Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01ECEA1;
	Sat, 12 Aug 2023 02:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691808966; x=1723344966;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oxELtRa1J0Upe5KKOK6D1OkQTJDk/9xASmzr9JE4k8A=;
  b=jbzUgJDr9SjLCRQKXh47/aTIWFWpWeDptNdqvJgfvrG/zXpCdGnpDul4
   xme9RJFY9pLVi/j32HDMFklgIK3YEVZ425ZqqWstLVjgIsxc9RI7w7MrA
   kNIk9Nz6bAMEkazWG7oGFanD3EMe1TylXh2oukD1YpX9f3Cpi7xP7FTUq
   UfzG/9xi719ITooq7YPPmwzE677IVG/g1WcT46eqaXICAIxxFNAiPUWja
   zZIYuQLcrRCIQ0hha4q6+sdIrV5uQz1kuLugKsMTmBF9+gAlwdj+GpG/D
   crQczfKffSkTOYaVbMvwlxbivs7cOIiVfjM02E6rTmisq23TGISBG30I/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="351404218"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="351404218"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 19:56:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="709730423"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="709730423"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 11 Aug 2023 19:56:01 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUenI-0008DG-0b;
	Sat, 12 Aug 2023 02:56:00 +0000
Date: Sat, 12 Aug 2023 10:55:31 +0800
From: kernel test robot <lkp@intel.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Sourabh Jain <sourabhjain@linux.ibm.com>
Subject: [linux-next:master 8153/8441] kernel/crash_core.c:331:16: error:
 incomplete definition of type 'struct crash_mem'
Message-ID: <202308121036.d9lsmxkr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   21ef7b1e17d039053edaeaf41142423810572741
commit: c0551f291cda24c6c4cb7e77e8bd6746ba252dcf [8153/8441] crash: move a few code bits to setup support of crash hotplug
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20230812/202308121036.d9lsmxkr-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308121036.d9lsmxkr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308121036.d9lsmxkr-lkp@intel.com/

Note: the linux-next/master HEAD 21ef7b1e17d039053edaeaf41142423810572741 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from kernel/crash_core.c:13:
   In file included from include/linux/kexec.h:19:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from kernel/crash_core.c:13:
   In file included from include/linux/kexec.h:19:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from kernel/crash_core.c:13:
   In file included from include/linux/kexec.h:19:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   kernel/crash_core.c:318:40: warning: declaration of 'struct crash_mem' will not be visible outside of this function [-Wvisibility]
     318 | int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
         |                                        ^
>> kernel/crash_core.c:331:16: error: incomplete definition of type 'struct crash_mem'
     331 |         nr_phdr += mem->nr_ranges;
         |                    ~~~^
   kernel/crash_core.c:318:40: note: forward declaration of 'struct crash_mem'
     318 | int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
         |                                        ^
>> kernel/crash_core.c:343:25: error: use of undeclared identifier 'ELF_CORE_HEADER_ALIGN'
     343 |         elf_sz = ALIGN(elf_sz, ELF_CORE_HEADER_ALIGN);
         |                                ^
>> kernel/crash_core.c:343:25: error: use of undeclared identifier 'ELF_CORE_HEADER_ALIGN'
   kernel/crash_core.c:393:21: error: incomplete definition of type 'struct crash_mem'
     393 |         for (i = 0; i < mem->nr_ranges; i++) {
         |                         ~~~^
   kernel/crash_core.c:318:40: note: forward declaration of 'struct crash_mem'
     318 | int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
         |                                        ^
   kernel/crash_core.c:394:15: error: incomplete definition of type 'struct crash_mem'
     394 |                 mstart = mem->ranges[i].start;
         |                          ~~~^
   kernel/crash_core.c:318:40: note: forward declaration of 'struct crash_mem'
     318 | int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
         |                                        ^
   kernel/crash_core.c:395:13: error: incomplete definition of type 'struct crash_mem'
     395 |                 mend = mem->ranges[i].end;
         |                        ~~~^
   kernel/crash_core.c:318:40: note: forward declaration of 'struct crash_mem'
     318 | int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
         |                                        ^
   kernel/crash_core.c:318:5: warning: no previous prototype for function 'crash_prepare_elf64_headers' [-Wmissing-prototypes]
     318 | int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
         |     ^
   kernel/crash_core.c:318:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     318 | int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
         | ^
         | static 
   kernel/crash_core.c:417:36: warning: declaration of 'struct crash_mem' will not be visible outside of this function [-Wvisibility]
     417 | int crash_exclude_mem_range(struct crash_mem *mem,
         |                                    ^
   kernel/crash_core.c:424:21: error: incomplete definition of type 'struct crash_mem'
     424 |         for (i = 0; i < mem->nr_ranges; i++) {
         |                         ~~~^
   kernel/crash_core.c:417:36: note: forward declaration of 'struct crash_mem'
     417 | int crash_exclude_mem_range(struct crash_mem *mem,
         |                                    ^
   kernel/crash_core.c:425:14: error: incomplete definition of type 'struct crash_mem'
     425 |                 start = mem->ranges[i].start;
         |                         ~~~^
   kernel/crash_core.c:417:36: note: forward declaration of 'struct crash_mem'
     417 | int crash_exclude_mem_range(struct crash_mem *mem,
         |                                    ^
   kernel/crash_core.c:426:12: error: incomplete definition of type 'struct crash_mem'
     426 |                 end = mem->ranges[i].end;
         |                       ~~~^
   kernel/crash_core.c:417:36: note: forward declaration of 'struct crash_mem'
     417 | int crash_exclude_mem_range(struct crash_mem *mem,
         |                                    ^
   kernel/crash_core.c:441:7: error: incomplete definition of type 'struct crash_mem'
     441 |                         mem->ranges[i].start = 0;
         |                         ~~~^
   kernel/crash_core.c:417:36: note: forward declaration of 'struct crash_mem'
     417 | int crash_exclude_mem_range(struct crash_mem *mem,
         |                                    ^
   kernel/crash_core.c:442:7: error: incomplete definition of type 'struct crash_mem'
     442 |                         mem->ranges[i].end = 0;
         |                         ~~~^
   kernel/crash_core.c:417:36: note: forward declaration of 'struct crash_mem'
     417 | int crash_exclude_mem_range(struct crash_mem *mem,
         |                                    ^
   kernel/crash_core.c:443:15: error: incomplete definition of type 'struct crash_mem'
     443 |                         if (i < mem->nr_ranges - 1) {
         |                                 ~~~^
   kernel/crash_core.c:417:36: note: forward declaration of 'struct crash_mem'
     417 | int crash_exclude_mem_range(struct crash_mem *mem,
         |                                    ^
   kernel/crash_core.c:445:24: error: incomplete definition of type 'struct crash_mem'
     445 |                                 for (j = i; j < mem->nr_ranges - 1; j++) {
         |                                                 ~~~^
   kernel/crash_core.c:417:36: note: forward declaration of 'struct crash_mem'
     417 | int crash_exclude_mem_range(struct crash_mem *mem,
         |                                    ^
   kernel/crash_core.c:446:9: error: incomplete definition of type 'struct crash_mem'
     446 |                                         mem->ranges[j].start =
         |                                         ~~~^
   kernel/crash_core.c:417:36: note: forward declaration of 'struct crash_mem'
     417 | int crash_exclude_mem_range(struct crash_mem *mem,
         |                                    ^
   kernel/crash_core.c:447:10: error: incomplete definition of type 'struct crash_mem'
     447 |                                                 mem->ranges[j+1].start;
         |                                                 ~~~^
   kernel/crash_core.c:417:36: note: forward declaration of 'struct crash_mem'
     417 | int crash_exclude_mem_range(struct crash_mem *mem,
         |                                    ^
   kernel/crash_core.c:448:9: error: incomplete definition of type 'struct crash_mem'
     448 |                                         mem->ranges[j].end =
         |                                         ~~~^
   kernel/crash_core.c:417:36: note: forward declaration of 'struct crash_mem'
     417 | int crash_exclude_mem_range(struct crash_mem *mem,
         |                                    ^
   kernel/crash_core.c:449:11: error: incomplete definition of type 'struct crash_mem'
     449 |                                                         mem->ranges[j+1].end;
         |                                                         ~~~^
   kernel/crash_core.c:417:36: note: forward declaration of 'struct crash_mem'
     417 | int crash_exclude_mem_range(struct crash_mem *mem,
         |                                    ^
   kernel/crash_core.c:458:8: error: incomplete definition of type 'struct crash_mem'
     458 |                                 mem->nr_ranges--;
         |                                 ~~~^
   kernel/crash_core.c:417:36: note: forward declaration of 'struct crash_mem'
     417 | int crash_exclude_mem_range(struct crash_mem *mem,
         |                                    ^


vim +331 kernel/crash_core.c

   317	
   318	int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
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
