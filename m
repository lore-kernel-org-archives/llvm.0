Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A250A2F2E
	for <llvm@lists.linux.dev>; Tue,  8 Feb 2022 03:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644292331; x=1675828331;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gni8ZAnSjS2QQ6jPRCIKsoiZCM6QkQtCXQebf87OVz0=;
  b=FtkxOUHTW6VErWiVzM/BBJQVU8nar5Lc+1Bjdqz57bqo0qLHAJgoqZif
   7jbsmdfYdn0XAE3KnuNNIatdpMJubG0mNoMrLZYV+0B0gAmUXQXaQDe+x
   9PnIbf8rkMSZJu7DlRRtvXZixuRWDS72zqv5umkM2EEfRN8CWMimLTO5Q
   B6cYr/2uHrssh7XNzbx6ixKK+FtdNLkI0os7rITmFYN+lX1cTTZUmasfx
   XZ8WQddPmvbfOHoinjw6mikHS121iNRLP82itktQizgS6ZXHzJqGA9T2w
   oWaj+6RnberSXCoNd2hhpRiWLSYogJuBVGZ6dv7Cdcdsx2wByxrjFVHbE
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="232432728"
X-IronPort-AV: E=Sophos;i="5.88,351,1635231600"; 
   d="scan'208";a="232432728"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2022 19:52:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,351,1635231600"; 
   d="scan'208";a="484669090"
Received: from lkp-server01.sh.intel.com (HELO 9dd77a123018) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 07 Feb 2022 19:52:09 -0800
Received: from kbuild by 9dd77a123018 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nHHY0-0001JL-DI; Tue, 08 Feb 2022 03:52:08 +0000
Date: Tue, 8 Feb 2022 11:51:21 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Cheng <michael.cheng@intel.com>,
	intel-gfx@lists.freedesktop.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, michael.cheng@intel.com,
	lucas.demarchi@intel.com, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v6 6/6] drm: Add arch arm64 for
 drm_clflush_virt_range
Message-ID: <202202081151.wYD1tE4p-lkp@intel.com>
References: <20220207201127.648624-7-michael.cheng@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220207201127.648624-7-michael.cheng@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Michael,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on drm-tip/drm-tip drm/drm-next v5.17-rc3 next-20220207]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Michael-Cheng/Use-drm_clflush-instead-of-clflush/20220208-041326
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
config: arm64-randconfig-r005-20220207 (https://download.01.org/0day-ci/archive/20220208/202202081151.wYD1tE4p-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0d8850ae2cae85d49bea6ae0799fa41c7202c05c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/0day-ci/linux/commit/f2fb6ade1531d88b046e245e8b854a7422a05a14
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Michael-Cheng/Use-drm_clflush-instead-of-clflush/20220208-041326
        git checkout f2fb6ade1531d88b046e245e8b854a7422a05a14
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/drm_cache.c:182:25: error: passing 'void' to parameter of incompatible type 'unsigned long'
           flush_tlb_kernel_range(*addr, *end);
                                  ^~~~~
   arch/arm64/include/asm/tlbflush.h:374:57: note: passing argument to parameter 'start' here
   static inline void flush_tlb_kernel_range(unsigned long start, unsigned long end)
                                                           ^
   1 error generated.


vim +182 drivers/gpu/drm/drm_cache.c

   151	
   152	/**
   153	 * drm_clflush_virt_range - Flush dcache lines of a region
   154	 * @addr: Initial kernel memory address.
   155	 * @length: Region size.
   156	 *
   157	 * Flush every data cache line entry that points to an address in the
   158	 * region requested.
   159	 */
   160	void
   161	drm_clflush_virt_range(void *addr, unsigned long length)
   162	{
   163	#if defined(CONFIG_X86)
   164		if (static_cpu_has(X86_FEATURE_CLFLUSH)) {
   165			const int size = boot_cpu_data.x86_clflush_size;
   166			void *end = addr + length;
   167	
   168			addr = (void *)(((unsigned long)addr) & -size);
   169			mb(); /*CLFLUSH is only ordered with a full memory barrier*/
   170			for (; addr < end; addr += size)
   171				clflushopt(addr);
   172			clflushopt(end - 1); /* force serialisation */
   173			mb(); /*Ensure that every data cache line entry is flushed*/
   174			return;
   175		}
   176	
   177		if (wbinvd_on_all_cpus())
   178			pr_err("Timed out waiting for cache flush\n");
   179	
   180	#elif defined(CONFIG_ARM64)
   181		void *end = addr + length;
 > 182		flush_tlb_kernel_range(*addr, *end);
   183	#else
   184		pr_err("Architecture has no drm_cache.c support\n");
   185		WARN_ON_ONCE(1);
   186	#endif
   187	}
   188	EXPORT_SYMBOL(drm_clflush_virt_range);
   189	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
