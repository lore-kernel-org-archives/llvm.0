Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4F61BB23;
	Wed,  9 Aug 2023 15:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691596419; x=1723132419;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bsQ9ZjckG22Zhho+1DpkMyvju/+w9wud73wEEEKzQ7U=;
  b=HwWSgmVG4mxEeiE+rtP8nAMJJOjmbwdY0vBE8RQ7WPBXom3yImXxCURX
   kAEUo2/YOZWApyNJIMjCJvjoVRZKAZWI9A4ivwVJ0ihJplyAtIqJlOSJy
   BkuGzoegrCsumnkAtSqY7Uxr6O5HK5eyS6jiDCvbU9jpfJ1MmGL6+st1X
   tTq3inglFTrYUgYx494rUz8bzVaxQVUQC143ftSUSeAWSWmXReKddpOKb
   rDTEFLLunXX+yFWjBxFrvfb2TE5t9Y9uGQgUVSmKfQv7QPow0lH4Lb3BM
   GkbqQgU48nmXP4YUoDCFNKV1LzVi/MmugLl1zAI/Kc4md5bqXSGo44uEz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="371148225"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="371148225"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 08:53:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="821910146"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="821910146"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 09 Aug 2023 08:53:37 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTlVA-0006DC-2F;
	Wed, 09 Aug 2023 15:53:36 +0000
Date: Wed, 9 Aug 2023 23:53:34 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/virt-to-phys-kfence 2/2] mm/kfence/core.c:111:13:
 error: redefinition of '__kfence_pool' with a different type: 'const void *'
 vs 'char *'
Message-ID: <202308092347.Y1oLTk1z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/virt-to-phys-kfence
head:   1d8567fb084df07151b6dbf6337f7e909b3576f3
commit: 1d8567fb084df07151b6dbf6337f7e909b3576f3 [2/2] kfence: Use a const void * for page pool
config: riscv-randconfig-r042-20230809 (https://download.01.org/0day-ci/archive/20230809/202308092347.Y1oLTk1z-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308092347.Y1oLTk1z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308092347.Y1oLTk1z-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/kfence/core.c:111:13: error: redefinition of '__kfence_pool' with a different type: 'const void *' vs 'char *'
   const void *__kfence_pool __read_mostly;
               ^
   include/linux/kfence.h:28:14: note: previous declaration is here
   extern char *__kfence_pool;
                ^
   1 error generated.


vim +111 mm/kfence/core.c

   109	
   110	/* The pool of pages used for guard pages and objects. */
 > 111	const void *__kfence_pool __read_mostly;
   112	EXPORT_SYMBOL(__kfence_pool); /* Export for test modules. */
   113	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
