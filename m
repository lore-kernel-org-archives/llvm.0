Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E423D92
	for <llvm@lists.linux.dev>; Wed, 14 Sep 2022 20:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663188807; x=1694724807;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7DBM3Yji4SL5idOfVZ3ewESqqXGWpH+jZ/P3/hL9KTc=;
  b=NLJ6nzRN7B9/x10t9XW4HdMCcyYWCPov6nHuoPltNjJRzM1Y0e/DHr4t
   Ikx4VIV3zVIBHKbfJt+fE5jugow2W1a21hnMlcekh3JwvwAfOf9fZgtBO
   rTeSBcIVhM42vT/Dez7/OKoLRAW+ikHWOm6GMKvP0ToiDAzwi5YtjZrMs
   FRVnWDrAlFu76mOBmkRbjnxrb2bL1iudy8No0U6aNXM0dDVlh9GIF7T4C
   /uhqY6aPLyeRO95Y8jn7ewgqIEgm4KpF7Gi7Ny9Tg2F9HtuhG9ucK7RQv
   7B2qfZy7yPG3YOO3ratxgKkphonMix0KScTZzs9SqDGofj2qt7MxdQGEg
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10470"; a="299351940"
X-IronPort-AV: E=Sophos;i="5.93,315,1654585200"; 
   d="scan'208";a="299351940"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2022 13:53:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,315,1654585200"; 
   d="scan'208";a="706088098"
Received: from lkp-server01.sh.intel.com (HELO d6e6b7c4e5a2) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Sep 2022 13:53:02 -0700
Received: from kbuild by d6e6b7c4e5a2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oYZNV-0000ZG-2o;
	Wed, 14 Sep 2022 20:53:01 +0000
Date: Thu, 15 Sep 2022 04:52:32 +0800
From: kernel test robot <lkp@intel.com>
To: Li Zhengyu <lizhengyu3@huawei.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
Subject: arch/riscv/kernel/elf_kexec.c:185:16: warning: variable
 'kernel_start' set but not used
Message-ID: <202209150433.tPPMQhEf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3245cb65fd91cd514801bf91f5a3066d562f0ac4
commit: 838b3e28488f702e2b5477b393f009b2639d2b1a RISC-V: Load purgatory in kexec_file
date:   4 months ago
config: riscv-randconfig-r016-20220914 (https://download.01.org/0day-ci/archive/20220915/202209150433.tPPMQhEf-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 1546df49f5a6d09df78f569e4137ddb365a3e827)
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
https://01.org/lkp
