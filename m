Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9FACA4C;
	Thu, 14 Sep 2023 08:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694679185; x=1726215185;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0HuLFSOV1iee1YccL1q6ba1Qi+BrJA064NEgTIarkeA=;
  b=dWywPiy3LvKZ/LFTtRkaQCQtpH8j2wFOBZFD+ejf8e7T1KuZhUGo/YrB
   YdNPw2jT0nUyQn4PAdgF4bCDaI7CBYKoh/o86FfjeYBvvhOmvARAhz4lS
   pcL/SCekmP0k8EWGJnjej9YcydDM6SCcJxrDjEXwWgfAuloGEs18S5a3B
   +/5d64FlvAXzPa3lmHlFsrkvhcwMyf+SvkGCsXx5vlBczDNP7nGHNb9wf
   r4ZUXHY4+Yk/qnvXX7Ol7OrK2+/ok2nhBFZLwodSpFDagZUS/OuFkyc8p
   FEC3dMHxr7iY5nZQu1jfpPqQo4+QU/SNl8lXaibld+sJmKAG8nEl3kL7J
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="382693806"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="382693806"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 01:13:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="1075270812"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="1075270812"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 14 Sep 2023 01:13:01 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qghT9-0001MP-09;
	Thu, 14 Sep 2023 08:12:59 +0000
Date: Thu, 14 Sep 2023 16:12:41 +0800
From: kernel test robot <lkp@intel.com>
To: Baoquan He <bhe@redhat.com>, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	akpm@linux-foundation.org, thunder.leizhen@huawei.com,
	catalin.marinas@arm.com, chenjiahao16@huawei.com,
	kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, x86@kernel.org,
	Baoquan He <bhe@redhat.com>
Subject: Re: [PATCH v3 6/9] x86: kdump: use generic interface to simplify
 crashkernel reservation code
Message-ID: <202309141534.moH4dTcz-lkp@intel.com>
References: <20230914033142.676708-7-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230914033142.676708-7-bhe@redhat.com>

Hi Baoquan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes linus/master v6.6-rc1 next-20230914]
[cannot apply to arm64/for-next/core tip/x86/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Baoquan-He/crash_core-c-remove-unnecessary-parameter-of-function/20230914-113546
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20230914033142.676708-7-bhe%40redhat.com
patch subject: [PATCH v3 6/9] x86: kdump: use generic interface to simplify crashkernel reservation code
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20230914/202309141534.moH4dTcz-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230914/202309141534.moH4dTcz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309141534.moH4dTcz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/setup.c:476:15: warning: no previous prototype for function 'crash_low_size_default' [-Wmissing-prototypes]
   unsigned long crash_low_size_default(void)
                 ^
   arch/x86/kernel/setup.c:476:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   unsigned long crash_low_size_default(void)
   ^
   static 
   1 warning generated.


vim +/crash_low_size_default +476 arch/x86/kernel/setup.c

   472	
   473	/*
   474	 * --------- Crashkernel reservation ------------------------------
   475	 */
 > 476	unsigned long crash_low_size_default(void)
   477	{
   478	#ifdef CONFIG_X86_64
   479		return max(swiotlb_size_or_default() + (8UL << 20), 256UL << 20);
   480	#else
   481		return 0;
   482	#endif
   483	}
   484	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
