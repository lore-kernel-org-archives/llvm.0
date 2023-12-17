Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C32B446C6;
	Sun, 17 Dec 2023 14:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g7x+4gTp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702823362; x=1734359362;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BF9ccyfalPHfm6WHRcUNR31kByKQJmhnzESpKKgs9Wg=;
  b=g7x+4gTpQKoQ2UFsHmIJdn8fZOAjIKeUeYQlWfDt56qEcEppiXhsXBCD
   3dS5zZwRV68vZ/zaZzWen3kbwJSyEIf5tVbdusuFXbzVXikir/PPfdx/K
   2rKbVxK8iqzrPuv/SpkEDQJZSihvE8rWAEm6ZOtHXj/dXt5++IML8p/lb
   uh59tCSRUDDJa8EuiULVXDmHOvTxMmr2/nMmaoxbeer/w0Ucg7pdobtHF
   MPZmBaPtGm7gMk9cvFEsRfJHUbXycgF+lrfq9vHL9WLdc9s7JBR4fMrYx
   AAkYxerLzhH1Kzx1Isgv/Imzhu5qs7+nHg/ioCk/DIY4CT77PQ2MTXgQR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="481603903"
X-IronPort-AV: E=Sophos;i="6.04,283,1695711600"; 
   d="scan'208";a="481603903"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2023 06:29:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="809532606"
X-IronPort-AV: E=Sophos;i="6.04,283,1695711600"; 
   d="scan'208";a="809532606"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 17 Dec 2023 06:29:19 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEs8r-00036s-1I;
	Sun, 17 Dec 2023 14:29:17 +0000
Date: Sun, 17 Dec 2023 22:29:07 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kmo@daterainc.com>
Subject: [bcachefs:bcachefs-testing 170/174] fs/bcachefs/btree_gc.c:1990:6:
 warning: variable 'ret' set but not used
Message-ID: <202312172235.bDfQqc6L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   16609653d3eeb730d5a4b5d19266d52f9e7b8ea3
commit: 9eb1d5729fea27a8dc4cea826faa2dadda009508 [170/174] fixup! bcachefs: bch_err_(fn|msg) check if should print
config: i386-buildonly-randconfig-003-20231217 (https://download.01.org/0day-ci/archive/20231217/202312172235.bDfQqc6L-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312172235.bDfQqc6L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312172235.bDfQqc6L-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/btree_gc.c:1990:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
           int ret;
               ^
   1 warning generated.


vim +/ret +1990 fs/bcachefs/btree_gc.c

451570a5bc5f72 Kent Overstreet 2020-06-15  1983  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1984  static int bch2_gc_thread(void *arg)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1985  {
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1986  	struct bch_fs *c = arg;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1987  	struct io_clock *clock = &c->io_clock[WRITE];
2abe542087d9cb Kent Overstreet 2021-01-21  1988  	unsigned long last = atomic64_read(&clock->now);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1989  	unsigned last_kick = atomic_read(&c->kick_gc);
9ca53b55f74157 Kent Overstreet 2018-07-23 @1990  	int ret;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1991  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1992  	set_freezable();
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1993  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1994  	while (1) {
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1995  		while (1) {
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1996  			set_current_state(TASK_INTERRUPTIBLE);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1997  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1998  			if (kthread_should_stop()) {
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1999  				__set_current_state(TASK_RUNNING);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  2000  				return 0;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  2001  			}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  2002  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  2003  			if (atomic_read(&c->kick_gc) != last_kick)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  2004  				break;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  2005  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  2006  			if (c->btree_gc_periodic) {
1c6fdbd8f2465d Kent Overstreet 2017-03-16  2007  				unsigned long next = last + c->capacity / 16;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  2008  
2abe542087d9cb Kent Overstreet 2021-01-21  2009  				if (atomic64_read(&clock->now) >= next)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  2010  					break;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  2011  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  2012  				bch2_io_clock_schedule_timeout(clock, next);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  2013  			} else {
1c6fdbd8f2465d Kent Overstreet 2017-03-16  2014  				schedule();
1c6fdbd8f2465d Kent Overstreet 2017-03-16  2015  			}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  2016  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  2017  			try_to_freeze();
1c6fdbd8f2465d Kent Overstreet 2017-03-16  2018  		}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  2019  		__set_current_state(TASK_RUNNING);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  2020  
2abe542087d9cb Kent Overstreet 2021-01-21  2021  		last = atomic64_read(&clock->now);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  2022  		last_kick = atomic_read(&c->kick_gc);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  2023  
451570a5bc5f72 Kent Overstreet 2020-06-15  2024  		/*
451570a5bc5f72 Kent Overstreet 2020-06-15  2025  		 * Full gc is currently incompatible with btree key cache:
451570a5bc5f72 Kent Overstreet 2020-06-15  2026  		 */
451570a5bc5f72 Kent Overstreet 2020-06-15  2027  #if 0
5b593ee172bd53 Kent Overstreet 2021-01-26  2028  		ret = bch2_gc(c, false, false);
451570a5bc5f72 Kent Overstreet 2020-06-15  2029  #else
451570a5bc5f72 Kent Overstreet 2020-06-15  2030  		ret = bch2_gc_gens(c);
451570a5bc5f72 Kent Overstreet 2020-06-15  2031  #endif
1c6fdbd8f2465d Kent Overstreet 2017-03-16  2032  		debug_check_no_locks_held();
1c6fdbd8f2465d Kent Overstreet 2017-03-16  2033  	}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  2034  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  2035  	return 0;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  2036  }
1c6fdbd8f2465d Kent Overstreet 2017-03-16  2037  

:::::: The code at line 1990 was first introduced by commit
:::::: 9ca53b55f7415783c6cc8b751c99f2af6cc0a932 bcachefs: gc now operates on second set of bucket marks

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
