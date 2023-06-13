Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3939B12B77;
	Tue, 13 Jun 2023 13:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686661259; x=1718197259;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PEy0L2EK+efxhJkATFmIW6IR0K5mN5UNIYCoF8c3L9w=;
  b=itbD4Ln/SfInDc9PEsWnH379sv+Gowo7KPaaHgfX50xx+uNctpd6qoVO
   /HOC8ov718vqelUszFme2Vs3nnagas4I/EKGb8sIIgJWTv46b61UOJS70
   YyJsf4W0Q/wy/0mcx5nwBx2oc2weLo477re0qWiIQ73MZl9roskFJVTvQ
   7Hxd/xVK8bTMeIR14IUF8jdlcLjJfsnnR94AdnDoGmf0P/iHp5x1E6aqj
   eCbVEZBD03DW9nmYbhOaeXQ5eLIcj31P8c9IWMu4rLaSgDh0e/k8eU1FS
   k7riKLxbVSJaYYSvQXA399VKRycnBsXCrJTj5IXhPqpZBe18uSd/lUYal
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="355817631"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
   d="scan'208";a="355817631"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 06:00:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="662001994"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
   d="scan'208";a="662001994"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 13 Jun 2023 06:00:56 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q93do-0001Ms-03;
	Tue, 13 Jun 2023 13:00:56 +0000
Date: Tue, 13 Jun 2023 21:00:44 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mike Rapoport <rppt@kernel.org>
Subject: [rppt:jitalloc/v1.2 5/12] arch/x86/kernel/module.c:89:5: warning: no
 previous prototype for function 'apply_relocate'
