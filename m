Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90E3648;
	Tue,  4 Apr 2023 05:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680585548; x=1712121548;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dbD2zuIbnHKqtf47u9gwxhoZVCQymgrOX9EDx70lyTs=;
  b=WNgGoakWQN02MkirwQbdi0xJfSggbk8aDixgdUojlkqc3IL7Qze2/6XP
   rnKSd7en8l0bfIu6g8auH5ucjOuQpZY17DkpuD7f+RR0I5zZiTfCxAdew
   qgAaW8uoGEUXZB2qujgMIY3Qii+QSwMkQSyCxwJvqOuJQdTbCZCss74z6
   Q6fhj3IQftK9CahSx1uujFOjhBi3GuAhJ0WF3tZH7wWha90fmhGfRhO4n
   jsyXOa1TrI945dbePuGDuel9FQ5+L/WNwJhmYwlDYGbeCQ+C3bdy4d7ow
   eyOItI1JkRY/K5+9ObvUXHZb1g6KcMbGXF/MhmypL5dwXCryhgT0xzI5P
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="342115161"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; 
   d="scan'208";a="342115161"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2023 22:19:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="829838812"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; 
   d="scan'208";a="829838812"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 03 Apr 2023 22:19:06 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjZ4T-000PE9-32;
	Tue, 04 Apr 2023 05:19:05 +0000
Date: Tue, 4 Apr 2023 13:18:52 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 08/10] dma-buf/dma-fence: Introduce long-running
 completion fences
Message-ID: <202304041357.LFldN2km-lkp@intel.com>
References: <20230404002211.3611376-9-matthew.brost@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230404002211.3611376-9-matthew.brost@intel.com>

Hi Matthew,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-tip/drm-tip]
[also build test WARNING on linus/master v6.3-rc5 next-20230403]
[cannot apply to drm-misc/drm-misc-next drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Brost/drm-sched-Convert-drm-scheduler-to-use-a-work-queue-rather-than-kthread/20230404-082438
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230404002211.3611376-9-matthew.brost%40intel.com
patch subject: [RFC PATCH 08/10] dma-buf/dma-fence: Introduce long-running completion fences
config: i386-randconfig-a001-20230403 (https://download.01.org/0day-ci/archive/20230404/202304041357.LFldN2km-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/94ca4354f6c367597cebe876cbe493c8c0802dff
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Matthew-Brost/drm-sched-Convert-drm-scheduler-to-use-a-work-queue-rather-than-kthread/20230404-082438
        git checkout 94ca4354f6c367597cebe876cbe493c8c0802dff
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/dma-buf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304041357.LFldN2km-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma-buf/dma-fence.c:376: warning: expecting prototype for dma_fence_lr begin_signalling - begin a critical long(). Prototype was for dma_fence_lr_begin_signalling() instead


vim +376 drivers/dma-buf/dma-fence.c

   360	
   361	/**
   362	 * dma_fence_lr begin_signalling - begin a critical long-running DMA fence
   363	 * signalling section
   364	 *
   365	 * Drivers should use this to annotate the beginning of any code section
   366	 * required to eventually complete &dma_fence by calling dma_fence_signal().
   367	 *
   368	 * The end of these critical sections are annotated with
   369	 * dma_fence_lr_end_signalling(). Ideally the section should encompass all
   370	 * locks that are ever required to signal a long-running dma-fence.
   371	 *
   372	 * Return: An opaque cookie needed by the implementation, which needs to be
   373	 * passed to dma_fence_lr end_signalling().
   374	 */
   375	bool dma_fence_lr_begin_signalling(void)
 > 376	{
   377		return __dma_fence_begin_signalling(&dma_fence_lr_lockdep_map);
   378	}
   379	EXPORT_SYMBOL(dma_fence_lr_begin_signalling);
   380	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
