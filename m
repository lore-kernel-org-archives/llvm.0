Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60E6A40
	for <llvm@lists.linux.dev>; Sat, 10 Sep 2022 07:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662794151; x=1694330151;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/l+UCnGmEMRoDwjikMDd948lQiWZabXOgkpKQeE47WA=;
  b=jP3+BRpMh8w42TPZGal59zlAqa30GqBGSH95VWDyACcgO0b3hzLjiqFi
   VdpoqjNSl+T5JUE4v7rJXIGNpQoEmf5hTJX4C269vbkctvYvCcJZyy/Z3
   9lkZYt5pOucg2A9ipjNvBBLNmCQKrVNzijpi/JzqVbbuLBQQNiN9khk8t
   0x+fEU4SSHjaZYXPU6OQ6YRoMinXIAt9zPXjm48hqzS8TwVsN8ZJ+ljrs
   sHQfqswnY/qi+DNJQNLFlhz+gslUZZINkq9IxwWKlhfLEy8OzAVwgJRjr
   Ji0TQ/C37AToHnQZ1DYthEIYbYBoLxfV8nRKwWOh9F8hhRbhQepOgMSDN
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10465"; a="297622180"
X-IronPort-AV: E=Sophos;i="5.93,305,1654585200"; 
   d="scan'208";a="297622180"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2022 00:15:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,305,1654585200"; 
   d="scan'208";a="648691174"
Received: from lkp-server02.sh.intel.com (HELO b2938d2e5c5a) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 10 Sep 2022 00:15:44 -0700
Received: from kbuild by b2938d2e5c5a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oWuiO-0002Fr-0F;
	Sat, 10 Sep 2022 07:15:44 +0000
Date: Sat, 10 Sep 2022 15:14:44 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH 3/5] drm/gem: add functions to account GEM object
 memory usage
Message-ID: <202209101513.gIE9BRws-lkp@intel.com>
References: <20220909111640.3789791-4-l.stach@pengutronix.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220909111640.3789791-4-l.stach@pengutronix.de>

Hi Lucas,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on drm-tip/drm-tip linus/master v6.0-rc4]
[cannot apply to drm-misc/drm-misc-next next-20220909]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lucas-Stach/GEM-buffer-memory-tracking/20220909-191905
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
config: x86_64-randconfig-a001 (https://download.01.org/0day-ci/archive/20220910/202209101513.gIE9BRws-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/612ea51433e7200c5da52be11b4b777133fbffdc
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Lucas-Stach/GEM-buffer-memory-tracking/20220909-191905
        git checkout 612ea51433e7200c5da52be11b4b777133fbffdc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/

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

  1282	
  1283	/**
  1284	 * drm_gem_add_resident - Account memory used by GEM object to the
  1285	 * task which called drm_gem_object_init(). Call when the pages are
  1286	 * made resident in system memory, i.e. pinned for GPU usage.
  1287	 *
  1288	 * @obj: GEM buffer object
  1289	 */
  1290	void drm_gem_add_resident(struct drm_gem_object *obj)
  1291	{
  1292		if (!mmget_not_zero(obj->mm))
  1293			return;
  1294	
  1295		add_mm_counter(obj->mm, MM_DRIVERPAGES, obj->size / PAGE_SIZE);
  1296	
  1297		mmput(obj->mm);
  1298	}
> 1299	EXPORT_SYMBOL(drm_gem_add_resident)
  1300	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
