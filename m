Received: from mgamail.intel.com (unknown [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018B714014;
	Fri, 28 Jul 2023 16:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690563288; x=1722099288;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UcPNiDg4mNn3CH6vqOvTClyrgsKY8TKeNgZt6wm6XLs=;
  b=DAnV/N6YgCWXmI5RA8ioof8zo7d/i5/fuu4S7kIsVNEnKA1n93cf+bNF
   kxV9OGPtM6RPLlp2DNU5bCQHW5b+l46IOgZayuyzF3mT3PmXWwiue+odH
   1kArEsLpe2T3EcVrYUfJ0tqaA/E3J1ZShuIJrYE15iHceORVDj0vXSWLJ
   5clkCcR7t3waEV1ynHSXW4dyUm8ja772H+gVYZ0+EKVzNo6e1VV1Z4BiC
   kRdn57gJRCjiJk+Ejvwztl8tdWrd3xhVOOuGRVuP7bFtMHCBKeD88jehL
   J+jtVk4bf5HyZ8+iHDKtsNSyt8ug62QbgYQKYXrG1eX0FHwg7gouKOy+Y
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="434921552"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; 
   d="scan'208";a="434921552"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 09:54:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="797485343"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; 
   d="scan'208";a="797485343"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 28 Jul 2023 09:54:46 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPQjl-0003P0-2A;
	Fri, 28 Jul 2023 16:54:45 +0000
Date: Sat, 29 Jul 2023 00:54:21 +0800
From: kernel test robot <lkp@intel.com>
To: Xiaoguang Xing <xiaoguang.xing@sophgo.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [csky-linux:sg2042-master-qspinlock-64ilp32_v3 15/70]
 arch/riscv/kernel/image_kexec.c:210:13: warning: converting the result of
 '<<' to a boolean always evaluates to false
Message-ID: <202307290010.uWeGd7UV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/c-sky/csky-linux sg2042-master-qspinlock-64ilp32_v3
head:   ac5eb96728dec4876b1b7ecbb2ed9064a8151171
commit: 2bb12b43ee7b79381279d53c1fb92bb72f2ddc47 [15/70] riscv: kernel: kexec: Add image loader of kexec file support
config: riscv-randconfig-r042-20230728 (https://download.01.org/0day-ci/archive/20230729/202307290010.uWeGd7UV-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230729/202307290010.uWeGd7UV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307290010.uWeGd7UV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/kernel/image_kexec.c:210:13: warning: converting the result of '<<' to a boolean always evaluates to false [-Wtautological-constant-compare]
     210 |         be_image = __HEAD_FLAG(BE);
         |                    ^
   arch/riscv/include/asm/image.h:21:49: note: expanded from macro '__HEAD_FLAG'
      21 | #define __HEAD_FLAG(field)      (__HEAD_FLAG_##field << \
         |                                                      ^
>> arch/riscv/kernel/image_kexec.c:196:6: warning: variable 'flags' set but not used [-Wunused-but-set-variable]
     196 |         u64 flags;
         |             ^
   2 warnings generated.


vim +210 arch/riscv/kernel/image_kexec.c

   189	
   190	static void *image_load(struct kimage *image,
   191					char *kernel, unsigned long kernel_len,
   192					char *initrd, unsigned long initrd_len,
   193					char *cmdline, unsigned long cmdline_len)
   194	{
   195		struct riscv_image_header *h;
 > 196		u64 flags;
   197		bool be_image, be_kernel;
   198		struct kexec_buf kbuf;
   199		unsigned long text_offset, kernel_segment_number;
   200		unsigned long kernel_start;
   201		struct kexec_segment *kernel_segment;
   202		int ret;
   203	
   204		h = (struct riscv_image_header *)kernel;
   205		if (!h->image_size)
   206			return ERR_PTR(-EINVAL);
   207	
   208		/* Check cpu features */
   209		flags = le64_to_cpu(h->flags);
 > 210		be_image = __HEAD_FLAG(BE);
   211		be_kernel = IS_ENABLED(CONFIG_CPU_BIG_ENDIAN);
   212		if (be_image != be_kernel)
   213			return ERR_PTR(-EINVAL);
   214	
   215		/* Load the kernel */
   216		kbuf.image = image;
   217		kbuf.buf_min = 0;
   218		kbuf.buf_max = ULONG_MAX;
   219		kbuf.top_down = false;
   220	
   221		kbuf.buffer = kernel;
   222		kbuf.bufsz = kernel_len;
   223		kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
   224		kbuf.memsz = le64_to_cpu(h->image_size);
   225		text_offset = le64_to_cpu(h->text_offset);
   226		kbuf.buf_align = PAGE_SIZE;
   227	
   228		/* Adjust kernel segment with TEXT_OFFSET */
   229		kbuf.memsz += text_offset;
   230	
   231		kernel_segment_number = image->nr_segments;
   232	
   233		/*
   234		 * The location of the kernel segment may make it impossible to satisfy
   235		 * the other segment requirements, so we try repeatedly to find a
   236		 * location that will work.
   237		 */
   238		while ((ret = kexec_add_buffer(&kbuf)) == 0) {
   239			/* Try to load additional data */
   240			kernel_segment = &image->segment[kernel_segment_number];
   241			ret = load_other_segments(image, kernel_segment->mem,
   242						  kernel_segment->memsz, initrd,
   243						  initrd_len, cmdline);
   244			if (!ret)
   245				break;
   246	
   247			/*
   248			 * We couldn't find space for the other segments; erase the
   249			 * kernel segment and try the next available hole.
   250			 */
   251			image->nr_segments -= 1;
   252			kbuf.buf_min = kernel_segment->mem + kernel_segment->memsz;
   253			kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
   254		}
   255	
   256		if (ret) {
   257			pr_err("Could not find any suitable kernel location!");
   258			return ERR_PTR(ret);
   259		}
   260	
   261		kernel_segment = &image->segment[kernel_segment_number];
   262		kernel_segment->mem += text_offset;
   263		kernel_segment->memsz -= text_offset;
   264		kernel_start = kernel_segment->mem;
   265		image->start = kernel_start;
   266	
   267	
   268		pr_debug("Loaded kernel at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
   269					kernel_segment->mem, kbuf.bufsz,
   270					kernel_segment->memsz);
   271	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
