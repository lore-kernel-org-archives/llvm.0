Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EED7E0E8;
	Fri,  1 Aug 2025 01:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754012943; cv=none; b=EazzwI3eFO4amluXVWJO9ET9E0DfWMyDLa3N3fXzmICK+WFn93Ey3+4fQxK4THDlkch4cMj6exil9mG16GbxWntHuVW6NU1VqCayS94B/vS19pVbG/rsYtrEuxMxS+eaDlUALrk6nM7/rUG3UJW5KLxXyuriT14Jx9pSK3fiYNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754012943; c=relaxed/simple;
	bh=tAXANu5VlV4jOXDZ+wlt1GDOt5duHV5o2d8uZ4PvjCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gQTW8mb+TavKiCHa1iFmr4p0XlhoMvbg2NlyCv0TyD90oWgv8c/HLdLbu275b2shWYb5+m1Vom9/mBA7ms/oZWqIt/xBfo0ckFqc0Req485ftrS9DqT8ptzqY0ma6PPdfZ3seijiVQWmP8XuH4OEQT47atH2mTao2xZdLd0OLQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SnsEmRgN; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SnsEmRgN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754012943; x=1785548943;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tAXANu5VlV4jOXDZ+wlt1GDOt5duHV5o2d8uZ4PvjCY=;
  b=SnsEmRgNXCXJIo/r+Yg8Y+go0sQWJXyHkhHxaoboQOOzULaH1o00Eix4
   0MjIoDiZGY1St4FnyjsPaO92m29nw22DsuPsjipwC2Ow3cy+hgY+7GSQz
   Do9htsIq19nLn/RunW9DnTV/nUWT2NjY/lTrqRes1OJ4fd82oZgFdIV2e
   6h3NowFXW7stiC/hvKKqQkuwYBLs16Pt27wEaffUZG/cmCxrLlOOmrfgH
   2f/cFE1jzltjJpoMP0bgeA6rO1xumxSnc6ZmCRJR4liHxULeBVtnm8QJZ
   x6hh6jXGyt0wIO5h/BI6MeMQNJMkCERm9H1ku3ItCFl0hFTEr3ygANJL3
   w==;
X-CSE-ConnectionGUID: ygdiSJaHT/umRC3CQUhUqw==
X-CSE-MsgGUID: NqvD/XAqTuu2DjlKz+15ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="78899929"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="78899929"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 18:49:01 -0700
X-CSE-ConnectionGUID: LY3prxlqRp2eXJE99wA4Bw==
X-CSE-MsgGUID: 9QbZGZXnRkC7WV7LvE815g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="194256458"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 31 Jul 2025 18:48:58 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhetD-0004HY-1M;
	Fri, 01 Aug 2025 01:48:55 +0000
Date: Fri, 1 Aug 2025 09:48:40 +0800
From: kernel test robot <lkp@intel.com>
To: Aaron Lu <ziqianlu@bytedance.com>,
	"Paul E. McKenney" <paulmck@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	John Stultz <jstultz@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clocksource: Use correct limit for wd-cs-wd read back
 delay in printing
Message-ID: <202508010911.AmkxEw1p-lkp@intel.com>
References: <20250731120454.GA309@bytedance>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250731120454.GA309@bytedance>

Hi Aaron,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/timers/core]
[also build test WARNING on linus/master v6.16 next-20250731]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aaron-Lu/clocksource-Use-correct-limit-for-wd-cs-wd-read-back-delay-in-printing/20250731-200709
base:   tip/timers/core
patch link:    https://lore.kernel.org/r/20250731120454.GA309%40bytedance
patch subject: [PATCH] clocksource: Use correct limit for wd-cs-wd read back delay in printing
config: i386-buildonly-randconfig-001-20250801 (https://download.01.org/0day-ci/archive/20250801/202508010911.AmkxEw1p-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250801/202508010911.AmkxEw1p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508010911.AmkxEw1p-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/time/clocksource.c:293:43: warning: format specifies type 'long' but the argument has type 'int64_t' (aka 'long long') [-Wformat]
     292 |         pr_warn("timekeeping watchdog on CPU%d: wd-%s-wd excessive read-back delay of %lldns vs. limit of %ldns, wd-wd read-back delay only %lldns, attempt %d, marking %s unstable\n",
         |                                                                                                           ~~~
         |                                                                                                           %lld
     293 |                 smp_processor_id(), cs->name, wd_delay, md + cs->uncertainty_margin, wd_seq_delay, nretries, cs->name);
         |                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:560:37: note: expanded from macro 'pr_warn'
     560 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                                    ~~~     ^~~~~~~~~~~
   include/linux/printk.h:507:60: note: expanded from macro 'printk'
     507 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:479:19: note: expanded from macro 'printk_index_wrap'
     479 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   1 warning generated.


vim +293 kernel/time/clocksource.c

   252	
   253	static enum wd_read_status cs_watchdog_read(struct clocksource *cs, u64 *csnow, u64 *wdnow)
   254	{
   255		int64_t md = 2 * watchdog->uncertainty_margin;
   256		unsigned int nretries, max_retries;
   257		int64_t wd_delay, wd_seq_delay;
   258		u64 wd_end, wd_end2;
   259	
   260		max_retries = clocksource_get_max_watchdog_retry();
   261		for (nretries = 0; nretries <= max_retries; nretries++) {
   262			local_irq_disable();
   263			*wdnow = watchdog->read(watchdog);
   264			*csnow = cs->read(cs);
   265			wd_end = watchdog->read(watchdog);
   266			wd_end2 = watchdog->read(watchdog);
   267			local_irq_enable();
   268	
   269			wd_delay = cycles_to_nsec_safe(watchdog, *wdnow, wd_end);
   270			if (wd_delay <= md + cs->uncertainty_margin) {
   271				if (nretries > 1 && nretries >= max_retries) {
   272					pr_warn("timekeeping watchdog on CPU%d: %s retried %d times before success\n",
   273						smp_processor_id(), watchdog->name, nretries);
   274				}
   275				return WD_READ_SUCCESS;
   276			}
   277	
   278			/*
   279			 * Now compute delay in consecutive watchdog read to see if
   280			 * there is too much external interferences that cause
   281			 * significant delay in reading both clocksource and watchdog.
   282			 *
   283			 * If consecutive WD read-back delay > md, report
   284			 * system busy, reinit the watchdog and skip the current
   285			 * watchdog test.
   286			 */
   287			wd_seq_delay = cycles_to_nsec_safe(watchdog, wd_end, wd_end2);
   288			if (wd_seq_delay > md)
   289				goto skip_test;
   290		}
   291	
   292		pr_warn("timekeeping watchdog on CPU%d: wd-%s-wd excessive read-back delay of %lldns vs. limit of %ldns, wd-wd read-back delay only %lldns, attempt %d, marking %s unstable\n",
 > 293			smp_processor_id(), cs->name, wd_delay, md + cs->uncertainty_margin, wd_seq_delay, nretries, cs->name);
   294		return WD_READ_UNSTABLE;
   295	
   296	skip_test:
   297		pr_info("timekeeping watchdog on CPU%d: %s wd-wd read-back delay of %lldns\n",
   298			smp_processor_id(), watchdog->name, wd_seq_delay);
   299		pr_info("wd-%s-wd read-back delay of %lldns, clock-skew test skipped!\n",
   300			cs->name, wd_delay);
   301		return WD_READ_SKIP;
   302	}
   303	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
