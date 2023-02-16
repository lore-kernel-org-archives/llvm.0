Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF3AD30E;
	Thu, 16 Feb 2023 03:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676519870; x=1708055870;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jeNn1tbl3USScggvUrSfePciuCeB+sRpk1J7dzezC+0=;
  b=eO9AjcZd5OHI5Zoh4BxnP15R4dVR4O60MLRtUVEWiuh/fx9basYOEC+z
   jxS3+m444YEKdgCgaXkls+DmebAhoSif8DS4FErKaLQATCkTU79/adO4z
   qjGwnM9g15A9c633OljquY2jsuOvCtxsdTVp8H2JSprcuzTklIVbG/6YT
   jODOxqOK5zQkiTg7y17q+U3u6csgw7BlCuFXG1KBoPPTKMmLiwAxsOV/I
   FAEptIp53/D73uM4ebOv2UnNRgYCjyhzwwqlqhf5o/Q323anGXYzNDRFO
   Hn4sb6M8puryA0a244Sj+RtVnnCD5YC63q0hLt0j1EY1/qnkZlqlLlUp1
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="319672890"
X-IronPort-AV: E=Sophos;i="5.97,301,1669104000"; 
   d="scan'208";a="319672890"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 19:57:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="779206730"
X-IronPort-AV: E=Sophos;i="5.97,301,1669104000"; 
   d="scan'208";a="779206730"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 15 Feb 2023 19:57:15 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSVOU-0009zd-1f;
	Thu, 16 Feb 2023 03:57:14 +0000
Date: Thu, 16 Feb 2023 11:56:58 +0800
From: kernel test robot <lkp@intel.com>
To: Song Liu <song@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [linux-next:master 10828/13038] arch/mips/kernel/vpe.c:643:35:
 error: no member named 'mod_mem' in 'struct module'
