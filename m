Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA6A28E5
	for <llvm@lists.linux.dev>; Thu, 17 Feb 2022 23:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645142049; x=1676678049;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=92Ff743k9f5xb7UqMnuVpZi3B3e1//FHbyHUAo9IICU=;
  b=RlDiAg1U5KMnHxrN+z4TS+4dsN6lIix6U8Zm2YA6T4jJR/THlzR8SEws
   jKjKCw/hff21cFvJqWpWDYXDSqJHAi4clqKJu55iBNQmGz0263QOb2LGr
   16BMs1AdKr3euqrNCXd7tYzglXhiHHmVHRe1FXn7EZ22qdrLM4ZBPAimL
   /KQQ+ENSukPkEa2eyg9ut1Nvj6oEIIJ8dIdscGUVf4kyQtFajhLBUPbAF
   XbsqpiTD9GQjgppEEmDDKJTctGERsjVt2pxUKgNUcUaM1tY6h7Y+51TcP
   QzIl+K3TjppaRrQubKDDqYt4E+1+4MMgZezZu3RCX4ye42jV92QQYJcZe
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="238410477"
X-IronPort-AV: E=Sophos;i="5.88,377,1635231600"; 
   d="scan'208";a="238410477"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2022 15:54:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,377,1635231600"; 
   d="scan'208";a="775019261"
Received: from lkp-server01.sh.intel.com (HELO 6f05bf9e3301) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 17 Feb 2022 15:54:07 -0800
Received: from kbuild by 6f05bf9e3301 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nKqb8-0000kq-KC; Thu, 17 Feb 2022 23:54:06 +0000
Date: Fri, 18 Feb 2022 07:53:30 +0800
From: kernel test robot <lkp@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>,
	Intel GFX <intel-gfx@lists.freedesktop.org>,
	DRI Devel <dri-devel@lists.freedesktop.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Chris Wilson <chris@chris-wilson.co.uk>,
	Matthew Auld <matthew.auld@intel.com>
Subject: Re: [Intel-gfx] [PATCH v5 5/7] drm/i915/gt: Create per-tile RC6
 sysfs interface
Message-ID: <202202180713.xhySMQW4-lkp@intel.com>
References: <20220217144158.21555-6-andi.shyti@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220217144158.21555-6-andi.shyti@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Andi,

I love your patch! Yet something to improve:

[auto build test ERROR on drm-tip/drm-tip]
[cannot apply to drm-intel/for-linux-next drm-exynos/exynos-drm-next drm/drm-next tegra-drm/drm/tegra/for-next airlied/drm-next v5.17-rc4 next-20220217]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Andi-Shyti/Introduce-multitile-support/20220217-224547
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: i386-randconfig-a004 (https://download.01.org/0day-ci/archive/20220218/202202180713.xhySMQW4-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/b358d991c154dc27fa4ef2fc99f8819f4f3e97e7
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Andi-Shyti/Introduce-multitile-support/20220217-224547
        git checkout b358d991c154dc27fa4ef2fc99f8819f4f3e97e7
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __divdi3
   >>> referenced by intel_gt_sysfs_pm.c:35 (drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c:35)
   >>>               gpu/drm/i915/gt/intel_gt_sysfs_pm.o:(rc6_residency_ms_show) in archive drivers/built-in.a
   >>> referenced by intel_gt_sysfs_pm.c:35 (drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c:35)
   >>>               gpu/drm/i915/gt/intel_gt_sysfs_pm.o:(rc6p_residency_ms_show) in archive drivers/built-in.a
   >>> referenced by intel_gt_sysfs_pm.c:35 (drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c:35)
   >>>               gpu/drm/i915/gt/intel_gt_sysfs_pm.o:(rc6pp_residency_ms_show) in archive drivers/built-in.a
   >>> referenced 1 more times

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
