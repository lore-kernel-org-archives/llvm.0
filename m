Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BABC2CA6;
	Thu, 23 Mar 2023 16:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679589046; x=1711125046;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QzQ7oO+icWOXddcLeAzjE8U2JrXB1KCWe/59DsYb8/8=;
  b=adseKADbX8YDGbgK7OMDy4B6xaV/y4ghizPIGoT3gqkurg6MswZEx+lh
   Z/3EsGBe/bXnsld4oNxdDOfhQWtU047drqxJ6jDwtQhhPZmE5jL8TvReR
   Yr2wELpvBmNdCUH0BmXm8pFUxbVQByJnFctUh4FxJVbTpR4an3asvR5V5
   L/Tya/Sb7XUZEAw0VdRE2zp9Cz0BsdFwT4WHWw4P0GhSemu1wSu3gGxX4
   TK6bbTBD3RXSfVEoTmyGgFB8/6T/QIm00uZ92MU4rGxVf2/Lkg1YxwJNX
   kvgfACsyZniZlMD5s7Ni9HmAQsfXryAtixf2vt4RomSAuz+sp1Df10Pw7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="404452555"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="404452555"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 09:30:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="746793615"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="746793615"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 23 Mar 2023 09:30:34 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfNph-000EWq-2x;
	Thu, 23 Mar 2023 16:30:33 +0000
Date: Fri, 24 Mar 2023 00:30:13 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	David Hildenbrand <david@redhat.com>
Subject: [akpm-mm:mm-unstable 226/293] fs/proc/kcore.c:493:31: warning: shift
 count is negative
