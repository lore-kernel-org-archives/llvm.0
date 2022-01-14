Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE25D2C82
	for <llvm@lists.linux.dev>; Fri, 14 Jan 2022 06:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642142610; x=1673678610;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C6gi/Lo3Wvj+j+/Qd+tWFYEYVfcNt7kby4wAhJCBil8=;
  b=R14FqASgm/3JLcUa+CZFRqz+KwEKnl9w2bFXTGgCdiTYdHQlm/NLg81e
   XI6RPUuo5Ujj6MpAvAyuahZb4dkze4m3QDNgsZlbhSSwZ1V0awl3/VGrL
   kBJqLnM+aBpcTpJXTa3ZYjPwByTXQvHik3RwRDAru3oIVTRASOH9TEZj0
   EGLHx7GhEbQLKP2DEegsmwVvgMDT+eqAl0iSLOLaohU+g57wewXSHvuRy
   uQIL2tpURQAPWEKm/gJV4TFSvwiMzCYQKL8tf/MoTEfjbJxtykOAPc+PI
   lMX5SdQxLasnOslkLqUpQMssejgFdUVO47CePX8U68NC2QLTRqkdrnl2I
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10226"; a="231543120"
X-IronPort-AV: E=Sophos;i="5.88,287,1635231600"; 
   d="scan'208";a="231543120"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2022 22:43:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,287,1635231600"; 
   d="scan'208";a="577202093"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 13 Jan 2022 22:43:28 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n8GJ6-0008Ct-6s; Fri, 14 Jan 2022 06:43:28 +0000
Date: Fri, 14 Jan 2022 14:42:52 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [jens-wiklander-tee:testing/tuxbuild 6/13]
 drivers/tee/tee_shm.c:52:17: warning: no previous prototype for function
 'shm_alloc_helper'
Message-ID: <202201141435.ogrNv2hr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   http://git.linaro.org/people/jens.wiklander/linux-tee testing/tuxbuild
head:   9ea0d125d4c9a4144b8641c454e97406b483722d
commit: b056eac4e504db8ee3fb03b4d13f1c9f2653bee8 [6/13] tee: replace tee_shm_alloc()
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20220114/202201141435.ogrNv2hr-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 82c8aca93488730ce8f66101e0f3538f14b551dd)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add jens-wiklander-tee http://git.linaro.org/people/jens.wiklander/linux-tee
        git fetch --no-tags jens-wiklander-tee testing/tuxbuild
        git checkout b056eac4e504db8ee3fb03b4d13f1c9f2653bee8
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/tee/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/tee/tee_shm.c:52:17: warning: no previous prototype for function 'shm_alloc_helper' [-Wmissing-prototypes]
   struct tee_shm *shm_alloc_helper(struct tee_context *ctx, size_t size,
                   ^
   drivers/tee/tee_shm.c:52:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct tee_shm *shm_alloc_helper(struct tee_context *ctx, size_t size,
   ^
   static 
   1 warning generated.


vim +/shm_alloc_helper +52 drivers/tee/tee_shm.c

    51	
  > 52	struct tee_shm *shm_alloc_helper(struct tee_context *ctx, size_t size,
    53					 size_t align, u32 flags, int id)
    54	{
    55		struct tee_device *teedev = ctx->teedev;
    56		struct tee_shm *shm;
    57		void *ret;
    58		int rc;
    59	
    60		if (!tee_device_get(teedev))
    61			return ERR_PTR(-EINVAL);
    62	
    63		if (!teedev->pool) {
    64			/* teedev has been detached from driver */
    65			ret = ERR_PTR(-EINVAL);
    66			goto err_dev_put;
    67		}
    68	
    69		shm = kzalloc(sizeof(*shm), GFP_KERNEL);
    70		if (!shm) {
    71			ret = ERR_PTR(-ENOMEM);
    72			goto err_dev_put;
    73		}
    74	
    75		refcount_set(&shm->refcount, 1);
    76		shm->flags = flags;
    77		shm->id = id;
    78	
    79		/*
    80		 * We're assigning this as it is needed if the shm is to be
    81		 * registered. If this function returns OK then the caller expected
    82		 * to call teedev_ctx_get() or clear shm->ctx in case it's not
    83		 * needed any longer.
    84		 */
    85		shm->ctx = ctx;
    86	
    87		rc = teedev->pool->ops->alloc(teedev->pool, shm, size, align);
    88		if (rc) {
    89			ret = ERR_PTR(rc);
    90			goto err_kfree;
    91		}
    92	
    93		teedev_ctx_get(ctx);
    94		return shm;
    95	err_kfree:
    96		kfree(shm);
    97	err_dev_put:
    98		tee_device_put(teedev);
    99		return ret;
   100	}
   101	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
