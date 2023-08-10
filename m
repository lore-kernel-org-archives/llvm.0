Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BBC1877;
	Thu, 10 Aug 2023 23:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691709745; x=1723245745;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w1NqH99URcvZijFhz1+HJ654z8iqcpWy/gy0gDsKpls=;
  b=daskoEqh54/aEaUfNe3XedHFFv7SLNqz314chDVgmvPwUvv/LPbZ8XDs
   Rw+B/RoZ3Y5WtpRHN9SoCPn892WaHjvt5PsUfYb6sT23V5uXfvGfwbu+J
   1juvuwjAnkhK64f70unOtrhQE5UTtDNEOHl2uZiV+6+hIAmQ7oMFjJg26
   hmTWOCEqLK8xCHQ/UcNfR3nCZT1D8lKoi83+yLdY81fOYGJgurLKwIN/u
   t2mXp1w8tzpzmzsSq/VLZClLNwwz5ZJFA/TEgfDh2Zlxhx4apQ6EMw8U1
   RT6lf+v4kpb5Ek7lKQ54/DcvekMumMNfTwT2si3fVxgYlPKnZTzKtFLdX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="361682644"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="361682644"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2023 16:22:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="856083755"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="856083755"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 10 Aug 2023 16:22:23 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUEz0-0007Jc-1L;
	Thu, 10 Aug 2023 23:22:22 +0000
Date: Fri, 11 Aug 2023 07:22:09 +0800
From: kernel test robot <lkp@intel.com>
To: Li Lingfeng <lilingfeng3@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jens Axboe <axboe@kernel.dk>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>
Subject: [axboe-block:for-6.6/block 43/44] block/blk-iolatency.c:849:2:
 error: member reference type 'struct mutex' is not a pointer; did you mean
 to use '.'?
Message-ID: <202308110738.mCDvdKZ1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-6.6/block
head:   d21fed50c523d87af6456697ad09378060c4f09a
commit: 4eb44d10766ac0fae5973998fd2a0103df1d3fe1 [43/44] block: remove init_mutex and open-code blk_iolatency_try_init
config: x86_64-randconfig-x002-20230810 (https://download.01.org/0day-ci/archive/20230811/202308110738.mCDvdKZ1-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230811/202308110738.mCDvdKZ1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308110738.mCDvdKZ1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> block/blk-iolatency.c:849:2: error: member reference type 'struct mutex' is not a pointer; did you mean to use '.'?
           lockdep_assert_held(ctx.bdev->bd_queue->rq_qos_mutex);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:324:17: note: expanded from macro 'lockdep_assert_held'
           lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
           ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:291:52: note: expanded from macro 'lockdep_is_held'
   #define lockdep_is_held(lock)           lock_is_held(&(lock)->dep_map)
                                                               ^
   include/linux/lockdep.h:318:32: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   include/asm-generic/bug.h:123:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on = !!(condition);                              \
                                  ^~~~~~~~~
>> block/blk-iolatency.c:849:2: error: cannot take the address of an rvalue of type 'struct lockdep_map'
           lockdep_assert_held(ctx.bdev->bd_queue->rq_qos_mutex);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:324:17: note: expanded from macro 'lockdep_assert_held'
           lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
           ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:291:45: note: expanded from macro 'lockdep_is_held'
   #define lockdep_is_held(lock)           lock_is_held(&(lock)->dep_map)
                                                        ^
   include/linux/lockdep.h:318:32: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   include/asm-generic/bug.h:123:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on = !!(condition);                              \
                                  ^~~~~~~~~
   2 errors generated.


vim +849 block/blk-iolatency.c

   826	
   827	static ssize_t iolatency_set_limit(struct kernfs_open_file *of, char *buf,
   828				     size_t nbytes, loff_t off)
   829	{
   830		struct blkcg *blkcg = css_to_blkcg(of_css(of));
   831		struct blkcg_gq *blkg;
   832		struct blkg_conf_ctx ctx;
   833		struct iolatency_grp *iolat;
   834		char *p, *tok;
   835		u64 lat_val = 0;
   836		u64 oldval;
   837		int ret;
   838	
   839		blkg_conf_init(&ctx, buf);
   840	
   841		ret = blkg_conf_open_bdev(&ctx);
   842		if (ret)
   843			goto out;
   844	
   845		/*
   846		 * blk_iolatency_init() may fail after rq_qos_add() succeeds which can
   847		 * confuse iolat_rq_qos() test. Make the test and init atomic.
   848		 */
 > 849		lockdep_assert_held(ctx.bdev->bd_queue->rq_qos_mutex);
   850		if (!iolat_rq_qos(ctx.bdev->bd_queue))
   851			ret = blk_iolatency_init(ctx.bdev->bd_disk);
   852		if (ret)
   853			goto out;
   854	
   855		ret = blkg_conf_prep(blkcg, &blkcg_policy_iolatency, &ctx);
   856		if (ret)
   857			goto out;
   858	
   859		iolat = blkg_to_lat(ctx.blkg);
   860		p = ctx.body;
   861	
   862		ret = -EINVAL;
   863		while ((tok = strsep(&p, " "))) {
   864			char key[16];
   865			char val[21];	/* 18446744073709551616 */
   866	
   867			if (sscanf(tok, "%15[^=]=%20s", key, val) != 2)
   868				goto out;
   869	
   870			if (!strcmp(key, "target")) {
   871				u64 v;
   872	
   873				if (!strcmp(val, "max"))
   874					lat_val = 0;
   875				else if (sscanf(val, "%llu", &v) == 1)
   876					lat_val = v * NSEC_PER_USEC;
   877				else
   878					goto out;
   879			} else {
   880				goto out;
   881			}
   882		}
   883	
   884		/* Walk up the tree to see if our new val is lower than it should be. */
   885		blkg = ctx.blkg;
   886		oldval = iolat->min_lat_nsec;
   887	
   888		iolatency_set_min_lat_nsec(blkg, lat_val);
   889		if (oldval != iolat->min_lat_nsec)
   890			iolatency_clear_scaling(blkg);
   891		ret = 0;
   892	out:
   893		blkg_conf_exit(&ctx);
   894		return ret ?: nbytes;
   895	}
   896	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
