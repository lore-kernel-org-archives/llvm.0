Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6FEA40
	for <llvm@lists.linux.dev>; Sat, 10 Sep 2022 07:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662795954; x=1694331954;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=di/QmJTwOxCIfR9NFz4X3qRdKBz/nSnObDZHw/nY4W8=;
  b=EIkGBmknv43Cufjkcx4fCJu6vcJMIlyHUaMFqcV+efFWM9k9b7MAnDet
   SCLID/1wLuHktfYPJrO/ogQkuDKm81KfTLc9HOEYtXXI+bB9VqbCOmj3k
   4yPAwMJLB2Ati5eYJdQpTpDe0pJZhL15pRSP6YZnkbXps8ywq4bdX8bzf
   kh1WxZp1hMDLJazo/Pl7KDjqXNtKh7irL8YjgVUD093nGc+OuxcAznBjc
   nW0kX4sWRRW2FV06ss3QJMkMhmA6W2NAkBOcHiGKOMkH0Y3e+VPbB7IYm
   Oku5/S5oH8KnGtmM5OYHMyJlO7HBrjY5Fj5mR1dOM3ojXMjYjMq9G9UPW
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10465"; a="284639529"
X-IronPort-AV: E=Sophos;i="5.93,305,1654585200"; 
   d="scan'208";a="284639529"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2022 00:45:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,305,1654585200"; 
   d="scan'208";a="566617400"
Received: from lkp-server02.sh.intel.com (HELO b2938d2e5c5a) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 10 Sep 2022 00:45:45 -0700
Received: from kbuild by b2938d2e5c5a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oWvBQ-0002HB-22;
	Sat, 10 Sep 2022 07:45:44 +0000
Date: Sat, 10 Sep 2022 15:45:21 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH 4/5] drm/cma-helper: account memory used by CMA GEM
 objects
Message-ID: <202209101522.Gwz622bL-lkp@intel.com>
References: <20220909111640.3789791-5-l.stach@pengutronix.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220909111640.3789791-5-l.stach@pengutronix.de>

Hi Lucas,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on linus/master v6.0-rc4]
[cannot apply to drm-misc/drm-misc-next drm-tip/drm-tip next-20220909]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lucas-Stach/GEM-buffer-memory-tracking/20220909-191905
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20220910/202209101522.Gwz622bL-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/64fc0f845f1a46d1e6959261d778b809f30b5a72
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Lucas-Stach/GEM-buffer-memory-tracking/20220909-191905
        git checkout 64fc0f845f1a46d1e6959261d778b809f30b5a72
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/drm_gem.c:1299:36: error: expected ';' after top-level asm block
   EXPORT_SYMBOL(drm_gem_add_resident)
                                      ^
                                      ;
   drivers/gpu/drm/drm_gem.c:1318:36: error: expected ';' after top-level asm block
   EXPORT_SYMBOL(drm_gem_dec_resident)
                                      ^
                                      ;
   2 errors generated.


vim +1299 drivers/gpu/drm/drm_gem.c

612ea51433e720 Lucas Stach 2022-09-09  1282  
612ea51433e720 Lucas Stach 2022-09-09  1283  /**
612ea51433e720 Lucas Stach 2022-09-09  1284   * drm_gem_add_resident - Account memory used by GEM object to the
612ea51433e720 Lucas Stach 2022-09-09  1285   * task which called drm_gem_object_init(). Call when the pages are
612ea51433e720 Lucas Stach 2022-09-09  1286   * made resident in system memory, i.e. pinned for GPU usage.
612ea51433e720 Lucas Stach 2022-09-09  1287   *
612ea51433e720 Lucas Stach 2022-09-09  1288   * @obj: GEM buffer object
612ea51433e720 Lucas Stach 2022-09-09  1289   */
612ea51433e720 Lucas Stach 2022-09-09  1290  void drm_gem_add_resident(struct drm_gem_object *obj)
612ea51433e720 Lucas Stach 2022-09-09  1291  {
612ea51433e720 Lucas Stach 2022-09-09  1292  	if (!mmget_not_zero(obj->mm))
612ea51433e720 Lucas Stach 2022-09-09  1293  		return;
612ea51433e720 Lucas Stach 2022-09-09  1294  
612ea51433e720 Lucas Stach 2022-09-09  1295  	add_mm_counter(obj->mm, MM_DRIVERPAGES, obj->size / PAGE_SIZE);
612ea51433e720 Lucas Stach 2022-09-09  1296  
612ea51433e720 Lucas Stach 2022-09-09  1297  	mmput(obj->mm);
612ea51433e720 Lucas Stach 2022-09-09  1298  }
612ea51433e720 Lucas Stach 2022-09-09 @1299  EXPORT_SYMBOL(drm_gem_add_resident)
612ea51433e720 Lucas Stach 2022-09-09  1300  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
