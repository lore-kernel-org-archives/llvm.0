Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17B3156678;
	Wed, 29 Jan 2025 16:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738166961; cv=none; b=oKeSVq43Hgrw45nBAtULQhRnfp8pWU94DE3aa5Q1aH384MDVwETI17V1snVhJNMwyPmM8C19gjeIwrkKD7ugJ93Qs14STi9OvPNP2zgWSyVXvyGVpZxa/kGd78k01sNyxgp9nJG7rQ32iGDx3u+JaHucmUsKJisHoJAmj5+/pS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738166961; c=relaxed/simple;
	bh=IH4J4LuKiaJPMrOS3CAsX80u/mR7BdI4hHwd/FUmGEc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RsU13h2yfeAwI2RT8qF19JbDSAzbRjN7s3qNvG07CUpwaLsw8HW3rIWh4oXZVdkBnu7ELA4+11z/PUBl/9I25u6PafLKz2AVAsDkjTbx5VtV61r/Q4GNqK1FYiVKCQDFLHFCdbTEzb0rjbhI6zTi75uDrhJbONRGwZU90ayxWGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OsiptbKW; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OsiptbKW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738166959; x=1769702959;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IH4J4LuKiaJPMrOS3CAsX80u/mR7BdI4hHwd/FUmGEc=;
  b=OsiptbKWj/4suptH9Tw3LQAxOSDv0dQaG5Is1b8zjogigM41ZPAC/fMx
   pJNbHtYl2NK8wT/RRaWScRhvmXJz+46CRfgpoXqD4+7SlLaiPdPGR7sg2
   0Qwm6eY8UNNVozBnTMOVM7NY6ktSn0FW5Y/cTIfnH9aLa9Qkt6H7PQvXE
   tZ3Hkveaj5ZVWMtJzXKNTqvcR+dxzApP05G4F6JXo3hdrfkxkeSQL0SQn
   4v3DaXvKClj7/nsohOeoV+GuLKKgTV/Nv/fUkFjDciH2FnA5mbKwe070c
   jyMUziizJ1vVddeEf0xCcwIgFK/fCik892eWdJr61WGaYUFSr0SrJZNXO
   w==;
X-CSE-ConnectionGUID: hDS42hYlT/KDGB8CfdfdOA==
X-CSE-MsgGUID: zg2aNaApSyWoMCVU3I4epw==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="42347506"
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; 
   d="scan'208";a="42347506"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 08:09:18 -0800
X-CSE-ConnectionGUID: zpN3vyJrS0eS/3jq13evqg==
X-CSE-MsgGUID: QZyXq/4MSz+UZ7s8ClRH6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; 
   d="scan'208";a="108887983"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 29 Jan 2025 08:09:16 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdAcs-000j6E-0g;
	Wed, 29 Jan 2025 16:09:14 +0000
Date: Thu, 30 Jan 2025 00:08:39 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 60/63] mm/damon/core.c:1339:16: warning: variable
 'nr_regions' set but not used
Message-ID: <202501300041.usRaByZc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   db09358b42a2d75f76c297d9eedceeb9786c96fd
commit: dcd0807d5a93d6e7b64f63de86de810f55a19bfb [60/63] mm/damon: intervals tuning parameters refactoring
config: s390-randconfig-001-20250129 (https://download.01.org/0day-ci/archive/20250130/202501300041.usRaByZc-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 19306351a2c45e266fa11b41eb1362b20b6ca56d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250130/202501300041.usRaByZc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501300041.usRaByZc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/damon/core.c:1351:65: warning: more '%' conversions than data arguments [-Wformat-insufficient-args]
    1351 |         pr_info("access_samples %lu/%lu, score_bp %lu, adaptation bp %lu\n",
         |                                                                      ~~^
   include/linux/printk.h:574:26: note: expanded from macro 'pr_info'
     574 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                                 ^~~
   mm/damon/core.c:8:31: note: expanded from macro 'pr_fmt'
       8 | #define pr_fmt(fmt) "damon: " fmt
         |                               ^~~
   include/linux/printk.h:501:53: note: expanded from macro 'printk'
     501 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ^~~
   include/linux/printk.h:473:11: note: expanded from macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
>> mm/damon/core.c:1339:16: warning: variable 'nr_regions' set but not used [-Wunused-but-set-variable]
    1339 |         unsigned long nr_regions = 0, access_samples = 0, score_bp;
         |                       ^
   mm/damon/core.c:1358:31: warning: unused variable 'sample_to_aggr_bp' [-Wunused-variable]
    1358 |         unsigned long adaptation_bp, sample_to_aggr_bp;
         |                                      ^~~~~~~~~~~~~~~~~
   3 warnings generated.


vim +/nr_regions +1339 mm/damon/core.c

  1331	
  1332	static unsigned long damon_feed_loop_next_input(unsigned long last_input,
  1333			unsigned long score);
  1334	
  1335	static unsigned long damon_get_intervals_adaptation_bp(struct damon_ctx *c)
  1336	{
  1337		struct damon_target *t;
  1338		struct damon_region *r;
> 1339		unsigned long nr_regions = 0, access_samples = 0, score_bp;
  1340		unsigned long adaptation_bp;
  1341	
  1342		damon_for_each_target(t, c) {
  1343			nr_regions += damon_nr_regions(t);
  1344			damon_for_each_region(r, t)
  1345				access_samples += r->nr_accesses;
  1346		}
  1347		score_bp = access_samples * 10000 / c->attrs.intervals_goal.samples;
  1348		adaptation_bp = damon_feed_loop_next_input(100000000, score_bp) /
  1349			10000;
  1350	
  1351		pr_info("access_samples %lu/%lu, score_bp %lu, adaptation bp %lu\n",
  1352				access_samples, score_bp, adaptation_bp);
  1353		return adaptation_bp;
  1354	}
  1355	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
