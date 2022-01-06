Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87D32C80
	for <llvm@lists.linux.dev>; Thu,  6 Jan 2022 16:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641485550; x=1673021550;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9JXO+IuxaWJ49L3OCkdbNBIBBqHkK4rRwg7pnXayHxA=;
  b=JGifet/o/GKlAC/4bD49Jt9It3BifBXzEOD8h127T9j07sWyojvKoQor
   DI6dsunxmuQkiwZejPt38lG43S7PLr61LgId1WUODsY7qZYfizeUXe3Mi
   OK0VVJRu4c3FJXGecSCrjGnXTm6IXSTCEiVxfNCQIp31kgCDvrl+HzRtV
   FwwABVbnY7vTYbt35IqsuOW9fJH/uyRQz4l1IX7czg4OTduG7WLrMVPBU
   l1aKuprVJh/RaVkkaoATRx13H0VAKcnju3tpnIQH/8TDoicqsoAZ3aFHt
   YCQkdIvJ+D9k+PDhlsNsu7dB79330HqOlBt5dAPLzF1c8WDSZfyGzxMpk
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="222674861"
X-IronPort-AV: E=Sophos;i="5.88,267,1635231600"; 
   d="scan'208";a="222674861"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2022 08:06:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,267,1635231600"; 
   d="scan'208";a="513454472"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 06 Jan 2022 08:06:24 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n5VHT-000HmF-LO; Thu, 06 Jan 2022 16:06:23 +0000
Date: Fri, 7 Jan 2022 00:06:09 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v5 4/6] drm/i915: Use vma resources for async unbinding
Message-ID: <202201062355.yUX5doeJ-lkp@intel.com>
References: <20220104125132.35179-5-thomas.hellstrom@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220104125132.35179-5-thomas.hellstrom@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi "Thomas,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-tip/drm-tip drm/drm-next next-20220105]
[cannot apply to drm-exynos/exynos-drm-next tegra-drm/drm/tegra/for-next v5.16-rc8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Thomas-Hellstr-m/drm-i915-Asynchronous-vma-unbinding/20220104-205238
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
config: x86_64-buildonly-randconfig-r001-20220106 (https://download.01.org/0day-ci/archive/20220106/202201062355.yUX5doeJ-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project ca7ffe09dc6e525109e3cd570cc5182ce568be13)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/b23720e8418513dff7cf35e04fb5af41ffeea98f
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Thomas-Hellstr-m/drm-i915-Asynchronous-vma-unbinding/20220104-205238
        git checkout b23720e8418513dff7cf35e04fb5af41ffeea98f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/i915/ fs/nfs/ sound/x86/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/i915_vma_resource.c:262:25: warning: parameter 'end' set but not used [-Wunused-but-set-parameter]
                                        unsigned long *end)
                                                       ^
   1 warning generated.


vim +/end +262 drivers/gpu/drm/i915/i915_vma_resource.c

   258	
   259	static void
   260	i915_vma_resource_color_adjust_range(struct i915_address_space *vm,
   261					     unsigned long *start,
 > 262					     unsigned long *end)
   263	{
   264		if (i915_vm_has_cache_coloring(vm)) {
   265			if (start)
   266				start -= I915_GTT_PAGE_SIZE;
   267			end += I915_GTT_PAGE_SIZE;
   268		}
   269	}
   270	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
