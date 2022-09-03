Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9671184C
	for <llvm@lists.linux.dev>; Sat,  3 Sep 2022 03:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662175784; x=1693711784;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lu7uqy3BIdVbnqSZInPRA6M1umJkF2qJpSRRzmoip7Y=;
  b=SO+JqLcFHpB1ubbXLGMgmo5OJPxxVVm8IWhk4aYZH/WVhPUHrYoI6uGe
   dExe2qspDDqSg7Dbijuii9+7ubCiwTKR9o5FAwxP/SDdpNORTPa2mhSp7
   Y7QpWJw1f7OAVwReKnBGaIhaW/naBPbaYRguCpaMT3imsKXIQMDq4Y/ca
   q0Q1kLldx3gN8sPobAJJ9rF01s5r46N4e1/lmA53EaiXu6iL6U2o1i34D
   obAL5PXCDRydEfmINQ0FLbvJxgXUFXJzT6S4BKoDi+rssCqueO0lsEo/w
   k8GvNHBWisbY0bCur6wf9qxyQ+I0dmOKb9qZRuJEt3r4UeOFO0HEhTxPC
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10458"; a="322289836"
X-IronPort-AV: E=Sophos;i="5.93,286,1654585200"; 
   d="scan'208";a="322289836"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2022 20:29:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,286,1654585200"; 
   d="scan'208";a="590299414"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 02 Sep 2022 20:29:42 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oUJqn-0000xy-2V;
	Sat, 03 Sep 2022 03:29:41 +0000
Date: Sat, 3 Sep 2022 11:29:37 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v2 11/12] drm/i915/mtl: Use primary GT's irq lock for
 media GT
Message-ID: <202209031159.LqrZ3DkE-lkp@intel.com>
References: <20220902233257.3088492-12-matthew.d.roper@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220902233257.3088492-12-matthew.d.roper@intel.com>

Hi Matt,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Matt-Roper/i915-Add-standalone-media-support-for-MTL/20220903-073602
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: i386-randconfig-a011 (https://download.01.org/0day-ci/archive/20220903/202209031159.LqrZ3DkE-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/0c50809816566e24ec98f3d90fcc3acb502f58df
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Matt-Roper/i915-Add-standalone-media-support-for-MTL/20220903-073602
        git checkout 0c50809816566e24ec98f3d90fcc3acb502f58df
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c:50:16: error: incompatible pointer types passing 'spinlock_t **' (aka 'struct spinlock **') to parameter of type 'spinlock_t *' (aka 'struct spinlock *'); remove & [-Werror,-Wincompatible-pointer-types]
           spin_lock_irq(&gt->irq_lock);
                         ^~~~~~~~~~~~~
   include/linux/spinlock.h:372:55: note: passing argument to parameter 'lock' here
   static __always_inline void spin_lock_irq(spinlock_t *lock)
                                                         ^
   drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c:52:18: error: incompatible pointer types passing 'spinlock_t **' (aka 'struct spinlock **') to parameter of type 'spinlock_t *' (aka 'struct spinlock *'); remove & [-Werror,-Wincompatible-pointer-types]
           spin_unlock_irq(&gt->irq_lock);
                           ^~~~~~~~~~~~~
   include/linux/spinlock.h:397:57: note: passing argument to parameter 'lock' here
   static __always_inline void spin_unlock_irq(spinlock_t *lock)
                                                           ^
   2 errors generated.


vim +50 drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c

390cf1b28b1119 Daniele Ceraolo Spurio 2021-09-24  40  
390cf1b28b1119 Daniele Ceraolo Spurio 2021-09-24  41  static int pxp_terminate_set(void *data, u64 val)
390cf1b28b1119 Daniele Ceraolo Spurio 2021-09-24  42  {
390cf1b28b1119 Daniele Ceraolo Spurio 2021-09-24  43  	struct intel_pxp *pxp = data;
390cf1b28b1119 Daniele Ceraolo Spurio 2021-09-24  44  	struct intel_gt *gt = pxp_to_gt(pxp);
390cf1b28b1119 Daniele Ceraolo Spurio 2021-09-24  45  
390cf1b28b1119 Daniele Ceraolo Spurio 2021-09-24  46  	if (!intel_pxp_is_active(pxp))
390cf1b28b1119 Daniele Ceraolo Spurio 2021-09-24  47  		return -ENODEV;
390cf1b28b1119 Daniele Ceraolo Spurio 2021-09-24  48  
390cf1b28b1119 Daniele Ceraolo Spurio 2021-09-24  49  	/* simulate a termination interrupt */
390cf1b28b1119 Daniele Ceraolo Spurio 2021-09-24 @50  	spin_lock_irq(&gt->irq_lock);
390cf1b28b1119 Daniele Ceraolo Spurio 2021-09-24  51  	intel_pxp_irq_handler(pxp, GEN12_DISPLAY_PXP_STATE_TERMINATED_INTERRUPT);
390cf1b28b1119 Daniele Ceraolo Spurio 2021-09-24  52  	spin_unlock_irq(&gt->irq_lock);
390cf1b28b1119 Daniele Ceraolo Spurio 2021-09-24  53  
390cf1b28b1119 Daniele Ceraolo Spurio 2021-09-24  54  	if (!wait_for_completion_timeout(&pxp->termination,
390cf1b28b1119 Daniele Ceraolo Spurio 2021-09-24  55  					 msecs_to_jiffies(100)))
390cf1b28b1119 Daniele Ceraolo Spurio 2021-09-24  56  		return -ETIMEDOUT;
390cf1b28b1119 Daniele Ceraolo Spurio 2021-09-24  57  
390cf1b28b1119 Daniele Ceraolo Spurio 2021-09-24  58  	return 0;
390cf1b28b1119 Daniele Ceraolo Spurio 2021-09-24  59  }
390cf1b28b1119 Daniele Ceraolo Spurio 2021-09-24  60  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
