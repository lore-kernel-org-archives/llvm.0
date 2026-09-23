Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EFF4746A6;
	Wed, 23 Sep 2026 21:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790199282; cv=none; b=hd2jdNxUc2cNaj/bli+lbAQm5vhOP9mR3XD75pAw/B5nod43hKW4zNBzg6szVuP1TncJwdKX3vJo5mjjV0g9Z3OiWNNjS/+roSAqyVLjHXYyJpyf4lYOlg0Nxorj7FXjdxwYFpLl7eDKNX9wGihg5jHavvqpnSp0ihJE5rxaWpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790199282; c=relaxed/simple;
	bh=U5S19zmwqx0oEb2rBpNRd71KBllLnYsYGSYHgKwcdU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nCTvj1UoGCX2QbhQtEdkZhG3lVTXPvJxgiMhg5acnHVWxbIywd26hgHETmlhZXxox4sG3iDYxA2tSp8vRuVqw4iOp6Mvydtx67sUFrBWbbQziRO4RCXWl0cCo8wBvQJaW0AWGHZnahnP3sshloFELQWZAhJs4ICI8ona1iSlVnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J/q8JC9P; arc=none smtp.client-ip=192.198.163.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J/q8JC9P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790199280; x=1821735280;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=U5S19zmwqx0oEb2rBpNRd71KBllLnYsYGSYHgKwcdU8=;
  b=J/q8JC9PCstrn0g4LxKxjtnnuHWNg+mxJZHpoJqi+dtgL7NaR8zmJPcM
   +oJCsi6mhiTKJCwyEeAj5XV2NIYmHOx+7IspiJnrTc+D61firECeMM0kf
   yxZs1vVidFgl4X9pCy9tPAe00z7RqOVCGHeD6W2s/e+Aau+eVK01ux5E2
   w+MFFHnk1MWQg655ciV8cQbNacZyxW/zjIivCqIv0CMLBufaCMVA1etXf
   ugHaoUW8ckUXoNASJ6LVyJyzwp++nbE2nFNnlY2IsjOO+xF8XmbuSqCq6
   AZvFRH4AHcHq+xtL0rcsd7Y4KeYyuwRHIsMc3W38egB1ngSf64Ty1rwck
   A==;
X-CSE-ConnectionGUID: MkXBgygSQX+M9fDLzT68Ww==
X-CSE-MsgGUID: IxKfVdb4S7+mIwD5c2MmoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="1443891"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="1443891"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 14:34:39 -0700
X-CSE-ConnectionGUID: A8DHmYN3RISLRUbZzHealw==
X-CSE-MsgGUID: P6zt4owoRta11HlhrTRQAg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 23 Sep 2026 14:34:37 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9Ubq-00000000HoQ-27Cw;
	Wed, 23 Sep 2026 21:34:34 +0000
Date: Thu, 24 Sep 2026 05:34:32 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?B?5p6X5r+s5ZOy?= <m18667909625@163.com>,
	Petr Mladek <pmladek@suse.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-kernel@vger.kernel.org, m18667909625@163.com
Subject: Re: [PATCH] printk: fold consecutive duplicate messages
Message-ID: <202609240518.RU2loaID-lkp@intel.com>
References: <20260921050304.73440-1-m18667909625@163.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260921050304.73440-1-m18667909625@163.com>

Hi 林濬哲,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v7.3-rc4 next-20260922]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/printk-fold-consecutive-duplicate-messages/20260921-130304
base:   linus/master
patch link:    https://lore.kernel.org/r/20260921050304.73440-1-m18667909625%40163.com
patch subject: [PATCH] printk: fold consecutive duplicate messages
config: hexagon-allnoconfig (https://download.01.org/0day-ci/archive/20260924/202609240518.RU2loaID-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 6e714c8d91116794cb699cdf80c26afe9cda3ef3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609240518.RU2loaID-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609240518.RU2loaID-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/printk/printk.c:158:7: warning: variable 'n' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     158 |                 if (dedup_repeat >= 10 ||
         |                     ^~~~~~~~~~~~~~~~~~~~~
     159 |                     now - dedup_window_start > PRINTK_DEDUP_WINDOW_NS) {
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/printk/printk.c:187:6: note: uninitialized use occurs here
     187 |         if (n)
         |             ^
   kernel/printk/printk.c:158:3: note: remove the 'if' if its condition is always true
     158 |                 if (dedup_repeat >= 10 ||
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
     159 |                     now - dedup_window_start > PRINTK_DEDUP_WINDOW_NS) {
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     160 |                         n = dedup_repeat;
     161 |                         dedup_repeat = 0;
     162 |                         dedup_window_start = now;
     163 |                         drop = false;
     164 |                 } else {
         |                   ~~~~~~
     165 |                         drop = true;
         |                         ~~~~~~~~~~~~
     166 |                 }
         |                 ~
   kernel/printk/printk.c:140:7: note: initialize the variable 'n' to silence this warning
     140 |         u32 n;
         |              ^
         |               = 0
   1 warning generated.


vim +158 kernel/printk/printk.c

   124	
   125	/*
   126	 * Detect consecutive duplicate printk messages and fold them away.
   127	 * Returns true if this message should be dropped.
   128	 *
   129	 * The dedup key is built from facility, level and the format string.
   130	 * Format parameters are intentionally not part of the key: va_list
   131	 * can only be consumed once, and hashing rendered text would put
   132	 * string comparisons on the printk fast path.
   133	 */
   134	static bool outputs_dedupe(int facility, int level, const char *fmt)
   135	{
   136		unsigned long flags;
   137		bool drop;
   138		u64 now;
   139		u32 key;
   140		u32 n;
   141	
   142		/* error and above must never be folded */
   143		if (level <= LOGLEVEL_ERR || !printk_dedup)
   144			return false;
   145	
   146		key = hash_64((unsigned long)(fmt ? : ""), 32) ^
   147		      hash_32(facility ^ level, 32);
   148		now = ktime_get_ns();
   149	
   150		raw_spin_lock_irqsave(&dedup_lock, flags);
   151	
   152		if (dedup_active && key == dedup_last_key) {
   153			dedup_repeat++;
   154			/*
   155			 * Force a flush when 10 repeats have accumulated or
   156			 * the 1s window has elapsed, so the summary shows up.
   157			 */
 > 158			if (dedup_repeat >= 10 ||
   159			    now - dedup_window_start > PRINTK_DEDUP_WINDOW_NS) {
   160				n = dedup_repeat;
   161				dedup_repeat = 0;
   162				dedup_window_start = now;
   163				drop = false;
   164			} else {
   165				drop = true;
   166			}
   167		} else {
   168			if (dedup_active && dedup_repeat) {
   169				n = dedup_repeat;
   170				drop = false;
   171			} else {
   172				n = 0;
   173				drop = false;
   174			}
   175			dedup_last_key = key;
   176			dedup_repeat = 0;
   177			dedup_window_start = now;
   178			dedup_active = true;
   179		}
   180	
   181		raw_spin_unlock_irqrestore(&dedup_lock, flags);
   182	
   183		/*
   184		 * Print only after dropping the lock: pr_info() re-enters
   185		 * vprintk_emit() and would deadlock on dedup_lock otherwise.
   186		 */
   187		if (n)
   188			pr_info("last message repeated %u times\n", n);
   189	
   190		return drop;
   191	}
   192	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
