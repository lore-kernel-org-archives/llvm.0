Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8CD22331;
	Tue, 31 Oct 2023 22:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YPoobI8S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698792927; x=1730328927;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=TmdjbYlnRVICSBfQ/ttFUp7Ovhvv6yneqQ2yJLIXA5g=;
  b=YPoobI8So/eBZcM1PaDePa9dtApmibXqyOgotazywWn2GAebLRI335l2
   e/ZUOYC/T3r8Uw+ZJ1a/BHdamgJ17UQyUsYWi1xypdvWlP6a04tT1hEPU
   +L71XgMj5+tnvDLt7BmKoGXiB5xwmBKXd54+obG5Ubxlt5V4wtoAuIAAL
   SO3WGtNN1tYtRE2XTQ7OjTEICXqSxvSj7Ld7weyMuwOEqpInz0EgNDROw
   aJ6uzXszd9UDJlxk61xJWwkjQxLF6htYrfM8jh5mjqATa6QixcolKVJp+
   hR+4FH3qI0A5sriPXlceX8PjE2inrymUU6KqLFZr4DjkeohOo1TknN2h6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="367735328"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; 
   d="scan'208";a="367735328"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 15:55:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; 
   d="scan'208";a="1904232"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 31 Oct 2023 15:55:24 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxxdp-0000RQ-2e;
	Tue, 31 Oct 2023 22:55:21 +0000
Date: Wed, 1 Nov 2023 06:55:18 +0800
From: kernel test robot <lkp@intel.com>
To: Michael =?iso-8859-1?Q?Wei=DF?= <michael.weiss@aisec.fraunhofer.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RESEND RFC PATCH v2 09/14] lsm: Add
 security_inode_mknod_nscap() hook
Message-ID: <202311010659.sGIzqqG6-lkp@intel.com>
References: <20231025094224.72858-10-michael.weiss@aisec.fraunhofer.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231025094224.72858-10-michael.weiss@aisec.fraunhofer.de>

Hi Michael,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 58720809f52779dc0f08e53e54b014209d13eebb]

url:    https://github.com/intel-lab-lkp/linux/commits/Michael-Wei/device_cgroup-Implement-devcgroup-hooks-as-lsm-security-hooks/20231025-174946
base:   58720809f52779dc0f08e53e54b014209d13eebb
patch link:    https://lore.kernel.org/r/20231025094224.72858-10-michael.weiss%40aisec.fraunhofer.de
patch subject: [RESEND RFC PATCH v2 09/14] lsm: Add security_inode_mknod_nscap() hook
config: powerpc-lite5200b_defconfig (https://download.01.org/0day-ci/archive/20231101/202311010659.sGIzqqG6-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231101/202311010659.sGIzqqG6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311010659.sGIzqqG6-lkp@intel.com/

All warnings (new ones prefixed by >>):

                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from fs/binfmt_elf.c:30:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:672:
   arch/powerpc/include/asm/io-defs.h:45:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insw, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:669:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:47:1: note: expanded from here
   __do_insw
   ^
   arch/powerpc/include/asm/io.h:610:56: note: expanded from macro '__do_insw'
   #define __do_insw(p, b, n)      readsw((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from fs/binfmt_elf.c:30:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:672:
   arch/powerpc/include/asm/io-defs.h:47:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:669:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:49:1: note: expanded from here
   __do_insl
   ^
   arch/powerpc/include/asm/io.h:611:56: note: expanded from macro '__do_insl'
   #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from fs/binfmt_elf.c:30:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:672:
   arch/powerpc/include/asm/io-defs.h:49:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:669:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:51:1: note: expanded from here
   __do_outsb
   ^
   arch/powerpc/include/asm/io.h:612:58: note: expanded from macro '__do_outsb'
   #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from fs/binfmt_elf.c:30:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:672:
   arch/powerpc/include/asm/io-defs.h:51:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:669:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:53:1: note: expanded from here
   __do_outsw
   ^
   arch/powerpc/include/asm/io.h:613:58: note: expanded from macro '__do_outsw'
   #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from fs/binfmt_elf.c:30:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:672:
   arch/powerpc/include/asm/io-defs.h:53:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:669:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:55:1: note: expanded from here
   __do_outsl
   ^
   arch/powerpc/include/asm/io.h:614:58: note: expanded from macro '__do_outsl'
   #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from fs/binfmt_elf.c:34:
   include/linux/security.h:1408:1: error: expected identifier or '('
   {
   ^
>> fs/binfmt_elf.c:1120:17: warning: implicit conversion from 'unsigned long long' to 'unsigned long' changes value from 4294967296 to 0 [-Wconstant-conversion]
                                   load_bias = ELF_ET_DYN_BASE;
                                             ~ ^~~~~~~~~~~~~~~
   arch/powerpc/include/asm/elf.h:28:10: note: expanded from macro 'ELF_ET_DYN_BASE'
                                                      0x100000000UL)
                                                      ^~~~~~~~~~~~~
   fs/binfmt_elf.c:1313:30: warning: implicit conversion from 'unsigned long long' to 'unsigned long' changes value from 4294967296 to 0 [-Wconstant-conversion]
                           mm->brk = mm->start_brk = ELF_ET_DYN_BASE;
                                                   ~ ^~~~~~~~~~~~~~~
   arch/powerpc/include/asm/elf.h:28:10: note: expanded from macro 'ELF_ET_DYN_BASE'
                                                      0x100000000UL)
                                                      ^~~~~~~~~~~~~
   8 warnings and 1 error generated.


vim +1120 fs/binfmt_elf.c

