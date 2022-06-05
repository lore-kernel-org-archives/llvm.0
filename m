Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FA37E
	for <llvm@lists.linux.dev>; Sun,  5 Jun 2022 05:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654407873; x=1685943873;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S1+z9zG2TMvYvvxaLk+Pjn2qSBD5vb4/rN4rz6//PZI=;
  b=T+P5+1+RMUaVeHB3NLERVPAldWcVRP2TpSTgH2mNVSkCTY5a4OBB5ra2
   6e+myQi9VEnAofZoqQCYblBypUwoNf2VaDrjJQugw9fMqVVPe8Lqpe5Ad
   CoFxmODFzxqnX2Wo/Y0AI5EIwcOSUtz2E6XjlPHHoD5F7eWbX8Xtp6dFo
   al8wijlUOajg38oJU1OZxobIlQCLa5YBfYPdc5AoLbuiKsDwh8XBcdFyf
   sG+g8hbDlNQ2TcRNag+SoN83+MPDaSdbBsUEJtKxzTxviAIFvhIvNBSlb
   h5nQOt40IB10HqEO1UytBRR623bef2ZkI/dkxsuqW98FwLsmuDk40zIsZ
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10368"; a="264201872"
X-IronPort-AV: E=Sophos;i="5.91,278,1647327600"; 
   d="scan'208";a="264201872"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2022 22:44:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,278,1647327600"; 
   d="scan'208";a="578635478"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 04 Jun 2022 22:44:31 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nxj3u-000BaJ-Lf;
	Sun, 05 Jun 2022 05:44:30 +0000
Date: Sun, 5 Jun 2022 13:44:14 +0800
From: kernel test robot <lkp@intel.com>
To: Li Zhengyu <lizhengyu3@huawei.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
Subject: arch/riscv/kernel/elf_kexec.c:352:2: error: use of undeclared
 identifier 'Elf_Rela'
