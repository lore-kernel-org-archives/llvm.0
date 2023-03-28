Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EAF107BB;
	Tue, 28 Mar 2023 20:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680036025; x=1711572025;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1I+lgLkRuGkMqQh0iIvFxs6ISFB+fwJO3PwKosPcFWU=;
  b=THwxgnr5XpF6UGdlViUe1DqSvkXvFV/iP6h6ttLTyb+0OAZ8jz2x36jc
   aQhbJuYvwHQpzxgQ1q83+rwST0ogcEx0Vi/3aKhN91uXSx73YoRuM5IIl
   +PsR4ScZ1TOUeBIuvrRcbsIgCmLtzGX9N0VD8lxZ0Dx2KoYsnyykdBqmR
   hKk5lSkID5bt4Fg/JAPo+Dg4J6F+U+nd7v+zCg2Ll/D54hi1KO+j/3APc
   4j/kTTaoDb9e7y+oB4s621VwnUzjgnQtGKauUFcVFCWph3+lDLVPq6TIh
   J2M0pjmq3et5YX07Xpn4sqrfTFgJ+jhTiDS4ZpsCA9BrTVedYhTRZSwYi
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="426959637"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="426959637"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 13:40:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="748530841"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="748530841"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 28 Mar 2023 13:40:21 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phG7A-000It7-2Y;
	Tue, 28 Mar 2023 20:40:20 +0000
Date: Wed, 29 Mar 2023 04:40:18 +0800
From: kernel test robot <lkp@intel.com>
To: Li Zhengyu <lizhengyu3@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
Subject: arch/riscv/kernel/elf_kexec.c:185:16: warning: variable
 'kernel_start' set but not used
Message-ID: <202303290418.XvYFwNe4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Li,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3a93e40326c8f470e71d20b4c42d36767450f38f
commit: 838b3e28488f702e2b5477b393f009b2639d2b1a RISC-V: Load purgatory in kexec_file
date:   10 months ago
config: riscv-randconfig-r042-20230329 (https://download.01.org/0day-ci/archive/20230329/202303290418.XvYFwNe4-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303290418.XvYFwNe4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/kernel/elf_kexec.c:185:16: warning: variable 'kernel_start' set but not used [-Wunused-but-set-variable]
           unsigned long kernel_start;
                         ^
   1 warning generated.


vim +/kernel_start +185 arch/riscv/kernel/elf_kexec.c

   174	
   175	static void *elf_kexec_load(struct kimage *image, char *kernel_buf,
   176				    unsigned long kernel_len, char *initrd,
   177				    unsigned long initrd_len, char *cmdline,
   178				    unsigned long cmdline_len)
   179	{
   180		int ret;
   181		unsigned long old_kernel_pbase = ULONG_MAX;
   182		unsigned long new_kernel_pbase = 0UL;
   183		unsigned long initrd_pbase = 0UL;
   184		unsigned long headers_sz;
 > 185		unsigned long kernel_start;
   186		void *fdt, *headers;
   187		struct elfhdr ehdr;
   188		struct kexec_buf kbuf;
   189		struct kexec_elf_info elf_info;
   190		char *modified_cmdline = NULL;
   191	
   192		ret = kexec_build_elf_info(kernel_buf, kernel_len, &ehdr, &elf_info);
   193		if (ret)
   194			return ERR_PTR(ret);
   195	
   196		ret = elf_find_pbase(image, kernel_len, &ehdr, &elf_info,
   197				     &old_kernel_pbase, &new_kernel_pbase);
   198		if (ret)
   199			goto out;
   200		kernel_start = image->start;
   201		pr_notice("The entry point of kernel at 0x%lx\n", image->start);
   202	
   203		/* Add the kernel binary to the image */
   204		ret = riscv_kexec_elf_load(image, &ehdr, &elf_info,
   205					   old_kernel_pbase, new_kernel_pbase);
   206		if (ret)
   207			goto out;
   208	
   209		kbuf.image = image;
   210		kbuf.buf_min = new_kernel_pbase + kernel_len;
   211		kbuf.buf_max = ULONG_MAX;
   212	
   213		/* Add elfcorehdr */
   214		if (image->type == KEXEC_TYPE_CRASH) {
   215			ret = prepare_elf_headers(&headers, &headers_sz);
   216			if (ret) {
   217				pr_err("Preparing elf core header failed\n");
   218				goto out;
   219			}
   220	
   221			kbuf.buffer = headers;
   222			kbuf.bufsz = headers_sz;
   223			kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
   224			kbuf.memsz = headers_sz;
   225			kbuf.buf_align = ELF_CORE_HEADER_ALIGN;
   226			kbuf.top_down = true;
   227	
   228			ret = kexec_add_buffer(&kbuf);
   229			if (ret) {
   230				vfree(headers);
   231				goto out;
   232			}
   233			image->elf_headers = headers;
   234			image->elf_load_addr = kbuf.mem;
   235			image->elf_headers_sz = headers_sz;
   236	
   237			pr_debug("Loaded elf core header at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
   238				 image->elf_load_addr, kbuf.bufsz, kbuf.memsz);
   239	
   240			/* Setup cmdline for kdump kernel case */
   241			modified_cmdline = setup_kdump_cmdline(image, cmdline,
   242							       cmdline_len);
   243			if (!modified_cmdline) {
   244				pr_err("Setting up cmdline for kdump kernel failed\n");
   245				ret = -EINVAL;
   246				goto out;
   247			}
   248			cmdline = modified_cmdline;
   249		}
   250	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
