Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC502C9C
	for <llvm@lists.linux.dev>; Fri, 17 Dec 2021 12:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639743314; x=1671279314;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WaZLnIsliWvdIOqFBG7CzikYKTfNgwGDsX9roA6gPyA=;
  b=gnoLcCV8QD/+FUN/YLQet0+5ZtLkuUll8i4BNYnx4IgXc6vwWeeV6VEY
   ADxXf+x3Uc26P1XPbrBt318oLZvg45sblmjip5oYeYF4kuTKhx4uooXIC
   ZRq7/o49gqz4ro1+TQux2xk+RbR1csYqldYAF17W8Y1EjaLAS3sc11o7v
   +OjF6W778pZY+dir6TBdnfIpGH6qxICmjqNcpkxVadymTODsb91+fkM/h
   YeBTInRd7tVvaXfoSAFAIbZQWRbBw8KTEnFj3tOiNvAHqXJpwzRKaguoA
   pF0h+wrNcIfthYpzg1hmCwOJGkfO5xB6sewAV46cFwWvTlCMmSj9P03BJ
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="227029442"
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="227029442"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2021 04:15:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="506744738"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 17 Dec 2021 04:15:12 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1myC8l-0004iQ-G2; Fri, 17 Dec 2021 12:15:11 +0000
Date: Fri, 17 Dec 2021 20:14:50 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	matthew.auld@intel.com
Subject: Re: [Intel-gfx] [PATCH v2 6/7] drm/i915: Use vma resources for async
 unbinding
Message-ID: <202112172015.HCePn2cg-lkp@intel.com>
References: <20211217091929.105781-7-thomas.hellstrom@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211217091929.105781-7-thomas.hellstrom@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi "Thomas,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]
[also build test WARNING on next-20211216]
[cannot apply to drm-exynos/exynos-drm-next drm/drm-next drm-intel/for-linux-next tegra-drm/drm/tegra/for-next airlied/drm-next v5.16-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Thomas-Hellstr-m/drm-i915-Asynchronous-vma-unbinding/20211217-172108
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: i386-randconfig-r021-20211216 (https://download.01.org/0day-ci/archive/20211217/202112172015.HCePn2cg-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 9043c3d65b11b442226015acfbf8167684586cfa)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/45f1249183a30dea38defee195b33c7f6753d9f9
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Thomas-Hellstr-m/drm-i915-Asynchronous-vma-unbinding/20211217-172108
        git checkout 45f1249183a30dea38defee195b33c7f6753d9f9
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/i915_vma_resource.c:379:39: warning: format specifies type 'unsigned long' but the argument has type 'unsigned int' [-Wformat]
           pr_err("vma resource size is %lu\n", sizeof(struct i915_vma_resource));
                                        ~~~     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                        %u
   include/linux/printk.h:493:33: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
                                  ~~~     ^~~~~~~~~~~
   include/linux/printk.h:450:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:422:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   1 warning generated.


vim +379 drivers/gpu/drm/i915/i915_vma_resource.c

   376	
   377	int __init i915_vma_resource_module_init(void)
   378	{
 > 379		pr_err("vma resource size is %lu\n", sizeof(struct i915_vma_resource));

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