00e19ceec80b03 Dave Martin        2020-03-16   822  
71613c3b871c5a Al Viro            2012-10-20   823  static int load_elf_binary(struct linux_binprm *bprm)
^1da177e4c3f41 Linus Torvalds     2005-04-16   824  {
^1da177e4c3f41 Linus Torvalds     2005-04-16   825  	struct file *interpreter = NULL; /* to shut gcc up */
2b4bfbe0967697 Akira Kawata       2022-01-27   826  	unsigned long load_bias = 0, phdr_addr = 0;
2b4bfbe0967697 Akira Kawata       2022-01-27   827  	int first_pt_load = 1;
^1da177e4c3f41 Linus Torvalds     2005-04-16   828  	unsigned long error;
a9d9ef133f443a Paul Burton        2014-09-11   829  	struct elf_phdr *elf_ppnt, *elf_phdata, *interp_elf_phdata = NULL;
00e19ceec80b03 Dave Martin        2020-03-16   830  	struct elf_phdr *elf_property_phdata = NULL;
^1da177e4c3f41 Linus Torvalds     2005-04-16   831  	unsigned long elf_bss, elf_brk;
16e72e9b30986e Denys Vlasenko     2017-02-22   832  	int bss_prot = 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16   833  	int retval, i;
cc503c1b43e002 Jiri Kosina        2008-01-30   834  	unsigned long elf_entry;
a62c5b1b6647ea Alexey Dobriyan    2020-01-30   835  	unsigned long e_entry;
cc503c1b43e002 Jiri Kosina        2008-01-30   836  	unsigned long interp_load_addr = 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16   837  	unsigned long start_code, end_code, start_data, end_data;
1a530a6f23f7dc David Daney        2011-03-22   838  	unsigned long reloc_func_desc __maybe_unused = 0;
8de61e69c2feb1 David Rientjes     2006-12-06   839  	int executable_stack = EXSTACK_DEFAULT;
a62c5b1b6647ea Alexey Dobriyan    2020-01-30   840  	struct elfhdr *elf_ex = (struct elfhdr *)bprm->buf;
0693ffebcfe5ac Alexey Dobriyan    2020-04-06   841  	struct elfhdr *interp_elf_ex = NULL;
774c105ed8d791 Paul Burton        2014-09-11   842  	struct arch_elf_state arch_state = INIT_ARCH_ELF_STATE;
03c6d723eeac2d Alexey Dobriyan    2020-01-30   843  	struct mm_struct *mm;
249b08e4e504d4 Alexey Dobriyan    2019-05-14   844  	struct pt_regs *regs;
^1da177e4c3f41 Linus Torvalds     2005-04-16   845  
^1da177e4c3f41 Linus Torvalds     2005-04-16   846  	retval = -ENOEXEC;
^1da177e4c3f41 Linus Torvalds     2005-04-16   847  	/* First of all, some simple consistency checks */
a62c5b1b6647ea Alexey Dobriyan    2020-01-30   848  	if (memcmp(elf_ex->e_ident, ELFMAG, SELFMAG) != 0)
^1da177e4c3f41 Linus Torvalds     2005-04-16   849  		goto out;
^1da177e4c3f41 Linus Torvalds     2005-04-16   850  
a62c5b1b6647ea Alexey Dobriyan    2020-01-30   851  	if (elf_ex->e_type != ET_EXEC && elf_ex->e_type != ET_DYN)
^1da177e4c3f41 Linus Torvalds     2005-04-16   852  		goto out;
a62c5b1b6647ea Alexey Dobriyan    2020-01-30   853  	if (!elf_check_arch(elf_ex))
^1da177e4c3f41 Linus Torvalds     2005-04-16   854  		goto out;
a62c5b1b6647ea Alexey Dobriyan    2020-01-30   855  	if (elf_check_fdpic(elf_ex))
4755200b6b116d Nicolas Pitre      2017-08-16   856  		goto out;
72c2d531920048 Al Viro            2013-09-22   857  	if (!bprm->file->f_op->mmap)
^1da177e4c3f41 Linus Torvalds     2005-04-16   858  		goto out;
^1da177e4c3f41 Linus Torvalds     2005-04-16   859  
a62c5b1b6647ea Alexey Dobriyan    2020-01-30   860  	elf_phdata = load_elf_phdrs(elf_ex, bprm->file);
^1da177e4c3f41 Linus Torvalds     2005-04-16   861  	if (!elf_phdata)
^1da177e4c3f41 Linus Torvalds     2005-04-16   862  		goto out;
^1da177e4c3f41 Linus Torvalds     2005-04-16   863  
^1da177e4c3f41 Linus Torvalds     2005-04-16   864  	elf_ppnt = elf_phdata;
a62c5b1b6647ea Alexey Dobriyan    2020-01-30   865  	for (i = 0; i < elf_ex->e_phnum; i++, elf_ppnt++) {
cc338010a233c0 Alexey Dobriyan    2019-05-14   866  		char *elf_interpreter;
5cf4a36382588e Alexey Dobriyan    2019-05-14   867  
00e19ceec80b03 Dave Martin        2020-03-16   868  		if (elf_ppnt->p_type == PT_GNU_PROPERTY) {
00e19ceec80b03 Dave Martin        2020-03-16   869  			elf_property_phdata = elf_ppnt;
00e19ceec80b03 Dave Martin        2020-03-16   870  			continue;
00e19ceec80b03 Dave Martin        2020-03-16   871  		}
00e19ceec80b03 Dave Martin        2020-03-16   872  
be0deb585e4c51 Alexey Dobriyan    2019-05-14   873  		if (elf_ppnt->p_type != PT_INTERP)
be0deb585e4c51 Alexey Dobriyan    2019-05-14   874  			continue;
be0deb585e4c51 Alexey Dobriyan    2019-05-14   875  
be0deb585e4c51 Alexey Dobriyan    2019-05-14   876  		/*
be0deb585e4c51 Alexey Dobriyan    2019-05-14   877  		 * This is the program interpreter used for shared libraries -
be0deb585e4c51 Alexey Dobriyan    2019-05-14   878  		 * for now assume that this is an a.out format binary.
^1da177e4c3f41 Linus Torvalds     2005-04-16   879  		 */
^1da177e4c3f41 Linus Torvalds     2005-04-16   880  		retval = -ENOEXEC;
be0deb585e4c51 Alexey Dobriyan    2019-05-14   881  		if (elf_ppnt->p_filesz > PATH_MAX || elf_ppnt->p_filesz < 2)
e7b9b550f53e81 Al Viro            2009-03-29   882  			goto out_free_ph;
^1da177e4c3f41 Linus Torvalds     2005-04-16   883  
^1da177e4c3f41 Linus Torvalds     2005-04-16   884  		retval = -ENOMEM;
be0deb585e4c51 Alexey Dobriyan    2019-05-14   885  		elf_interpreter = kmalloc(elf_ppnt->p_filesz, GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds     2005-04-16   886  		if (!elf_interpreter)
e7b9b550f53e81 Al Viro            2009-03-29   887  			goto out_free_ph;
^1da177e4c3f41 Linus Torvalds     2005-04-16   888  
658c0335651185 Alexey Dobriyan    2019-12-04   889  		retval = elf_read(bprm->file, elf_interpreter, elf_ppnt->p_filesz,
658c0335651185 Alexey Dobriyan    2019-12-04   890  				  elf_ppnt->p_offset);
658c0335651185 Alexey Dobriyan    2019-12-04   891  		if (retval < 0)
^1da177e4c3f41 Linus Torvalds     2005-04-16   892  			goto out_free_interp;
^1da177e4c3f41 Linus Torvalds     2005-04-16   893  		/* make sure path is NULL terminated */
^1da177e4c3f41 Linus Torvalds     2005-04-16   894  		retval = -ENOEXEC;
^1da177e4c3f41 Linus Torvalds     2005-04-16   895  		if (elf_interpreter[elf_ppnt->p_filesz - 1] != '\0')
^1da177e4c3f41 Linus Torvalds     2005-04-16   896  			goto out_free_interp;
^1da177e4c3f41 Linus Torvalds     2005-04-16   897  
^1da177e4c3f41 Linus Torvalds     2005-04-16   898  		interpreter = open_exec(elf_interpreter);
cc338010a233c0 Alexey Dobriyan    2019-05-14   899  		kfree(elf_interpreter);
^1da177e4c3f41 Linus Torvalds     2005-04-16   900  		retval = PTR_ERR(interpreter);
^1da177e4c3f41 Linus Torvalds     2005-04-16   901  		if (IS_ERR(interpreter))
cc338010a233c0 Alexey Dobriyan    2019-05-14   902  			goto out_free_ph;
1fb844961818ce Alexey Dobriyan    2007-01-26   903  
1fb844961818ce Alexey Dobriyan    2007-01-26   904  		/*
be0deb585e4c51 Alexey Dobriyan    2019-05-14   905  		 * If the binary is not readable then enforce mm->dumpable = 0
be0deb585e4c51 Alexey Dobriyan    2019-05-14   906  		 * regardless of the interpreter's permissions.
1fb844961818ce Alexey Dobriyan    2007-01-26   907  		 */
1b5d783c94c328 Al Viro            2011-06-19   908  		would_dump(bprm, interpreter);
1fb844961818ce Alexey Dobriyan    2007-01-26   909  
0693ffebcfe5ac Alexey Dobriyan    2020-04-06   910  		interp_elf_ex = kmalloc(sizeof(*interp_elf_ex), GFP_KERNEL);
0693ffebcfe5ac Alexey Dobriyan    2020-04-06   911  		if (!interp_elf_ex) {
0693ffebcfe5ac Alexey Dobriyan    2020-04-06   912  			retval = -ENOMEM;
594d2a14f2168c Li Zetao           2022-10-24   913  			goto out_free_file;
0693ffebcfe5ac Alexey Dobriyan    2020-04-06   914  		}
0693ffebcfe5ac Alexey Dobriyan    2020-04-06   915  
b582ef5c53040c Maciej W. Rozycki  2015-10-26   916  		/* Get the exec headers */
c69bcc932ef356 Alexey Dobriyan    2020-04-06   917  		retval = elf_read(interpreter, interp_elf_ex,
c69bcc932ef356 Alexey Dobriyan    2020-04-06   918  				  sizeof(*interp_elf_ex), 0);
658c0335651185 Alexey Dobriyan    2019-12-04   919  		if (retval < 0)
^1da177e4c3f41 Linus Torvalds     2005-04-16   920  			goto out_free_dentry;
^1da177e4c3f41 Linus Torvalds     2005-04-16   921  
^1da177e4c3f41 Linus Torvalds     2005-04-16   922  		break;
cc338010a233c0 Alexey Dobriyan    2019-05-14   923  
cc338010a233c0 Alexey Dobriyan    2019-05-14   924  out_free_interp:
cc338010a233c0 Alexey Dobriyan    2019-05-14   925  		kfree(elf_interpreter);
cc338010a233c0 Alexey Dobriyan    2019-05-14   926  		goto out_free_ph;
^1da177e4c3f41 Linus Torvalds     2005-04-16   927  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16   928  
^1da177e4c3f41 Linus Torvalds     2005-04-16   929  	elf_ppnt = elf_phdata;
a62c5b1b6647ea Alexey Dobriyan    2020-01-30   930  	for (i = 0; i < elf_ex->e_phnum; i++, elf_ppnt++)
774c105ed8d791 Paul Burton        2014-09-11   931  		switch (elf_ppnt->p_type) {
774c105ed8d791 Paul Burton        2014-09-11   932  		case PT_GNU_STACK:
^1da177e4c3f41 Linus Torvalds     2005-04-16   933  			if (elf_ppnt->p_flags & PF_X)
^1da177e4c3f41 Linus Torvalds     2005-04-16   934  				executable_stack = EXSTACK_ENABLE_X;
^1da177e4c3f41 Linus Torvalds     2005-04-16   935  			else
^1da177e4c3f41 Linus Torvalds     2005-04-16   936  				executable_stack = EXSTACK_DISABLE_X;
^1da177e4c3f41 Linus Torvalds     2005-04-16   937  			break;
774c105ed8d791 Paul Burton        2014-09-11   938  
774c105ed8d791 Paul Burton        2014-09-11   939  		case PT_LOPROC ... PT_HIPROC:
a62c5b1b6647ea Alexey Dobriyan    2020-01-30   940  			retval = arch_elf_pt_proc(elf_ex, elf_ppnt,
774c105ed8d791 Paul Burton        2014-09-11   941  						  bprm->file, false,
774c105ed8d791 Paul Burton        2014-09-11   942  						  &arch_state);
774c105ed8d791 Paul Burton        2014-09-11   943  			if (retval)
774c105ed8d791 Paul Burton        2014-09-11   944  				goto out_free_dentry;
774c105ed8d791 Paul Burton        2014-09-11   945  			break;
^1da177e4c3f41 Linus Torvalds     2005-04-16   946  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16   947  
^1da177e4c3f41 Linus Torvalds     2005-04-16   948  	/* Some simple consistency checks for the interpreter */
cc338010a233c0 Alexey Dobriyan    2019-05-14   949  	if (interpreter) {
^1da177e4c3f41 Linus Torvalds     2005-04-16   950  		retval = -ELIBBAD;
d20894a23708c2 Andi Kleen         2008-02-08   951  		/* Not an ELF interpreter */
c69bcc932ef356 Alexey Dobriyan    2020-04-06   952  		if (memcmp(interp_elf_ex->e_ident, ELFMAG, SELFMAG) != 0)
^1da177e4c3f41 Linus Torvalds     2005-04-16   953  			goto out_free_dentry;
^1da177e4c3f41 Linus Torvalds     2005-04-16   954  		/* Verify the interpreter has a valid arch */
c69bcc932ef356 Alexey Dobriyan    2020-04-06   955  		if (!elf_check_arch(interp_elf_ex) ||
c69bcc932ef356 Alexey Dobriyan    2020-04-06   956  		    elf_check_fdpic(interp_elf_ex))
^1da177e4c3f41 Linus Torvalds     2005-04-16   957  			goto out_free_dentry;
a9d9ef133f443a Paul Burton        2014-09-11   958  
a9d9ef133f443a Paul Burton        2014-09-11   959  		/* Load the interpreter program headers */
c69bcc932ef356 Alexey Dobriyan    2020-04-06   960  		interp_elf_phdata = load_elf_phdrs(interp_elf_ex,
a9d9ef133f443a Paul Burton        2014-09-11   961  						   interpreter);
a9d9ef133f443a Paul Burton        2014-09-11   962  		if (!interp_elf_phdata)
a9d9ef133f443a Paul Burton        2014-09-11   963  			goto out_free_dentry;
774c105ed8d791 Paul Burton        2014-09-11   964  
774c105ed8d791 Paul Burton        2014-09-11   965  		/* Pass PT_LOPROC..PT_HIPROC headers to arch code */
00e19ceec80b03 Dave Martin        2020-03-16   966  		elf_property_phdata = NULL;
774c105ed8d791 Paul Burton        2014-09-11   967  		elf_ppnt = interp_elf_phdata;
c69bcc932ef356 Alexey Dobriyan    2020-04-06   968  		for (i = 0; i < interp_elf_ex->e_phnum; i++, elf_ppnt++)
774c105ed8d791 Paul Burton        2014-09-11   969  			switch (elf_ppnt->p_type) {
00e19ceec80b03 Dave Martin        2020-03-16   970  			case PT_GNU_PROPERTY:
00e19ceec80b03 Dave Martin        2020-03-16   971  				elf_property_phdata = elf_ppnt;
00e19ceec80b03 Dave Martin        2020-03-16   972  				break;
00e19ceec80b03 Dave Martin        2020-03-16   973  
774c105ed8d791 Paul Burton        2014-09-11   974  			case PT_LOPROC ... PT_HIPROC:
c69bcc932ef356 Alexey Dobriyan    2020-04-06   975  				retval = arch_elf_pt_proc(interp_elf_ex,
774c105ed8d791 Paul Burton        2014-09-11   976  							  elf_ppnt, interpreter,
774c105ed8d791 Paul Burton        2014-09-11   977  							  true, &arch_state);
774c105ed8d791 Paul Burton        2014-09-11   978  				if (retval)
774c105ed8d791 Paul Burton        2014-09-11   979  					goto out_free_dentry;
774c105ed8d791 Paul Burton        2014-09-11   980  				break;
^1da177e4c3f41 Linus Torvalds     2005-04-16   981  			}
774c105ed8d791 Paul Burton        2014-09-11   982  	}
774c105ed8d791 Paul Burton        2014-09-11   983  
00e19ceec80b03 Dave Martin        2020-03-16   984  	retval = parse_elf_properties(interpreter ?: bprm->file,
00e19ceec80b03 Dave Martin        2020-03-16   985  				      elf_property_phdata, &arch_state);
00e19ceec80b03 Dave Martin        2020-03-16   986  	if (retval)
00e19ceec80b03 Dave Martin        2020-03-16   987  		goto out_free_dentry;
00e19ceec80b03 Dave Martin        2020-03-16   988  
774c105ed8d791 Paul Burton        2014-09-11   989  	/*
774c105ed8d791 Paul Burton        2014-09-11   990  	 * Allow arch code to reject the ELF at this point, whilst it's
774c105ed8d791 Paul Burton        2014-09-11   991  	 * still possible to return an error to the code that invoked
774c105ed8d791 Paul Burton        2014-09-11   992  	 * the exec syscall.
774c105ed8d791 Paul Burton        2014-09-11   993  	 */
a62c5b1b6647ea Alexey Dobriyan    2020-01-30   994  	retval = arch_check_elf(elf_ex,
c69bcc932ef356 Alexey Dobriyan    2020-04-06   995  				!!interpreter, interp_elf_ex,
eb4bc076ff94b8 Maciej W. Rozycki  2015-11-13   996  				&arch_state);
774c105ed8d791 Paul Burton        2014-09-11   997  	if (retval)
774c105ed8d791 Paul Burton        2014-09-11   998  		goto out_free_dentry;
^1da177e4c3f41 Linus Torvalds     2005-04-16   999  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1000  	/* Flush all traces of the currently running executable */
2388777a0a5957 Eric W. Biederman  2020-05-03  1001  	retval = begin_new_exec(bprm);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1002  	if (retval)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1003  		goto out_free_dentry;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1004  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1005  	/* Do this immediately, since STACK_TOP as used in setup_arg_pages
^1da177e4c3f41 Linus Torvalds     2005-04-16  1006  	   may depend on the personality.  */
a62c5b1b6647ea Alexey Dobriyan    2020-01-30  1007  	SET_PERSONALITY2(*elf_ex, &arch_state);
a62c5b1b6647ea Alexey Dobriyan    2020-01-30  1008  	if (elf_read_implies_exec(*elf_ex, executable_stack))
^1da177e4c3f41 Linus Torvalds     2005-04-16  1009  		current->personality |= READ_IMPLIES_EXEC;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1010  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1011  	if (!(current->personality & ADDR_NO_RANDOMIZE) && randomize_va_space)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1012  		current->flags |= PF_RANDOMIZE;
221af7f87b9743 Linus Torvalds     2010-01-28  1013  
221af7f87b9743 Linus Torvalds     2010-01-28  1014  	setup_new_exec(bprm);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1015  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1016  	/* Do this so that we can load the interpreter, if need be.  We will
^1da177e4c3f41 Linus Torvalds     2005-04-16  1017  	   change some of these later */
^1da177e4c3f41 Linus Torvalds     2005-04-16  1018  	retval = setup_arg_pages(bprm, randomize_stack_top(STACK_TOP),
^1da177e4c3f41 Linus Torvalds     2005-04-16  1019  				 executable_stack);
19d860a140beac Al Viro            2014-05-04  1020  	if (retval < 0)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1021  		goto out_free_dentry;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1022  
852643165aea09 Alexey Dobriyan    2019-05-14  1023  	elf_bss = 0;
852643165aea09 Alexey Dobriyan    2019-05-14  1024  	elf_brk = 0;
852643165aea09 Alexey Dobriyan    2019-05-14  1025  
852643165aea09 Alexey Dobriyan    2019-05-14  1026  	start_code = ~0UL;
852643165aea09 Alexey Dobriyan    2019-05-14  1027  	end_code = 0;
852643165aea09 Alexey Dobriyan    2019-05-14  1028  	start_data = 0;
852643165aea09 Alexey Dobriyan    2019-05-14  1029  	end_data = 0;
852643165aea09 Alexey Dobriyan    2019-05-14  1030  
af901ca181d92a André Goddard Rosa 2009-11-14  1031  	/* Now we do a little grungy work by mmapping the ELF image into
cc503c1b43e002 Jiri Kosina        2008-01-30  1032  	   the correct location in memory. */
f4e5cc2c44bf76 Jesper Juhl        2006-06-23  1033  	for(i = 0, elf_ppnt = elf_phdata;
a62c5b1b6647ea Alexey Dobriyan    2020-01-30  1034  	    i < elf_ex->e_phnum; i++, elf_ppnt++) {
b212921b13bda0 Linus Torvalds     2019-10-06  1035  		int elf_prot, elf_flags;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1036  		unsigned long k, vaddr;
a87938b2e246b8 Michael Davidson   2015-04-14  1037  		unsigned long total_size = 0;
ce81bb256a2242 Chris Kennelly     2020-10-15  1038  		unsigned long alignment;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1039  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1040  		if (elf_ppnt->p_type != PT_LOAD)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1041  			continue;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1042  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1043  		if (unlikely (elf_brk > elf_bss)) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  1044  			unsigned long nbyte;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1045  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1046  			/* There was a PT_LOAD segment with p_memsz > p_filesz
^1da177e4c3f41 Linus Torvalds     2005-04-16  1047  			   before this one. Map anonymous pages, if needed,
^1da177e4c3f41 Linus Torvalds     2005-04-16  1048  			   and clear the area.  */
^1da177e4c3f41 Linus Torvalds     2005-04-16  1049  			retval = set_brk(elf_bss + load_bias,
16e72e9b30986e Denys Vlasenko     2017-02-22  1050  					 elf_brk + load_bias,
16e72e9b30986e Denys Vlasenko     2017-02-22  1051  					 bss_prot);
19d860a140beac Al Viro            2014-05-04  1052  			if (retval)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1053  				goto out_free_dentry;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1054  			nbyte = ELF_PAGEOFFSET(elf_bss);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1055  			if (nbyte) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  1056  				nbyte = ELF_MIN_ALIGN - nbyte;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1057  				if (nbyte > elf_brk - elf_bss)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1058  					nbyte = elf_brk - elf_bss;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1059  				if (clear_user((void __user *)elf_bss +
^1da177e4c3f41 Linus Torvalds     2005-04-16  1060  							load_bias, nbyte)) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  1061  					/*
^1da177e4c3f41 Linus Torvalds     2005-04-16  1062  					 * This bss-zeroing can fail if the ELF
^1da177e4c3f41 Linus Torvalds     2005-04-16  1063  					 * file specifies odd protections. So
^1da177e4c3f41 Linus Torvalds     2005-04-16  1064  					 * we don't check the return value
^1da177e4c3f41 Linus Torvalds     2005-04-16  1065  					 */
^1da177e4c3f41 Linus Torvalds     2005-04-16  1066  				}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1067  			}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1068  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1069  
fe0f67660ee9c9 Dave Martin        2020-03-16  1070  		elf_prot = make_prot(elf_ppnt->p_flags, &arch_state,
fe0f67660ee9c9 Dave Martin        2020-03-16  1071  				     !!interpreter, false);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1072  
4589ff7ca81516 David Hildenbrand  2021-04-23  1073  		elf_flags = MAP_PRIVATE;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1074  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1075  		vaddr = elf_ppnt->p_vaddr;
eab09532d40090 Kees Cook          2017-07-10  1076  		/*
2b4bfbe0967697 Akira Kawata       2022-01-27  1077  		 * The first time through the loop, first_pt_load is true:
5f501d555653f8 Kees Cook          2021-11-08  1078  		 * layout will be calculated. Once set, use MAP_FIXED since
5f501d555653f8 Kees Cook          2021-11-08  1079  		 * we know we've already safely mapped the entire region with
5f501d555653f8 Kees Cook          2021-11-08  1080  		 * MAP_FIXED_NOREPLACE in the once-per-binary logic following.
eab09532d40090 Kees Cook          2017-07-10  1081  		 */
2b4bfbe0967697 Akira Kawata       2022-01-27  1082  		if (!first_pt_load) {
b212921b13bda0 Linus Torvalds     2019-10-06  1083  			elf_flags |= MAP_FIXED;
5f501d555653f8 Kees Cook          2021-11-08  1084  		} else if (elf_ex->e_type == ET_EXEC) {
5f501d555653f8 Kees Cook          2021-11-08  1085  			/*
5f501d555653f8 Kees Cook          2021-11-08  1086  			 * This logic is run once for the first LOAD Program
5f501d555653f8 Kees Cook          2021-11-08  1087  			 * Header for ET_EXEC binaries. No special handling
5f501d555653f8 Kees Cook          2021-11-08  1088  			 * is needed.
5f501d555653f8 Kees Cook          2021-11-08  1089  			 */
5f501d555653f8 Kees Cook          2021-11-08  1090  			elf_flags |= MAP_FIXED_NOREPLACE;
a62c5b1b6647ea Alexey Dobriyan    2020-01-30  1091  		} else if (elf_ex->e_type == ET_DYN) {
eab09532d40090 Kees Cook          2017-07-10  1092  			/*
eab09532d40090 Kees Cook          2017-07-10  1093  			 * This logic is run once for the first LOAD Program
eab09532d40090 Kees Cook          2017-07-10  1094  			 * Header for ET_DYN binaries to calculate the
eab09532d40090 Kees Cook          2017-07-10  1095  			 * randomization (load_bias) for all the LOAD
5f501d555653f8 Kees Cook          2021-11-08  1096  			 * Program Headers.
eab09532d40090 Kees Cook          2017-07-10  1097  			 *
eab09532d40090 Kees Cook          2017-07-10  1098  			 * There are effectively two types of ET_DYN
eab09532d40090 Kees Cook          2017-07-10  1099  			 * binaries: programs (i.e. PIE: ET_DYN with INTERP)
eab09532d40090 Kees Cook          2017-07-10  1100  			 * and loaders (ET_DYN without INTERP, since they
eab09532d40090 Kees Cook          2017-07-10  1101  			 * _are_ the ELF interpreter). The loaders must
eab09532d40090 Kees Cook          2017-07-10  1102  			 * be loaded away from programs since the program
eab09532d40090 Kees Cook          2017-07-10  1103  			 * may otherwise collide with the loader (especially
eab09532d40090 Kees Cook          2017-07-10  1104  			 * for ET_EXEC which does not have a randomized
eab09532d40090 Kees Cook          2017-07-10  1105  			 * position). For example to handle invocations of
eab09532d40090 Kees Cook          2017-07-10  1106  			 * "./ld.so someprog" to test out a new version of
eab09532d40090 Kees Cook          2017-07-10  1107  			 * the loader, the subsequent program that the
eab09532d40090 Kees Cook          2017-07-10  1108  			 * loader loads must avoid the loader itself, so
eab09532d40090 Kees Cook          2017-07-10  1109  			 * they cannot share the same load range. Sufficient
eab09532d40090 Kees Cook          2017-07-10  1110  			 * room for the brk must be allocated with the
eab09532d40090 Kees Cook          2017-07-10  1111  			 * loader as well, since brk must be available with
eab09532d40090 Kees Cook          2017-07-10  1112  			 * the loader.
eab09532d40090 Kees Cook          2017-07-10  1113  			 *
eab09532d40090 Kees Cook          2017-07-10  1114  			 * Therefore, programs are loaded offset from
eab09532d40090 Kees Cook          2017-07-10  1115  			 * ELF_ET_DYN_BASE and loaders are loaded into the
eab09532d40090 Kees Cook          2017-07-10  1116  			 * independently randomized mmap region (0 load_bias
5f501d555653f8 Kees Cook          2021-11-08  1117  			 * without MAP_FIXED nor MAP_FIXED_NOREPLACE).
eab09532d40090 Kees Cook          2017-07-10  1118  			 */
aeb7923733d100 Andrew Morton      2022-04-14  1119  			if (interpreter) {
eab09532d40090 Kees Cook          2017-07-10 @1120  				load_bias = ELF_ET_DYN_BASE;
a3defbe5c337db Jiri Kosina        2011-11-02  1121  				if (current->flags & PF_RANDOMIZE)
d1fd836dcf00d2 Kees Cook          2015-04-14  1122  					load_bias += arch_mmap_rnd();
aeb7923733d100 Andrew Morton      2022-04-14  1123  				alignment = maximum_alignment(elf_phdata, elf_ex->e_phnum);
ce81bb256a2242 Chris Kennelly     2020-10-15  1124  				if (alignment)
ce81bb256a2242 Chris Kennelly     2020-10-15  1125  					load_bias &= ~(alignment - 1);
5f501d555653f8 Kees Cook          2021-11-08  1126  				elf_flags |= MAP_FIXED_NOREPLACE;
eab09532d40090 Kees Cook          2017-07-10  1127  			} else
eab09532d40090 Kees Cook          2017-07-10  1128  				load_bias = 0;
eab09532d40090 Kees Cook          2017-07-10  1129  
eab09532d40090 Kees Cook          2017-07-10  1130  			/*
eab09532d40090 Kees Cook          2017-07-10  1131  			 * Since load_bias is used for all subsequent loading
eab09532d40090 Kees Cook          2017-07-10  1132  			 * calculations, we must lower it by the first vaddr
eab09532d40090 Kees Cook          2017-07-10  1133  			 * so that the remaining calculations based on the
eab09532d40090 Kees Cook          2017-07-10  1134  			 * ELF vaddrs will be correctly offset. The result
eab09532d40090 Kees Cook          2017-07-10  1135  			 * is then page aligned.
eab09532d40090 Kees Cook          2017-07-10  1136  			 */
eab09532d40090 Kees Cook          2017-07-10  1137  			load_bias = ELF_PAGESTART(load_bias - vaddr);
eab09532d40090 Kees Cook          2017-07-10  1138  
5f501d555653f8 Kees Cook          2021-11-08  1139  			/*
439a8468242b31 Kees Cook          2022-02-28  1140  			 * Calculate the entire size of the ELF mapping
439a8468242b31 Kees Cook          2022-02-28  1141  			 * (total_size), used for the initial mapping,
439a8468242b31 Kees Cook          2022-02-28  1142  			 * due to load_addr_set which is set to true later
439a8468242b31 Kees Cook          2022-02-28  1143  			 * once the initial mapping is performed.
439a8468242b31 Kees Cook          2022-02-28  1144  			 *
439a8468242b31 Kees Cook          2022-02-28  1145  			 * Note that this is only sensible when the LOAD
439a8468242b31 Kees Cook          2022-02-28  1146  			 * segments are contiguous (or overlapping). If
439a8468242b31 Kees Cook          2022-02-28  1147  			 * used for LOADs that are far apart, this would
439a8468242b31 Kees Cook          2022-02-28  1148  			 * cause the holes between LOADs to be mapped,
439a8468242b31 Kees Cook          2022-02-28  1149  			 * running the risk of having the mapping fail,
439a8468242b31 Kees Cook          2022-02-28  1150  			 * as it would be larger than the ELF file itself.
439a8468242b31 Kees Cook          2022-02-28  1151  			 *
439a8468242b31 Kees Cook          2022-02-28  1152  			 * As a result, only ET_DYN does this, since
439a8468242b31 Kees Cook          2022-02-28  1153  			 * some ET_EXEC (e.g. ia64) may have large virtual
439a8468242b31 Kees Cook          2022-02-28  1154  			 * memory holes between LOADs.
439a8468242b31 Kees Cook          2022-02-28  1155  			 *
5f501d555653f8 Kees Cook          2021-11-08  1156  			 */
a87938b2e246b8 Michael Davidson   2015-04-14  1157  			total_size = total_mapping_size(elf_phdata,
a62c5b1b6647ea Alexey Dobriyan    2020-01-30  1158  							elf_ex->e_phnum);
a87938b2e246b8 Michael Davidson   2015-04-14  1159  			if (!total_size) {
2b1d3ae940acd1 Andrew Morton      2015-05-28  1160  				retval = -EINVAL;
a87938b2e246b8 Michael Davidson   2015-04-14  1161  				goto out_free_dentry;
a87938b2e246b8 Michael Davidson   2015-04-14  1162  			}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1163  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1164  
f4e5cc2c44bf76 Jesper Juhl        2006-06-23  1165  		error = elf_map(bprm->file, load_bias + vaddr, elf_ppnt,
a87938b2e246b8 Michael Davidson   2015-04-14  1166  				elf_prot, elf_flags, total_size);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1167  		if (BAD_ADDR(error)) {
dc64cc12bcd142 Bo Liu             2022-11-14  1168  			retval = IS_ERR_VALUE(error) ?
b140f25108a8b1 Alexey Kuznetsov   2007-05-08  1169  				PTR_ERR((void*)error) : -EINVAL;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1170  			goto out_free_dentry;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1171  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1172  
2b4bfbe0967697 Akira Kawata       2022-01-27  1173  		if (first_pt_load) {
2b4bfbe0967697 Akira Kawata       2022-01-27  1174  			first_pt_load = 0;
a62c5b1b6647ea Alexey Dobriyan    2020-01-30  1175  			if (elf_ex->e_type == ET_DYN) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  1176  				load_bias += error -
^1da177e4c3f41 Linus Torvalds     2005-04-16  1177  				             ELF_PAGESTART(load_bias + vaddr);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1178  				reloc_func_desc = load_bias;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1179  			}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1180  		}
0da1d5002745cd Akira Kawata       2022-01-27  1181  
0da1d5002745cd Akira Kawata       2022-01-27  1182  		/*
0da1d5002745cd Akira Kawata       2022-01-27  1183  		 * Figure out which segment in the file contains the Program
0da1d5002745cd Akira Kawata       2022-01-27  1184  		 * Header table, and map to the associated memory address.
0da1d5002745cd Akira Kawata       2022-01-27  1185  		 */
0da1d5002745cd Akira Kawata       2022-01-27  1186  		if (elf_ppnt->p_offset <= elf_ex->e_phoff &&
0da1d5002745cd Akira Kawata       2022-01-27  1187  		    elf_ex->e_phoff < elf_ppnt->p_offset + elf_ppnt->p_filesz) {
0da1d5002745cd Akira Kawata       2022-01-27  1188  			phdr_addr = elf_ex->e_phoff - elf_ppnt->p_offset +
0da1d5002745cd Akira Kawata       2022-01-27  1189  				    elf_ppnt->p_vaddr;
0da1d5002745cd Akira Kawata       2022-01-27  1190  		}
0da1d5002745cd Akira Kawata       2022-01-27  1191  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1192  		k = elf_ppnt->p_vaddr;
f67ef446291a09 Alexey Dobriyan    2020-01-30  1193  		if ((elf_ppnt->p_flags & PF_X) && k < start_code)
f4e5cc2c44bf76 Jesper Juhl        2006-06-23  1194  			start_code = k;
f4e5cc2c44bf76 Jesper Juhl        2006-06-23  1195  		if (start_data < k)
f4e5cc2c44bf76 Jesper Juhl        2006-06-23  1196  			start_data = k;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1197  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1198  		/*
^1da177e4c3f41 Linus Torvalds     2005-04-16  1199  		 * Check to see if the section's size will overflow the
^1da177e4c3f41 Linus Torvalds     2005-04-16  1200  		 * allowed task size. Note that p_filesz must always be
^1da177e4c3f41 Linus Torvalds     2005-04-16  1201  		 * <= p_memsz so it is only necessary to check p_memsz.
^1da177e4c3f41 Linus Torvalds     2005-04-16  1202  		 */
ce51059be56f63 Chuck Ebbert       2006-07-03  1203  		if (BAD_ADDR(k) || elf_ppnt->p_filesz > elf_ppnt->p_memsz ||
^1da177e4c3f41 Linus Torvalds     2005-04-16  1204  		    elf_ppnt->p_memsz > TASK_SIZE ||
^1da177e4c3f41 Linus Torvalds     2005-04-16  1205  		    TASK_SIZE - elf_ppnt->p_memsz < k) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  1206  			/* set_brk can never work. Avoid overflows. */
b140f25108a8b1 Alexey Kuznetsov   2007-05-08  1207  			retval = -EINVAL;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1208  			goto out_free_dentry;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1209  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1210  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1211  		k = elf_ppnt->p_vaddr + elf_ppnt->p_filesz;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1212  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1213  		if (k > elf_bss)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1214  			elf_bss = k;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1215  		if ((elf_ppnt->p_flags & PF_X) && end_code < k)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1216  			end_code = k;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1217  		if (end_data < k)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1218  			end_data = k;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1219  		k = elf_ppnt->p_vaddr + elf_ppnt->p_memsz;
16e72e9b30986e Denys Vlasenko     2017-02-22  1220  		if (k > elf_brk) {
16e72e9b30986e Denys Vlasenko     2017-02-22  1221  			bss_prot = elf_prot;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1222  			elf_brk = k;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1223  		}
16e72e9b30986e Denys Vlasenko     2017-02-22  1224  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1225  
a62c5b1b6647ea Alexey Dobriyan    2020-01-30  1226  	e_entry = elf_ex->e_entry + load_bias;
0da1d5002745cd Akira Kawata       2022-01-27  1227  	phdr_addr += load_bias;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1228  	elf_bss += load_bias;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1229  	elf_brk += load_bias;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1230  	start_code += load_bias;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1231  	end_code += load_bias;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1232  	start_data += load_bias;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1233  	end_data += load_bias;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1234  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1235  	/* Calling set_brk effectively mmaps the pages that we need
^1da177e4c3f41 Linus Torvalds     2005-04-16  1236  	 * for the bss and break sections.  We must do this before
^1da177e4c3f41 Linus Torvalds     2005-04-16  1237  	 * mapping in the interpreter, to make sure it doesn't wind
^1da177e4c3f41 Linus Torvalds     2005-04-16  1238  	 * up getting placed where the bss needs to go.
^1da177e4c3f41 Linus Torvalds     2005-04-16  1239  	 */
16e72e9b30986e Denys Vlasenko     2017-02-22  1240  	retval = set_brk(elf_bss, elf_brk, bss_prot);
19d860a140beac Al Viro            2014-05-04  1241  	if (retval)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1242  		goto out_free_dentry;
6de505173e24e7 akpm@osdl.org      2005-10-11  1243  	if (likely(elf_bss != elf_brk) && unlikely(padzero(elf_bss))) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  1244  		retval = -EFAULT; /* Nobody gets to see this, but.. */
^1da177e4c3f41 Linus Torvalds     2005-04-16  1245  		goto out_free_dentry;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1246  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1247  
cc338010a233c0 Alexey Dobriyan    2019-05-14  1248  	if (interpreter) {
c69bcc932ef356 Alexey Dobriyan    2020-04-06  1249  		elf_entry = load_elf_interp(interp_elf_ex,
^1da177e4c3f41 Linus Torvalds     2005-04-16  1250  					    interpreter,
fe0f67660ee9c9 Dave Martin        2020-03-16  1251  					    load_bias, interp_elf_phdata,
fe0f67660ee9c9 Dave Martin        2020-03-16  1252  					    &arch_state);
dc64cc12bcd142 Bo Liu             2022-11-14  1253  		if (!IS_ERR_VALUE(elf_entry)) {
cc503c1b43e002 Jiri Kosina        2008-01-30  1254  			/*
cc503c1b43e002 Jiri Kosina        2008-01-30  1255  			 * load_elf_interp() returns relocation
cc503c1b43e002 Jiri Kosina        2008-01-30  1256  			 * adjustment
cc503c1b43e002 Jiri Kosina        2008-01-30  1257  			 */
cc503c1b43e002 Jiri Kosina        2008-01-30  1258  			interp_load_addr = elf_entry;
c69bcc932ef356 Alexey Dobriyan    2020-04-06  1259  			elf_entry += interp_elf_ex->e_entry;
cc503c1b43e002 Jiri Kosina        2008-01-30  1260  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1261  		if (BAD_ADDR(elf_entry)) {
dc64cc12bcd142 Bo Liu             2022-11-14  1262  			retval = IS_ERR_VALUE(elf_entry) ?
ce51059be56f63 Chuck Ebbert       2006-07-03  1263  					(int)elf_entry : -EINVAL;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1264  			goto out_free_dentry;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1265  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1266  		reloc_func_desc = interp_load_addr;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1267  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1268  		allow_write_access(interpreter);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1269  		fput(interpreter);
0693ffebcfe5ac Alexey Dobriyan    2020-04-06  1270  
0693ffebcfe5ac Alexey Dobriyan    2020-04-06  1271  		kfree(interp_elf_ex);
aa0d1564b10f91 Alexey Dobriyan    2020-04-06  1272  		kfree(interp_elf_phdata);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1273  	} else {
a62c5b1b6647ea Alexey Dobriyan    2020-01-30  1274  		elf_entry = e_entry;
5342fba5412cea Suresh Siddha      2006-02-26  1275  		if (BAD_ADDR(elf_entry)) {
ce51059be56f63 Chuck Ebbert       2006-07-03  1276  			retval = -EINVAL;
5342fba5412cea Suresh Siddha      2006-02-26  1277  			goto out_free_dentry;
5342fba5412cea Suresh Siddha      2006-02-26  1278  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1279  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1280  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1281  	kfree(elf_phdata);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1282  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1283  	set_binfmt(&elf_format);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1284  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