Message-ID: <202206051300.0yaiV1r4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   952923ddc01120190dcf671e7b354364ce1d1362
commit: 838b3e28488f702e2b5477b393f009b2639d2b1a RISC-V: Load purgatory in kexec_file
date:   2 weeks ago
config: riscv-buildonly-randconfig-r009-20220605 (https://download.01.org/0day-ci/archive/20220605/202206051300.0yaiV1r4-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 416a5080d89066029f9889dc23f94de47c2fa895)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=838b3e28488f702e2b5477b393f009b2639d2b1a
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 838b3e28488f702e2b5477b393f009b2639d2b1a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kernel/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

>> arch/riscv/kernel/elf_kexec.c:352:2: error: use of undeclared identifier 'Elf_Rela'
           Elf_Rela *relas;
           ^
>> arch/riscv/kernel/elf_kexec.c:352:12: error: use of undeclared identifier 'relas'
           Elf_Rela *relas;
                     ^
   arch/riscv/kernel/elf_kexec.c:360:2: error: use of undeclared identifier 'relas'
           relas = (void *)pi->ehdr + relsec->sh_offset;
           ^
   arch/riscv/kernel/elf_kexec.c:362:44: error: use of undeclared identifier 'relas'
           for (i = 0; i < relsec->sh_size / sizeof(*relas); i++) {
                                                     ^
   arch/riscv/kernel/elf_kexec.c:370:22: error: use of undeclared identifier 'relas'
                   sym += ELF64_R_SYM(relas[i].r_info);
                                      ^
   arch/riscv/kernel/elf_kexec.c:379:10: error: use of undeclared identifier 'relas'
                   loc += relas[i].r_offset;
                          ^
   arch/riscv/kernel/elf_kexec.c:392:10: error: use of undeclared identifier 'relas'
                   val += relas[i].r_addend;
                          ^
   arch/riscv/kernel/elf_kexec.c:394:29: error: use of undeclared identifier 'relas'
                   addr = section->sh_addr + relas[i].r_offset;
                                             ^
   arch/riscv/kernel/elf_kexec.c:396:25: error: use of undeclared identifier 'relas'
                   r_type = ELF64_R_TYPE(relas[i].r_info);
                                         ^
>> arch/riscv/kernel/elf_kexec.c:353:6: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
           int i, r_type;
               ^
   1 warning and 9 errors generated.


vim +/Elf_Rela +352 arch/riscv/kernel/elf_kexec.c

   318	
   319	#define ENCODE_ITYPE_IMM(x) \
   320		(RV_X(x, 0, 12) << 20)
   321	#define ENCODE_BTYPE_IMM(x) \
   322		((RV_X(x, 1, 4) << 8) | (RV_X(x, 5, 6) << 25) | \
   323		(RV_X(x, 11, 1) << 7) | (RV_X(x, 12, 1) << 31))
   324	#define ENCODE_UTYPE_IMM(x) \
   325		(RV_X(x, 12, 20) << 12)
   326	#define ENCODE_JTYPE_IMM(x) \
   327		((RV_X(x, 1, 10) << 21) | (RV_X(x, 11, 1) << 20) | \
   328		(RV_X(x, 12, 8) << 12) | (RV_X(x, 20, 1) << 31))
   329	#define ENCODE_CBTYPE_IMM(x) \
   330		((RV_X(x, 1, 2) << 3) | (RV_X(x, 3, 2) << 10) | (RV_X(x, 5, 1) << 2) | \
   331		(RV_X(x, 6, 2) << 5) | (RV_X(x, 8, 1) << 12))
   332	#define ENCODE_CJTYPE_IMM(x) \
   333		((RV_X(x, 1, 3) << 3) | (RV_X(x, 4, 1) << 11) | (RV_X(x, 5, 1) << 2) | \
   334		(RV_X(x, 6, 1) << 7) | (RV_X(x, 7, 1) << 6) | (RV_X(x, 8, 2) << 9) | \
   335		(RV_X(x, 10, 1) << 8) | (RV_X(x, 11, 1) << 12))
   336	#define ENCODE_UJTYPE_IMM(x) \
   337		(ENCODE_UTYPE_IMM(RISCV_CONST_HIGH_PART(x)) | \
   338		(ENCODE_ITYPE_IMM(RISCV_CONST_LOW_PART(x)) << 32))
   339	#define ENCODE_UITYPE_IMM(x) \
   340		(ENCODE_UTYPE_IMM(x) | (ENCODE_ITYPE_IMM(x) << 32))
   341	
   342	#define CLEAN_IMM(type, x) \
   343		((~ENCODE_##type##_IMM((uint64_t)(-1))) & (x))
   344	
   345	int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
   346					     Elf_Shdr *section,
   347					     const Elf_Shdr *relsec,
   348					     const Elf_Shdr *symtab)
   349	{
   350		const char *strtab, *name, *shstrtab;
   351		const Elf_Shdr *sechdrs;
 > 352		Elf_Rela *relas;
 > 353		int i, r_type;
   354	
   355		/* String & section header string table */
   356		sechdrs = (void *)pi->ehdr + pi->ehdr->e_shoff;
   357		strtab = (char *)pi->ehdr + sechdrs[symtab->sh_link].sh_offset;
   358		shstrtab = (char *)pi->ehdr + sechdrs[pi->ehdr->e_shstrndx].sh_offset;
   359	
   360		relas = (void *)pi->ehdr + relsec->sh_offset;
   361	
   362		for (i = 0; i < relsec->sh_size / sizeof(*relas); i++) {
   363			const Elf_Sym *sym;	/* symbol to relocate */
   364			unsigned long addr;	/* final location after relocation */
   365			unsigned long val;	/* relocated symbol value */
   366			unsigned long sec_base;	/* relocated symbol value */
   367			void *loc;		/* tmp location to modify */
   368	
   369			sym = (void *)pi->ehdr + symtab->sh_offset;
   370			sym += ELF64_R_SYM(relas[i].r_info);
   371	
   372			if (sym->st_name)
   373				name = strtab + sym->st_name;
   374			else
   375				name = shstrtab + sechdrs[sym->st_shndx].sh_name;
   376	
   377			loc = pi->purgatory_buf;
   378			loc += section->sh_offset;
   379			loc += relas[i].r_offset;
   380	
   381			if (sym->st_shndx == SHN_ABS)
   382				sec_base = 0;
   383			else if (sym->st_shndx >= pi->ehdr->e_shnum) {
   384				pr_err("Invalid section %d for symbol %s\n",
   385				       sym->st_shndx, name);
   386				return -ENOEXEC;
   387			} else
   388				sec_base = pi->sechdrs[sym->st_shndx].sh_addr;
   389	
   390			val = sym->st_value;
   391			val += sec_base;
   392			val += relas[i].r_addend;
   393	
   394			addr = section->sh_addr + relas[i].r_offset;
   395	
   396			r_type = ELF64_R_TYPE(relas[i].r_info);
   397	
   398			switch (r_type) {
   399			case R_RISCV_BRANCH:
   400				*(u32 *)loc = CLEAN_IMM(BTYPE, *(u32 *)loc) |
   401					 ENCODE_BTYPE_IMM(val - addr);
   402				break;
   403			case R_RISCV_JAL:
   404				*(u32 *)loc = CLEAN_IMM(JTYPE, *(u32 *)loc) |
   405					 ENCODE_JTYPE_IMM(val - addr);
   406				break;
   407			/*
   408			 * With no R_RISCV_PCREL_LO12_S, R_RISCV_PCREL_LO12_I
   409			 * sym is expected to be next to R_RISCV_PCREL_HI20
   410			 * in purgatory relsec. Handle it like R_RISCV_CALL
   411			 * sym, instead of searching the whole relsec.
   412			 */
   413			case R_RISCV_PCREL_HI20:
   414			case R_RISCV_CALL:
   415				*(u64 *)loc = CLEAN_IMM(UITYPE, *(u64 *)loc) |
   416					 ENCODE_UJTYPE_IMM(val - addr);
   417				break;
   418			case R_RISCV_RVC_BRANCH:
   419				*(u32 *)loc = CLEAN_IMM(CBTYPE, *(u32 *)loc) |
   420					 ENCODE_CBTYPE_IMM(val - addr);
   421				break;
   422			case R_RISCV_RVC_JUMP:
   423				*(u32 *)loc = CLEAN_IMM(CJTYPE, *(u32 *)loc) |
   424					 ENCODE_CJTYPE_IMM(val - addr);
   425				break;
   426			case R_RISCV_ADD32:
   427				*(u32 *)loc += val;
   428				break;
   429			case R_RISCV_SUB32:
   430				*(u32 *)loc -= val;
   431				break;
   432			/* It has been applied by R_RISCV_PCREL_HI20 sym */
   433			case R_RISCV_PCREL_LO12_I:
   434			case R_RISCV_ALIGN:
   435			case R_RISCV_RELAX:
   436				break;
   437			default:
   438				pr_err("Unknown rela relocation: %d\n", r_type);
   439				return -ENOEXEC;
   440			}
   441		}
   442		return 0;
   443	}
   444	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