Message-ID: <202303240008.ZQ1TVBpS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mike,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   51551d71edbc998fd8c8afa7312db3d270f5998e
commit: 04719438eb2394584e4d164d70330e81dd325eac [226/293] mips: drop ranges for definition of ARCH_FORCE_MAX_ORDER
config: mips-randconfig-r012-20230322 (https://download.01.org/0day-ci/archive/20230324/202303240008.ZQ1TVBpS-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?id=04719438eb2394584e4d164d70330e81dd325eac
        git remote add akpm-mm https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git
        git fetch --no-tags akpm-mm mm-unstable
        git checkout 04719438eb2394584e4d164d70330e81dd325eac
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash fs/proc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303240008.ZQ1TVBpS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/proc/kcore.c:493:31: warning: shift count is negative [-Wshift-count-negative]
                   if (page_offline_frozen++ % MAX_ORDER_NR_PAGES == 0) {
                                               ^~~~~~~~~~~~~~~~~~
   include/linux/mmzone.h:33:31: note: expanded from macro 'MAX_ORDER_NR_PAGES'
   #define MAX_ORDER_NR_PAGES (1 << MAX_ORDER)
                                 ^  ~~~~~~~~~
>> fs/proc/kcore.c:493:29: warning: remainder by zero is undefined [-Wdivision-by-zero]
                   if (page_offline_frozen++ % MAX_ORDER_NR_PAGES == 0) {
                                             ^ ~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +493 fs/proc/kcore.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  309  
37e949bd5293dd Omar Sandoval     2018-08-21  310  static ssize_t
37e949bd5293dd Omar Sandoval     2018-08-21  311  read_kcore(struct file *file, char __user *buffer, size_t buflen, loff_t *fpos)
^1da177e4c3f41 Linus Torvalds    2005-04-16  312  {
37e949bd5293dd Omar Sandoval     2018-08-21  313  	char *buf = file->private_data;
37e949bd5293dd Omar Sandoval     2018-08-21  314  	size_t phdrs_offset, notes_offset, data_offset;
c6d9eee2a68619 David Hildenbrand 2021-06-30  315  	size_t page_offline_frozen = 1;
37e949bd5293dd Omar Sandoval     2018-08-21  316  	size_t phdrs_len, notes_len;
37e949bd5293dd Omar Sandoval     2018-08-21  317  	struct kcore_list *m;
37e949bd5293dd Omar Sandoval     2018-08-21  318  	size_t tsz;
37e949bd5293dd Omar Sandoval     2018-08-21  319  	int nphdr;
37e949bd5293dd Omar Sandoval     2018-08-21  320  	unsigned long start;
37e949bd5293dd Omar Sandoval     2018-08-21  321  	size_t orig_buflen = buflen;
37e949bd5293dd Omar Sandoval     2018-08-21  322  	int ret = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  323  
37e949bd5293dd Omar Sandoval     2018-08-21  324  	down_read(&kclist_lock);
c6d9eee2a68619 David Hildenbrand 2021-06-30  325  	/*
c6d9eee2a68619 David Hildenbrand 2021-06-30  326  	 * Don't race against drivers that set PageOffline() and expect no
c6d9eee2a68619 David Hildenbrand 2021-06-30  327  	 * further page access.
c6d9eee2a68619 David Hildenbrand 2021-06-30  328  	 */
c6d9eee2a68619 David Hildenbrand 2021-06-30  329  	page_offline_freeze();
^1da177e4c3f41 Linus Torvalds    2005-04-16  330  
37e949bd5293dd Omar Sandoval     2018-08-21  331  	get_kcore_size(&nphdr, &phdrs_len, &notes_len, &data_offset);
37e949bd5293dd Omar Sandoval     2018-08-21  332  	phdrs_offset = sizeof(struct elfhdr);
37e949bd5293dd Omar Sandoval     2018-08-21  333  	notes_offset = phdrs_offset + phdrs_len;
37e949bd5293dd Omar Sandoval     2018-08-21  334  
37e949bd5293dd Omar Sandoval     2018-08-21  335  	/* ELF file header. */
37e949bd5293dd Omar Sandoval     2018-08-21  336  	if (buflen && *fpos < sizeof(struct elfhdr)) {
37e949bd5293dd Omar Sandoval     2018-08-21  337  		struct elfhdr ehdr = {
37e949bd5293dd Omar Sandoval     2018-08-21  338  			.e_ident = {
37e949bd5293dd Omar Sandoval     2018-08-21  339  				[EI_MAG0] = ELFMAG0,
37e949bd5293dd Omar Sandoval     2018-08-21  340  				[EI_MAG1] = ELFMAG1,
37e949bd5293dd Omar Sandoval     2018-08-21  341  				[EI_MAG2] = ELFMAG2,
37e949bd5293dd Omar Sandoval     2018-08-21  342  				[EI_MAG3] = ELFMAG3,
37e949bd5293dd Omar Sandoval     2018-08-21  343  				[EI_CLASS] = ELF_CLASS,
37e949bd5293dd Omar Sandoval     2018-08-21  344  				[EI_DATA] = ELF_DATA,
37e949bd5293dd Omar Sandoval     2018-08-21  345  				[EI_VERSION] = EV_CURRENT,
37e949bd5293dd Omar Sandoval     2018-08-21  346  				[EI_OSABI] = ELF_OSABI,
37e949bd5293dd Omar Sandoval     2018-08-21  347  			},
37e949bd5293dd Omar Sandoval     2018-08-21  348  			.e_type = ET_CORE,
37e949bd5293dd Omar Sandoval     2018-08-21  349  			.e_machine = ELF_ARCH,
37e949bd5293dd Omar Sandoval     2018-08-21  350  			.e_version = EV_CURRENT,
37e949bd5293dd Omar Sandoval     2018-08-21  351  			.e_phoff = sizeof(struct elfhdr),
37e949bd5293dd Omar Sandoval     2018-08-21  352  			.e_flags = ELF_CORE_EFLAGS,
37e949bd5293dd Omar Sandoval     2018-08-21  353  			.e_ehsize = sizeof(struct elfhdr),
37e949bd5293dd Omar Sandoval     2018-08-21  354  			.e_phentsize = sizeof(struct elf_phdr),
37e949bd5293dd Omar Sandoval     2018-08-21  355  			.e_phnum = nphdr,
37e949bd5293dd Omar Sandoval     2018-08-21  356  		};
^1da177e4c3f41 Linus Torvalds    2005-04-16  357  
37e949bd5293dd Omar Sandoval     2018-08-21  358  		tsz = min_t(size_t, buflen, sizeof(struct elfhdr) - *fpos);
37e949bd5293dd Omar Sandoval     2018-08-21  359  		if (copy_to_user(buffer, (char *)&ehdr + *fpos, tsz)) {
37e949bd5293dd Omar Sandoval     2018-08-21  360  			ret = -EFAULT;
37e949bd5293dd Omar Sandoval     2018-08-21  361  			goto out;
37e949bd5293dd Omar Sandoval     2018-08-21  362  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  363  
37e949bd5293dd Omar Sandoval     2018-08-21  364  		buffer += tsz;
37e949bd5293dd Omar Sandoval     2018-08-21  365  		buflen -= tsz;
37e949bd5293dd Omar Sandoval     2018-08-21  366  		*fpos += tsz;
37e949bd5293dd Omar Sandoval     2018-08-21  367  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  368  
37e949bd5293dd Omar Sandoval     2018-08-21  369  	/* ELF program headers. */
37e949bd5293dd Omar Sandoval     2018-08-21  370  	if (buflen && *fpos < phdrs_offset + phdrs_len) {
37e949bd5293dd Omar Sandoval     2018-08-21  371  		struct elf_phdr *phdrs, *phdr;
^1da177e4c3f41 Linus Torvalds    2005-04-16  372  
37e949bd5293dd Omar Sandoval     2018-08-21  373  		phdrs = kzalloc(phdrs_len, GFP_KERNEL);
37e949bd5293dd Omar Sandoval     2018-08-21  374  		if (!phdrs) {
37e949bd5293dd Omar Sandoval     2018-08-21  375  			ret = -ENOMEM;
37e949bd5293dd Omar Sandoval     2018-08-21  376  			goto out;
37e949bd5293dd Omar Sandoval     2018-08-21  377  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  378  
37e949bd5293dd Omar Sandoval     2018-08-21  379  		phdrs[0].p_type = PT_NOTE;
37e949bd5293dd Omar Sandoval     2018-08-21  380  		phdrs[0].p_offset = notes_offset;
37e949bd5293dd Omar Sandoval     2018-08-21  381  		phdrs[0].p_filesz = notes_len;
^1da177e4c3f41 Linus Torvalds    2005-04-16  382  
37e949bd5293dd Omar Sandoval     2018-08-21  383  		phdr = &phdrs[1];
2ef43ec772551e KAMEZAWA Hiroyuki 2009-09-22  384  		list_for_each_entry(m, &kclist_head, list) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  385  			phdr->p_type = PT_LOAD;
^1da177e4c3f41 Linus Torvalds    2005-04-16  386  			phdr->p_flags = PF_R | PF_W | PF_X;
37e949bd5293dd Omar Sandoval     2018-08-21  387  			phdr->p_offset = kc_vaddr_to_offset(m->addr) + data_offset;
^1da177e4c3f41 Linus Torvalds    2005-04-16  388  			phdr->p_vaddr = (size_t)m->addr;
3c36b419b111e2 David Hildenbrand 2021-06-30  389  			if (m->type == KCORE_RAM)
464920104bf7ad Pratyush Anand    2017-02-27  390  				phdr->p_paddr = __pa(m->addr);
df865e8337c397 James Morse       2018-08-21  391  			else if (m->type == KCORE_TEXT)
df865e8337c397 James Morse       2018-08-21  392  				phdr->p_paddr = __pa_symbol(m->addr);
464920104bf7ad Pratyush Anand    2017-02-27  393  			else
464920104bf7ad Pratyush Anand    2017-02-27  394  				phdr->p_paddr = (elf_addr_t)-1;
^1da177e4c3f41 Linus Torvalds    2005-04-16  395  			phdr->p_filesz = phdr->p_memsz = m->size;
^1da177e4c3f41 Linus Torvalds    2005-04-16  396  			phdr->p_align = PAGE_SIZE;
37e949bd5293dd Omar Sandoval     2018-08-21  397  			phdr++;
^1da177e4c3f41 Linus Torvalds    2005-04-16  398  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  399  
37e949bd5293dd Omar Sandoval     2018-08-21  400  		tsz = min_t(size_t, buflen, phdrs_offset + phdrs_len - *fpos);
37e949bd5293dd Omar Sandoval     2018-08-21  401  		if (copy_to_user(buffer, (char *)phdrs + *fpos - phdrs_offset,
37e949bd5293dd Omar Sandoval     2018-08-21  402  				 tsz)) {
37e949bd5293dd Omar Sandoval     2018-08-21  403  			kfree(phdrs);
37e949bd5293dd Omar Sandoval     2018-08-21  404  			ret = -EFAULT;
3673fb08db7334 Omar Sandoval     2018-08-21  405  			goto out;
37e949bd5293dd Omar Sandoval     2018-08-21  406  		}
37e949bd5293dd Omar Sandoval     2018-08-21  407  		kfree(phdrs);
37e949bd5293dd Omar Sandoval     2018-08-21  408  
37e949bd5293dd Omar Sandoval     2018-08-21  409  		buffer += tsz;
37e949bd5293dd Omar Sandoval     2018-08-21  410  		buflen -= tsz;
37e949bd5293dd Omar Sandoval     2018-08-21  411  		*fpos += tsz;
37e949bd5293dd Omar Sandoval     2018-08-21  412  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  413  
37e949bd5293dd Omar Sandoval     2018-08-21  414  	/* ELF note segment. */
37e949bd5293dd Omar Sandoval     2018-08-21  415  	if (buflen && *fpos < notes_offset + notes_len) {
37e949bd5293dd Omar Sandoval     2018-08-21  416  		struct elf_prstatus prstatus = {};
37e949bd5293dd Omar Sandoval     2018-08-21  417  		struct elf_prpsinfo prpsinfo = {
37e949bd5293dd Omar Sandoval     2018-08-21  418  			.pr_sname = 'R',
37e949bd5293dd Omar Sandoval     2018-08-21  419  			.pr_fname = "vmlinux",
37e949bd5293dd Omar Sandoval     2018-08-21  420  		};
37e949bd5293dd Omar Sandoval     2018-08-21  421  		char *notes;
37e949bd5293dd Omar Sandoval     2018-08-21  422  		size_t i = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  423  
37e949bd5293dd Omar Sandoval     2018-08-21  424  		strlcpy(prpsinfo.pr_psargs, saved_command_line,
37e949bd5293dd Omar Sandoval     2018-08-21  425  			sizeof(prpsinfo.pr_psargs));
^1da177e4c3f41 Linus Torvalds    2005-04-16  426  
37e949bd5293dd Omar Sandoval     2018-08-21  427  		notes = kzalloc(notes_len, GFP_KERNEL);
37e949bd5293dd Omar Sandoval     2018-08-21  428  		if (!notes) {
3673fb08db7334 Omar Sandoval     2018-08-21  429  			ret = -ENOMEM;
3673fb08db7334 Omar Sandoval     2018-08-21  430  			goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  431  		}
37e949bd5293dd Omar Sandoval     2018-08-21  432  
37e949bd5293dd Omar Sandoval     2018-08-21  433  		append_kcore_note(notes, &i, CORE_STR, NT_PRSTATUS, &prstatus,
37e949bd5293dd Omar Sandoval     2018-08-21  434  				  sizeof(prstatus));
37e949bd5293dd Omar Sandoval     2018-08-21  435  		append_kcore_note(notes, &i, CORE_STR, NT_PRPSINFO, &prpsinfo,
37e949bd5293dd Omar Sandoval     2018-08-21  436  				  sizeof(prpsinfo));
37e949bd5293dd Omar Sandoval     2018-08-21  437  		append_kcore_note(notes, &i, CORE_STR, NT_TASKSTRUCT, current,
37e949bd5293dd Omar Sandoval     2018-08-21  438  				  arch_task_struct_size);
23c85094fe1895 Omar Sandoval     2018-08-21  439  		/*
23c85094fe1895 Omar Sandoval     2018-08-21  440  		 * vmcoreinfo_size is mostly constant after init time, but it
23c85094fe1895 Omar Sandoval     2018-08-21  441  		 * can be changed by crash_save_vmcoreinfo(). Racing here with a
23c85094fe1895 Omar Sandoval     2018-08-21  442  		 * panic on another CPU before the machine goes down is insanely
23c85094fe1895 Omar Sandoval     2018-08-21  443  		 * unlikely, but it's better to not leave potential buffer
23c85094fe1895 Omar Sandoval     2018-08-21  444  		 * overflows lying around, regardless.
23c85094fe1895 Omar Sandoval     2018-08-21  445  		 */
23c85094fe1895 Omar Sandoval     2018-08-21  446  		append_kcore_note(notes, &i, VMCOREINFO_NOTE_NAME, 0,
23c85094fe1895 Omar Sandoval     2018-08-21  447  				  vmcoreinfo_data,
23c85094fe1895 Omar Sandoval     2018-08-21  448  				  min(vmcoreinfo_size, notes_len - i));
37e949bd5293dd Omar Sandoval     2018-08-21  449  
37e949bd5293dd Omar Sandoval     2018-08-21  450  		tsz = min_t(size_t, buflen, notes_offset + notes_len - *fpos);
37e949bd5293dd Omar Sandoval     2018-08-21  451  		if (copy_to_user(buffer, notes + *fpos - notes_offset, tsz)) {
37e949bd5293dd Omar Sandoval     2018-08-21  452  			kfree(notes);
3673fb08db7334 Omar Sandoval     2018-08-21  453  			ret = -EFAULT;
3673fb08db7334 Omar Sandoval     2018-08-21  454  			goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  455  		}
37e949bd5293dd Omar Sandoval     2018-08-21  456  		kfree(notes);
37e949bd5293dd Omar Sandoval     2018-08-21  457  
37e949bd5293dd Omar Sandoval     2018-08-21  458  		buffer += tsz;
^1da177e4c3f41 Linus Torvalds    2005-04-16  459  		buflen -= tsz;
^1da177e4c3f41 Linus Torvalds    2005-04-16  460  		*fpos += tsz;
3673fb08db7334 Omar Sandoval     2018-08-21  461  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  462  
^1da177e4c3f41 Linus Torvalds    2005-04-16  463  	/*
^1da177e4c3f41 Linus Torvalds    2005-04-16  464  	 * Check to see if our file offset matches with any of
^1da177e4c3f41 Linus Torvalds    2005-04-16  465  	 * the addresses in the elf_phdr on our list.
^1da177e4c3f41 Linus Torvalds    2005-04-16  466  	 */
37e949bd5293dd Omar Sandoval     2018-08-21  467  	start = kc_offset_to_vaddr(*fpos - data_offset);
^1da177e4c3f41 Linus Torvalds    2005-04-16  468  	if ((tsz = (PAGE_SIZE - (start & ~PAGE_MASK))) > buflen)
^1da177e4c3f41 Linus Torvalds    2005-04-16  469  		tsz = buflen;
^1da177e4c3f41 Linus Torvalds    2005-04-16  470  
bf991c2231117d Omar Sandoval     2018-08-21  471  	m = NULL;
^1da177e4c3f41 Linus Torvalds    2005-04-16  472  	while (buflen) {
0daa322b8ff94d David Hildenbrand 2021-06-30  473  		struct page *page;
0daa322b8ff94d David Hildenbrand 2021-06-30  474  		unsigned long pfn;
0daa322b8ff94d David Hildenbrand 2021-06-30  475  
bf991c2231117d Omar Sandoval     2018-08-21  476  		/*
bf991c2231117d Omar Sandoval     2018-08-21  477  		 * If this is the first iteration or the address is not within
bf991c2231117d Omar Sandoval     2018-08-21  478  		 * the previous entry, search for a matching entry.
bf991c2231117d Omar Sandoval     2018-08-21  479  		 */
bf991c2231117d Omar Sandoval     2018-08-21  480  		if (!m || start < m->addr || start >= m->addr + m->size) {
04d168c6d42d17 Jakob Koschel     2022-04-29  481  			struct kcore_list *iter;
04d168c6d42d17 Jakob Koschel     2022-04-29  482  
04d168c6d42d17 Jakob Koschel     2022-04-29  483  			m = NULL;
04d168c6d42d17 Jakob Koschel     2022-04-29  484  			list_for_each_entry(iter, &kclist_head, list) {
04d168c6d42d17 Jakob Koschel     2022-04-29  485  				if (start >= iter->addr &&
04d168c6d42d17 Jakob Koschel     2022-04-29  486  				    start < iter->addr + iter->size) {
04d168c6d42d17 Jakob Koschel     2022-04-29  487  					m = iter;
^1da177e4c3f41 Linus Torvalds    2005-04-16  488  					break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  489  				}
bf991c2231117d Omar Sandoval     2018-08-21  490  			}
04d168c6d42d17 Jakob Koschel     2022-04-29  491  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  492  
c6d9eee2a68619 David Hildenbrand 2021-06-30 @493  		if (page_offline_frozen++ % MAX_ORDER_NR_PAGES == 0) {
c6d9eee2a68619 David Hildenbrand 2021-06-30  494  			page_offline_thaw();
c6d9eee2a68619 David Hildenbrand 2021-06-30  495  			cond_resched();
c6d9eee2a68619 David Hildenbrand 2021-06-30  496  			page_offline_freeze();
c6d9eee2a68619 David Hildenbrand 2021-06-30  497  		}
c6d9eee2a68619 David Hildenbrand 2021-06-30  498  
04d168c6d42d17 Jakob Koschel     2022-04-29  499  		if (!m) {
3673fb08db7334 Omar Sandoval     2018-08-21  500  			if (clear_user(buffer, tsz)) {
3673fb08db7334 Omar Sandoval     2018-08-21  501  				ret = -EFAULT;
3673fb08db7334 Omar Sandoval     2018-08-21  502  				goto out;
3673fb08db7334 Omar Sandoval     2018-08-21  503  			}
2711032c64a9c1 David Hildenbrand 2021-06-30  504  			goto skip;
ffc8599aa9763f Kairui Song       2019-03-08  505  		}
2711032c64a9c1 David Hildenbrand 2021-06-30  506  
2711032c64a9c1 David Hildenbrand 2021-06-30  507  		switch (m->type) {
2711032c64a9c1 David Hildenbrand 2021-06-30  508  		case KCORE_VMALLOC:
f5beeb1851ea6f Jiri Olsa         2016-09-08  509  			vread(buf, (char *)start, tsz);
73d7c33e81aed9 KAMEZAWA Hiroyuki 2009-09-21  510  			/* we have to zero-fill user buffer even if no read */
3673fb08db7334 Omar Sandoval     2018-08-21  511  			if (copy_to_user(buffer, buf, tsz)) {
3673fb08db7334 Omar Sandoval     2018-08-21  512  				ret = -EFAULT;
3673fb08db7334 Omar Sandoval     2018-08-21  513  				goto out;
3673fb08db7334 Omar Sandoval     2018-08-21  514  			}
2711032c64a9c1 David Hildenbrand 2021-06-30  515  			break;
2711032c64a9c1 David Hildenbrand 2021-06-30  516  		case KCORE_USER:
595dd46ebfc10b Jia Zhang         2018-02-12  517  			/* User page is handled prior to normal kernel page: */
3673fb08db7334 Omar Sandoval     2018-08-21  518  			if (copy_to_user(buffer, (char *)start, tsz)) {
3673fb08db7334 Omar Sandoval     2018-08-21  519  				ret = -EFAULT;
3673fb08db7334 Omar Sandoval     2018-08-21  520  				goto out;
3673fb08db7334 Omar Sandoval     2018-08-21  521  			}
2711032c64a9c1 David Hildenbrand 2021-06-30  522  			break;
2711032c64a9c1 David Hildenbrand 2021-06-30  523  		case KCORE_RAM:
0daa322b8ff94d David Hildenbrand 2021-06-30  524  			pfn = __pa(start) >> PAGE_SHIFT;
0daa322b8ff94d David Hildenbrand 2021-06-30  525  			page = pfn_to_online_page(pfn);
0daa322b8ff94d David Hildenbrand 2021-06-30  526  
0daa322b8ff94d David Hildenbrand 2021-06-30  527  			/*
0daa322b8ff94d David Hildenbrand 2021-06-30  528  			 * Don't read offline sections, logically offline pages
0daa322b8ff94d David Hildenbrand 2021-06-30  529  			 * (e.g., inflated in a balloon), hwpoisoned pages,
0daa322b8ff94d David Hildenbrand 2021-06-30  530  			 * and explicitly excluded physical ranges.
0daa322b8ff94d David Hildenbrand 2021-06-30  531  			 */
0daa322b8ff94d David Hildenbrand 2021-06-30  532  			if (!page || PageOffline(page) ||
0daa322b8ff94d David Hildenbrand 2021-06-30  533  			    is_page_hwpoison(page) || !pfn_is_ram(pfn)) {
2711032c64a9c1 David Hildenbrand 2021-06-30  534  				if (clear_user(buffer, tsz)) {
2711032c64a9c1 David Hildenbrand 2021-06-30  535  					ret = -EFAULT;
2711032c64a9c1 David Hildenbrand 2021-06-30  536  					goto out;
2711032c64a9c1 David Hildenbrand 2021-06-30  537  				}
2711032c64a9c1 David Hildenbrand 2021-06-30  538  				break;
2711032c64a9c1 David Hildenbrand 2021-06-30  539  			}
2711032c64a9c1 David Hildenbrand 2021-06-30  540  			fallthrough;
2711032c64a9c1 David Hildenbrand 2021-06-30  541  		case KCORE_VMEMMAP:
2711032c64a9c1 David Hildenbrand 2021-06-30  542  		case KCORE_TEXT:
df04abfd181acc Jiri Olsa         2016-09-08  543  			/*
df04abfd181acc Jiri Olsa         2016-09-08  544  			 * Using bounce buffer to bypass the
df04abfd181acc Jiri Olsa         2016-09-08  545  			 * hardened user copy kernel text checks.
df04abfd181acc Jiri Olsa         2016-09-08  546  			 */
e025ab842ec352 Kefeng Wang       2022-10-18  547  			if (copy_from_kernel_nofault(buf, (void *)start, tsz)) {
3673fb08db7334 Omar Sandoval     2018-08-21  548  				if (clear_user(buffer, tsz)) {
3673fb08db7334 Omar Sandoval     2018-08-21  549  					ret = -EFAULT;
3673fb08db7334 Omar Sandoval     2018-08-21  550  					goto out;
3673fb08db7334 Omar Sandoval     2018-08-21  551  				}
d0290bc20d4739 Heiko Carstens    2018-02-06  552  			} else {
3673fb08db7334 Omar Sandoval     2018-08-21  553  				if (copy_to_user(buffer, buf, tsz)) {
3673fb08db7334 Omar Sandoval     2018-08-21  554  					ret = -EFAULT;
3673fb08db7334 Omar Sandoval     2018-08-21  555  					goto out;
3673fb08db7334 Omar Sandoval     2018-08-21  556  				}
^1da177e4c3f41 Linus Torvalds    2005-04-16  557  			}
2711032c64a9c1 David Hildenbrand 2021-06-30  558  			break;
2711032c64a9c1 David Hildenbrand 2021-06-30  559  		default:
2711032c64a9c1 David Hildenbrand 2021-06-30  560  			pr_warn_once("Unhandled KCORE type: %d\n", m->type);
2711032c64a9c1 David Hildenbrand 2021-06-30  561  			if (clear_user(buffer, tsz)) {
2711032c64a9c1 David Hildenbrand 2021-06-30  562  				ret = -EFAULT;
2711032c64a9c1 David Hildenbrand 2021-06-30  563  				goto out;
2711032c64a9c1 David Hildenbrand 2021-06-30  564  			}
^1da177e4c3f41 Linus Torvalds    2005-04-16  565  		}
2711032c64a9c1 David Hildenbrand 2021-06-30  566  skip:
^1da177e4c3f41 Linus Torvalds    2005-04-16  567  		buflen -= tsz;
^1da177e4c3f41 Linus Torvalds    2005-04-16  568  		*fpos += tsz;
^1da177e4c3f41 Linus Torvalds    2005-04-16  569  		buffer += tsz;
^1da177e4c3f41 Linus Torvalds    2005-04-16  570  		start += tsz;
^1da177e4c3f41 Linus Torvalds    2005-04-16  571  		tsz = (buflen > PAGE_SIZE ? PAGE_SIZE : buflen);
^1da177e4c3f41 Linus Torvalds    2005-04-16  572  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  573  
3673fb08db7334 Omar Sandoval     2018-08-21  574  out:
c6d9eee2a68619 David Hildenbrand 2021-06-30  575  	page_offline_thaw();
3673fb08db7334 Omar Sandoval     2018-08-21  576  	up_read(&kclist_lock);
3673fb08db7334 Omar Sandoval     2018-08-21  577  	if (ret)
3673fb08db7334 Omar Sandoval     2018-08-21  578  		return ret;
3673fb08db7334 Omar Sandoval     2018-08-21  579  	return orig_buflen - buflen;
^1da177e4c3f41 Linus Torvalds    2005-04-16  580  }
97ce5d6dcb07c4 Alexey Dobriyan   2008-10-06  581  

:::::: The code at line 493 was first introduced by commit
:::::: c6d9eee2a68619b5ba1c25e406a9403f33b56902 fs/proc/kcore: use page_offline_(freeze|thaw)

:::::: TO: David Hildenbrand <david@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