Message-ID: <202306132028.yDbmLgzp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git jitalloc/v1.2
head:   84c44775df115634608120edf7c1bdf7406681e1
commit: b4d73452333b2bc23e7d5cc51951aec6d4279320 [5/12] modules, execmem: drop module_alloc
config: i386-randconfig-i002-20230612 (https://download.01.org/0day-ci/archive/20230613/202306132028.yDbmLgzp-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/commit/?id=b4d73452333b2bc23e7d5cc51951aec6d4279320
        git remote add rppt https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git
        git fetch --no-tags rppt jitalloc/v1.2
        git checkout b4d73452333b2bc23e7d5cc51951aec6d4279320
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/kernel/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306132028.yDbmLgzp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/module.c:89:5: warning: no previous prototype for function 'apply_relocate' [-Wmissing-prototypes]
   int apply_relocate(Elf32_Shdr *sechdrs,
       ^
   arch/x86/kernel/module.c:89:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int apply_relocate(Elf32_Shdr *sechdrs,
   ^
   static 
   arch/x86/kernel/module.c:272:5: warning: no previous prototype for function 'module_finalize' [-Wmissing-prototypes]
   int module_finalize(const Elf_Ehdr *hdr,
       ^
   arch/x86/kernel/module.c:272:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int module_finalize(const Elf_Ehdr *hdr,
   ^
   static 
   arch/x86/kernel/module.c:377:6: warning: no previous prototype for function 'module_arch_cleanup' [-Wmissing-prototypes]
   void module_arch_cleanup(struct module *mod)
        ^
   arch/x86/kernel/module.c:377:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void module_arch_cleanup(struct module *mod)
   ^
   static 
   3 warnings generated.


vim +/apply_relocate +89 arch/x86/kernel/module.c

0fdc83b950df9e Amerigo Wang       2009-06-03   87  
0fdc83b950df9e Amerigo Wang       2009-06-03   88  #ifdef CONFIG_X86_32
0fdc83b950df9e Amerigo Wang       2009-06-03  @89  int apply_relocate(Elf32_Shdr *sechdrs,
0fdc83b950df9e Amerigo Wang       2009-06-03   90  		   const char *strtab,
0fdc83b950df9e Amerigo Wang       2009-06-03   91  		   unsigned int symindex,
0fdc83b950df9e Amerigo Wang       2009-06-03   92  		   unsigned int relsec,
0fdc83b950df9e Amerigo Wang       2009-06-03   93  		   struct module *me)
0fdc83b950df9e Amerigo Wang       2009-06-03   94  {
0fdc83b950df9e Amerigo Wang       2009-06-03   95  	unsigned int i;
0fdc83b950df9e Amerigo Wang       2009-06-03   96  	Elf32_Rel *rel = (void *)sechdrs[relsec].sh_addr;
0fdc83b950df9e Amerigo Wang       2009-06-03   97  	Elf32_Sym *sym;
0fdc83b950df9e Amerigo Wang       2009-06-03   98  	uint32_t *location;
0fdc83b950df9e Amerigo Wang       2009-06-03   99  
c767a54ba0657e Joe Perches        2012-05-21  100  	DEBUGP("Applying relocate section %u to %u\n",
c767a54ba0657e Joe Perches        2012-05-21  101  	       relsec, sechdrs[relsec].sh_info);
0fdc83b950df9e Amerigo Wang       2009-06-03  102  	for (i = 0; i < sechdrs[relsec].sh_size / sizeof(*rel); i++) {
0fdc83b950df9e Amerigo Wang       2009-06-03  103  		/* This is where to make the change */
0fdc83b950df9e Amerigo Wang       2009-06-03  104  		location = (void *)sechdrs[sechdrs[relsec].sh_info].sh_addr
0fdc83b950df9e Amerigo Wang       2009-06-03  105  			+ rel[i].r_offset;
0fdc83b950df9e Amerigo Wang       2009-06-03  106  		/* This is the symbol it is referring to.  Note that all
0fdc83b950df9e Amerigo Wang       2009-06-03  107  		   undefined symbols have been resolved.  */
0fdc83b950df9e Amerigo Wang       2009-06-03  108  		sym = (Elf32_Sym *)sechdrs[symindex].sh_addr
0fdc83b950df9e Amerigo Wang       2009-06-03  109  			+ ELF32_R_SYM(rel[i].r_info);
0fdc83b950df9e Amerigo Wang       2009-06-03  110  
0fdc83b950df9e Amerigo Wang       2009-06-03  111  		switch (ELF32_R_TYPE(rel[i].r_info)) {
0fdc83b950df9e Amerigo Wang       2009-06-03  112  		case R_386_32:
0fdc83b950df9e Amerigo Wang       2009-06-03  113  			/* We add the value into the location given */
0fdc83b950df9e Amerigo Wang       2009-06-03  114  			*location += sym->st_value;
0fdc83b950df9e Amerigo Wang       2009-06-03  115  			break;
0fdc83b950df9e Amerigo Wang       2009-06-03  116  		case R_386_PC32:
bb73d07148c405 Fangrui Song       2021-01-27  117  		case R_386_PLT32:
2e76c2838a2c1c Geert Uytterhoeven 2012-07-19  118  			/* Add the value, subtract its position */
0fdc83b950df9e Amerigo Wang       2009-06-03  119  			*location += sym->st_value - (uint32_t)location;
0fdc83b950df9e Amerigo Wang       2009-06-03  120  			break;
0fdc83b950df9e Amerigo Wang       2009-06-03  121  		default:
c767a54ba0657e Joe Perches        2012-05-21  122  			pr_err("%s: Unknown relocation: %u\n",
0fdc83b950df9e Amerigo Wang       2009-06-03  123  			       me->name, ELF32_R_TYPE(rel[i].r_info));
0fdc83b950df9e Amerigo Wang       2009-06-03  124  			return -ENOEXEC;
0fdc83b950df9e Amerigo Wang       2009-06-03  125  		}
0fdc83b950df9e Amerigo Wang       2009-06-03  126  	}
0fdc83b950df9e Amerigo Wang       2009-06-03  127  	return 0;
0fdc83b950df9e Amerigo Wang       2009-06-03  128  }
0fdc83b950df9e Amerigo Wang       2009-06-03  129  #else /*X86_64*/
0c05e7bd2d017a Song Liu           2023-01-25  130  static int __write_relocate_add(Elf64_Shdr *sechdrs,
0fdc83b950df9e Amerigo Wang       2009-06-03  131  		   const char *strtab,
0fdc83b950df9e Amerigo Wang       2009-06-03  132  		   unsigned int symindex,
0fdc83b950df9e Amerigo Wang       2009-06-03  133  		   unsigned int relsec,
88fc078a7a8f67 Peter Zijlstra     2020-04-29  134  		   struct module *me,
0c05e7bd2d017a Song Liu           2023-01-25  135  		   void *(*write)(void *dest, const void *src, size_t len),
0c05e7bd2d017a Song Liu           2023-01-25  136  		   bool apply)
0fdc83b950df9e Amerigo Wang       2009-06-03  137  {
0fdc83b950df9e Amerigo Wang       2009-06-03  138  	unsigned int i;
0fdc83b950df9e Amerigo Wang       2009-06-03  139  	Elf64_Rela *rel = (void *)sechdrs[relsec].sh_addr;
0fdc83b950df9e Amerigo Wang       2009-06-03  140  	Elf64_Sym *sym;
0fdc83b950df9e Amerigo Wang       2009-06-03  141  	void *loc;
0fdc83b950df9e Amerigo Wang       2009-06-03  142  	u64 val;
0c05e7bd2d017a Song Liu           2023-01-25  143  	u64 zero = 0ULL;
0fdc83b950df9e Amerigo Wang       2009-06-03  144  
0c05e7bd2d017a Song Liu           2023-01-25  145  	DEBUGP("%s relocate section %u to %u\n",
0c05e7bd2d017a Song Liu           2023-01-25  146  	       apply ? "Applying" : "Clearing",
c767a54ba0657e Joe Perches        2012-05-21  147  	       relsec, sechdrs[relsec].sh_info);
0fdc83b950df9e Amerigo Wang       2009-06-03  148  	for (i = 0; i < sechdrs[relsec].sh_size / sizeof(*rel); i++) {
0c05e7bd2d017a Song Liu           2023-01-25  149  		size_t size;
0c05e7bd2d017a Song Liu           2023-01-25  150  
0fdc83b950df9e Amerigo Wang       2009-06-03  151  		/* This is where to make the change */
0fdc83b950df9e Amerigo Wang       2009-06-03  152  		loc = (void *)sechdrs[sechdrs[relsec].sh_info].sh_addr
0fdc83b950df9e Amerigo Wang       2009-06-03  153  			+ rel[i].r_offset;
0fdc83b950df9e Amerigo Wang       2009-06-03  154  
0fdc83b950df9e Amerigo Wang       2009-06-03  155  		/* This is the symbol it is referring to.  Note that all
0fdc83b950df9e Amerigo Wang       2009-06-03  156  		   undefined symbols have been resolved.  */
0fdc83b950df9e Amerigo Wang       2009-06-03  157  		sym = (Elf64_Sym *)sechdrs[symindex].sh_addr
0fdc83b950df9e Amerigo Wang       2009-06-03  158  			+ ELF64_R_SYM(rel[i].r_info);
0fdc83b950df9e Amerigo Wang       2009-06-03  159  
0fdc83b950df9e Amerigo Wang       2009-06-03  160  		DEBUGP("type %d st_value %Lx r_addend %Lx loc %Lx\n",
0fdc83b950df9e Amerigo Wang       2009-06-03  161  		       (int)ELF64_R_TYPE(rel[i].r_info),
0fdc83b950df9e Amerigo Wang       2009-06-03  162  		       sym->st_value, rel[i].r_addend, (u64)loc);
0fdc83b950df9e Amerigo Wang       2009-06-03  163  
0fdc83b950df9e Amerigo Wang       2009-06-03  164  		val = sym->st_value + rel[i].r_addend;
0fdc83b950df9e Amerigo Wang       2009-06-03  165  
0fdc83b950df9e Amerigo Wang       2009-06-03  166  		switch (ELF64_R_TYPE(rel[i].r_info)) {
0fdc83b950df9e Amerigo Wang       2009-06-03  167  		case R_X86_64_NONE:
0c05e7bd2d017a Song Liu           2023-01-25  168  			continue;  /* nothing to write */
0fdc83b950df9e Amerigo Wang       2009-06-03  169  		case R_X86_64_64:
0c05e7bd2d017a Song Liu           2023-01-25  170  			size = 8;
0fdc83b950df9e Amerigo Wang       2009-06-03  171  			break;
0fdc83b950df9e Amerigo Wang       2009-06-03  172  		case R_X86_64_32:
0c05e7bd2d017a Song Liu           2023-01-25  173  			if (val != *(u32 *)&val)
0fdc83b950df9e Amerigo Wang       2009-06-03  174  				goto overflow;
0c05e7bd2d017a Song Liu           2023-01-25  175  			size = 4;
0fdc83b950df9e Amerigo Wang       2009-06-03  176  			break;
0fdc83b950df9e Amerigo Wang       2009-06-03  177  		case R_X86_64_32S:
0c05e7bd2d017a Song Liu           2023-01-25  178  			if ((s64)val != *(s32 *)&val)
0fdc83b950df9e Amerigo Wang       2009-06-03  179  				goto overflow;
0c05e7bd2d017a Song Liu           2023-01-25  180  			size = 4;
0fdc83b950df9e Amerigo Wang       2009-06-03  181  			break;
0fdc83b950df9e Amerigo Wang       2009-06-03  182  		case R_X86_64_PC32:
b21ebf2fb4cde1 H.J. Lu            2018-02-07  183  		case R_X86_64_PLT32:
0fdc83b950df9e Amerigo Wang       2009-06-03  184  			val -= (u64)loc;
0c05e7bd2d017a Song Liu           2023-01-25  185  			size = 4;
0fdc83b950df9e Amerigo Wang       2009-06-03  186  			break;
b40a142b12b5c4 Ard Biesheuvel     2018-09-18  187  		case R_X86_64_PC64:
b40a142b12b5c4 Ard Biesheuvel     2018-09-18  188  			val -= (u64)loc;
0c05e7bd2d017a Song Liu           2023-01-25  189  			size = 8;
b40a142b12b5c4 Ard Biesheuvel     2018-09-18  190  			break;
0fdc83b950df9e Amerigo Wang       2009-06-03  191  		default:
c767a54ba0657e Joe Perches        2012-05-21  192  			pr_err("%s: Unknown rela relocation: %llu\n",
0fdc83b950df9e Amerigo Wang       2009-06-03  193  			       me->name, ELF64_R_TYPE(rel[i].r_info));
0fdc83b950df9e Amerigo Wang       2009-06-03  194  			return -ENOEXEC;
0fdc83b950df9e Amerigo Wang       2009-06-03  195  		}
0fdc83b950df9e Amerigo Wang       2009-06-03  196  
0c05e7bd2d017a Song Liu           2023-01-25  197  		if (apply) {
0c05e7bd2d017a Song Liu           2023-01-25  198  			if (memcmp(loc, &zero, size)) {
0c05e7bd2d017a Song Liu           2023-01-25  199  				pr_err("x86/modules: Invalid relocation target, existing value is nonzero for type %d, loc %p, val %Lx\n",
eda9cec4c9a122 Josh Poimboeuf     2017-11-03  200  				       (int)ELF64_R_TYPE(rel[i].r_info), loc, val);
eda9cec4c9a122 Josh Poimboeuf     2017-11-03  201  				return -ENOEXEC;
0c05e7bd2d017a Song Liu           2023-01-25  202  			}
0c05e7bd2d017a Song Liu           2023-01-25  203  			write(loc, &val, size);
0c05e7bd2d017a Song Liu           2023-01-25  204  		} else {
0c05e7bd2d017a Song Liu           2023-01-25  205  			if (memcmp(loc, &val, size)) {
0c05e7bd2d017a Song Liu           2023-01-25  206  				pr_warn("x86/modules: Invalid relocation target, existing value does not match expected value for type %d, loc %p, val %Lx\n",
eda9cec4c9a122 Josh Poimboeuf     2017-11-03  207  					(int)ELF64_R_TYPE(rel[i].r_info), loc, val);
eda9cec4c9a122 Josh Poimboeuf     2017-11-03  208  				return -ENOEXEC;
0c05e7bd2d017a Song Liu           2023-01-25  209  			}
0c05e7bd2d017a Song Liu           2023-01-25  210  			write(loc, &zero, size);
0c05e7bd2d017a Song Liu           2023-01-25  211  		}
0c05e7bd2d017a Song Liu           2023-01-25  212  	}
0c05e7bd2d017a Song Liu           2023-01-25  213  	return 0;
eda9cec4c9a122 Josh Poimboeuf     2017-11-03  214  
0fdc83b950df9e Amerigo Wang       2009-06-03  215  overflow:
c767a54ba0657e Joe Perches        2012-05-21  216  	pr_err("overflow in relocation type %d val %Lx\n",
0fdc83b950df9e Amerigo Wang       2009-06-03  217  	       (int)ELF64_R_TYPE(rel[i].r_info), val);
c767a54ba0657e Joe Perches        2012-05-21  218  	pr_err("`%s' likely not compiled with -mcmodel=kernel\n",
0fdc83b950df9e Amerigo Wang       2009-06-03  219  	       me->name);
0fdc83b950df9e Amerigo Wang       2009-06-03  220  	return -ENOEXEC;
0fdc83b950df9e Amerigo Wang       2009-06-03  221  }
88fc078a7a8f67 Peter Zijlstra     2020-04-29  222  

:::::: The code at line 89 was first introduced by commit
:::::: 0fdc83b950df9e2eb45db6fca9c3d92c66fd5028 x86 module: merge the rest functions with macros

:::::: TO: Amerigo Wang <amwang@redhat.com>
:::::: CC: Rusty Russell <rusty@rustcorp.com.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