Message-ID: <202302161117.pNuySGWi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9d9019bcea1aac7eed64a1a4966282b6b7b141c8
commit: 2ece476a23461f1a50555ad5487640c73f33ced9 [10828/13038] module: replace module_layout with module_memory
config: mips-maltaaprp_defconfig (https://download.01.org/0day-ci/archive/20230216/202302161117.pNuySGWi-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=2ece476a23461f1a50555ad5487640c73f33ced9
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 2ece476a23461f1a50555ad5487640c73f33ced9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302161117.pNuySGWi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/mips/kernel/vpe.c:643:35: error: no member named 'mod_mem' in 'struct module'
           v->load_addr = alloc_progmem(mod.mod_mem[MOD_TEXT].size);
                                        ~~~ ^
   1 error generated.


vim +643 arch/mips/kernel/vpe.c

   569	
   570	/*
   571	 * Allocates a VPE with some program code space(the load address), copies the
   572	 * contents of the program (p)buffer performing relocatations/etc, free's it
   573	 * when finished.
   574	 */
   575	static int vpe_elfload(struct vpe *v)
   576	{
   577		Elf_Ehdr *hdr;
   578		Elf_Shdr *sechdrs;
   579		long err = 0;
   580		char *secstrings, *strtab = NULL;
   581		unsigned int len, i, symindex = 0, strindex = 0, relocate = 0;
   582		struct module mod; /* so we can re-use the relocations code */
   583	
   584		memset(&mod, 0, sizeof(struct module));
   585		strcpy(mod.name, "VPE loader");
   586	
   587		hdr = (Elf_Ehdr *) v->pbuffer;
   588		len = v->plen;
   589	
   590		/* Sanity checks against insmoding binaries or wrong arch,
   591		   weird elf version */
   592		if (memcmp(hdr->e_ident, ELFMAG, SELFMAG) != 0
   593		    || (hdr->e_type != ET_REL && hdr->e_type != ET_EXEC)
   594		    || !elf_check_arch(hdr)
   595		    || hdr->e_shentsize != sizeof(*sechdrs)) {
   596			pr_warn("VPE loader: program wrong arch or weird elf version\n");
   597	
   598			return -ENOEXEC;
   599		}
   600	
   601		if (hdr->e_type == ET_REL)
   602			relocate = 1;
   603	
   604		if (len < hdr->e_shoff + hdr->e_shnum * sizeof(Elf_Shdr)) {
   605			pr_err("VPE loader: program length %u truncated\n", len);
   606	
   607			return -ENOEXEC;
   608		}
   609	
   610		/* Convenience variables */
   611		sechdrs = (void *)hdr + hdr->e_shoff;
   612		secstrings = (void *)hdr + sechdrs[hdr->e_shstrndx].sh_offset;
   613		sechdrs[0].sh_addr = 0;
   614	
   615		/* And these should exist, but gcc whinges if we don't init them */
   616		symindex = strindex = 0;
   617	
   618		if (relocate) {
   619			for (i = 1; i < hdr->e_shnum; i++) {
   620				if ((sechdrs[i].sh_type != SHT_NOBITS) &&
   621				    (len < sechdrs[i].sh_offset + sechdrs[i].sh_size)) {
   622					pr_err("VPE program length %u truncated\n",
   623					       len);
   624					return -ENOEXEC;
   625				}
   626	
   627				/* Mark all sections sh_addr with their address in the
   628				   temporary image. */
   629				sechdrs[i].sh_addr = (size_t) hdr +
   630					sechdrs[i].sh_offset;
   631	
   632				/* Internal symbols and strings. */
   633				if (sechdrs[i].sh_type == SHT_SYMTAB) {
   634					symindex = i;
   635					strindex = sechdrs[i].sh_link;
   636					strtab = (char *)hdr +
   637						sechdrs[strindex].sh_offset;
   638				}
   639			}
   640			layout_sections(&mod, hdr, sechdrs, secstrings);
   641		}
   642	
 > 643		v->load_addr = alloc_progmem(mod.mod_mem[MOD_TEXT].size);
   644		if (!v->load_addr)
   645			return -ENOMEM;
   646	
   647		pr_info("VPE loader: loading to %p\n", v->load_addr);
   648	
   649		if (relocate) {
   650			for (i = 0; i < hdr->e_shnum; i++) {
   651				void *dest;
   652	
   653				if (!(sechdrs[i].sh_flags & SHF_ALLOC))
   654					continue;
   655	
   656				dest = v->load_addr + sechdrs[i].sh_entsize;
   657	
   658				if (sechdrs[i].sh_type != SHT_NOBITS)
   659					memcpy(dest, (void *)sechdrs[i].sh_addr,
   660					       sechdrs[i].sh_size);
   661				/* Update sh_addr to point to copy in image. */
   662				sechdrs[i].sh_addr = (unsigned long)dest;
   663	
   664				pr_debug(" section sh_name %s sh_addr 0x%x\n",
   665					 secstrings + sechdrs[i].sh_name,
   666					 sechdrs[i].sh_addr);
   667			}
   668	
   669			/* Fix up syms, so that st_value is a pointer to location. */
   670			simplify_symbols(sechdrs, symindex, strtab, secstrings,
   671					 hdr->e_shnum, &mod);
   672	
   673			/* Now do relocations. */
   674			for (i = 1; i < hdr->e_shnum; i++) {
   675				const char *strtab = (char *)sechdrs[strindex].sh_addr;
   676				unsigned int info = sechdrs[i].sh_info;
   677	
   678				/* Not a valid relocation section? */
   679				if (info >= hdr->e_shnum)
   680					continue;
   681	
   682				/* Don't bother with non-allocated sections */
   683				if (!(sechdrs[info].sh_flags & SHF_ALLOC))
   684					continue;
   685	
   686				if (sechdrs[i].sh_type == SHT_REL)
   687					err = apply_relocations(sechdrs, strtab,
   688								symindex, i, &mod);
   689				else if (sechdrs[i].sh_type == SHT_RELA)
   690					err = apply_relocate_add(sechdrs, strtab,
   691								 symindex, i, &mod);
   692				if (err < 0)
   693					return err;
   694	
   695			}
   696		} else {
   697			struct elf_phdr *phdr = (struct elf_phdr *)
   698							((char *)hdr + hdr->e_phoff);
   699	
   700			for (i = 0; i < hdr->e_phnum; i++) {
   701				if (phdr->p_type == PT_LOAD) {
   702					memcpy((void *)phdr->p_paddr,
   703					       (char *)hdr + phdr->p_offset,
   704					       phdr->p_filesz);
   705					memset((void *)phdr->p_paddr + phdr->p_filesz,
   706					       0, phdr->p_memsz - phdr->p_filesz);
   707			    }
   708			    phdr++;
   709			}
   710	
   711			for (i = 0; i < hdr->e_shnum; i++) {
   712				/* Internal symbols and strings. */
   713				if (sechdrs[i].sh_type == SHT_SYMTAB) {
   714					symindex = i;
   715					strindex = sechdrs[i].sh_link;
   716					strtab = (char *)hdr +
   717						sechdrs[strindex].sh_offset;
   718	
   719					/*
   720					 * mark symtab's address for when we try
   721					 * to find the magic symbols
   722					 */
   723					sechdrs[i].sh_addr = (size_t) hdr +
   724						sechdrs[i].sh_offset;
   725				}
   726			}
   727		}
   728	
   729		/* make sure it's physically written out */
   730		flush_icache_range((unsigned long)v->load_addr,
   731				   (unsigned long)v->load_addr + v->len);
   732	
   733		if ((find_vpe_symbols(v, sechdrs, symindex, strtab, &mod)) < 0) {
   734			if (v->__start == 0) {
   735				pr_warn("VPE loader: program does not contain a __start symbol\n");
   736				return -ENOEXEC;
   737			}
   738	
   739			if (v->shared_ptr == NULL)
   740				pr_warn("VPE loader: program does not contain vpe_shared symbol.\n"
   741					" Unable to use AMVP (AP/SP) facilities.\n");
   742		}
   743	
   744		pr_info(" elf loaded\n");
   745		return 0;
   746	}
   747	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
