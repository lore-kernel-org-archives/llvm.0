Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E3722B8AB;
	Thu, 16 Oct 2025 06:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760594618; cv=none; b=HkP+6gLuUsZb84YKTvDyjyBAVLB0zdoZ1VLDxpAmGpjc0mckYPbgS32pIwY0iLXnodKwLeabeEAnBLpbHVMR3iL/sy6uFPbiVheGqDKmklUttvn5hZAsMh0zs6qc7eT1vy8lZHW7UsDa2rC0HTeILH0UdZa3qK9QdhWSfnv4ZRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760594618; c=relaxed/simple;
	bh=MDfx2xYi9fokxBFaK7pKEBxVX5joY6//H/JfirZFKEc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KlO07seLO0IL1Nsz7zhN/UIFfOkCAYkf/mT+5xSrWCfcUNjn6j3GNoECBcMEh7qPWh/dIzx9Ec3kusxOgqIhf/a4rP7gphEgTj/sRy1mj8EXMWDZVmaZW+Gb/KVhRPhR/O4Kms0JpDuOTRBQ+WjzA4RhXh5noaWI6ODg8/XE5+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YHEjxJwg; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YHEjxJwg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760594616; x=1792130616;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MDfx2xYi9fokxBFaK7pKEBxVX5joY6//H/JfirZFKEc=;
  b=YHEjxJwgScvCnsuZNKz+akvfRTM3n+xFI7xSy1vKtdlmdDIIbdQRSNCM
   XPu+qfegvLM3AsqzmGfovuX9sPMoZ9k7f2YNl4MiQC4CeeHjy/74E1tOB
   G/63Y7rlPNW+AYcMW7jSb5KZ5hi43rzDJbY7iRsAR2duzUPVe/q+27CYB
   BHye0N1uY5HbQMu02AKfkxLA7+fP3sSxOlEeYQIJIQjBVDMs+Q9BhQ3vZ
   zBdXupyOyP/s+YdF03kYlbi7DtfBzn1HenP4qg91A7kGyKIJMy7wFLIjV
   2zyqov0TsMAuHUam3KcXdO8qgJlV7w6vnbVDCGK3MKOL3gsAicoQl0cHt
   Q==;
X-CSE-ConnectionGUID: sowJ+Q0+RNWiyH3ovwq1ag==
X-CSE-MsgGUID: pFFRRI0XRnOJF19EsWR6nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="66640897"
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; 
   d="scan'208";a="66640897"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 23:03:36 -0700
X-CSE-ConnectionGUID: mQMBQLW8TQ2Ytug/ex8aGg==
X-CSE-MsgGUID: OHKQko//RASnIJIm4O/a1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; 
   d="scan'208";a="206070446"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 15 Oct 2025 23:03:34 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9H5I-0004W2-1d;
	Thu, 16 Oct 2025 06:03:32 +0000
Date: Thu, 16 Oct 2025 14:03:14 +0800
From: kernel test robot <lkp@intel.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jonhunter:tegra/next-fixes 3/3] kernel/printk/internal.h:248:36:
 error: use of undeclared identifier 'console_offload_blocked'
Message-ID: <202510161454.Pf7XCiPQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jonhunter/linux tegra/next-fixes
head:   ae173249d9028ef159fba040bdab260d80dda43f
commit: ae173249d9028ef159fba040bdab260d80dda43f [3/3] printk: Avoid scheduling irq_work and kthreads on suspend
config: i386-buildonly-randconfig-003-20251016 (https://download.01.org/0day-ci/archive/20251016/202510161454.Pf7XCiPQ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251016/202510161454.Pf7XCiPQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510161454.Pf7XCiPQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/printk/printk.c:62:
>> kernel/printk/internal.h:248:36: error: use of undeclared identifier 'console_offload_blocked'
     248 |                         if (printk_kthreads_running && !console_offload_blocked)
         |                                                         ^
   kernel/printk/internal.h:258:14: error: use of undeclared identifier 'console_offload_blocked'
     258 |                         else if (!console_offload_blocked)
         |                                   ^
   kernel/printk/internal.h:271:14: error: use of undeclared identifier 'console_offload_blocked'
     271 |                         else if (!console_offload_blocked)
         |                                   ^
   3 errors generated.


vim +/console_offload_blocked +248 kernel/printk/internal.h

   236	
   237	/*
   238	 * Identify which console flushing methods should be used in the context of
   239	 * the caller.
   240	 */
   241	static inline void printk_get_console_flush_type(struct console_flush_type *ft)
   242	{
   243		memset(ft, 0, sizeof(*ft));
   244	
   245		switch (nbcon_get_default_prio()) {
   246		case NBCON_PRIO_NORMAL:
   247			if (have_nbcon_console && !have_boot_console) {
 > 248				if (printk_kthreads_running && !console_offload_blocked)
   249					ft->nbcon_offload = true;
   250				else
   251					ft->nbcon_atomic = true;
   252			}
   253	
   254			/* Legacy consoles are flushed directly when possible. */
   255			if (have_legacy_console || have_boot_console) {
   256				if (!is_printk_legacy_deferred())
   257					ft->legacy_direct = true;
   258				else if (!console_offload_blocked)
   259					ft->legacy_offload = true;
   260			}
   261			break;
   262	
   263		case NBCON_PRIO_EMERGENCY:
   264			if (have_nbcon_console && !have_boot_console)
   265				ft->nbcon_atomic = true;
   266	
   267			/* Legacy consoles are flushed directly when possible. */
   268			if (have_legacy_console || have_boot_console) {
   269				if (!is_printk_legacy_deferred())
   270					ft->legacy_direct = true;
   271				else if (!console_offload_blocked)
   272					ft->legacy_offload = true;
   273			}
   274			break;
   275	
   276		case NBCON_PRIO_PANIC:
   277			/*
   278			 * In panic, the nbcon consoles will directly print. But
   279			 * only allowed if there are no boot consoles.
   280			 */
   281			if (have_nbcon_console && !have_boot_console)
   282				ft->nbcon_atomic = true;
   283	
   284			if (have_legacy_console || have_boot_console) {
   285				/*
   286				 * This is the same decision as NBCON_PRIO_NORMAL
   287				 * except that offloading never occurs in panic.
   288				 *
   289				 * Note that console_flush_on_panic() will flush
   290				 * legacy consoles anyway, even if unsafe.
   291				 */
   292				if (!is_printk_legacy_deferred())
   293					ft->legacy_direct = true;
   294	
   295				/*
   296				 * In panic, if nbcon atomic printing occurs,
   297				 * the legacy consoles must remain silent until
   298				 * explicitly allowed.
   299				 */
   300				if (ft->nbcon_atomic && !legacy_allow_panic_sync)
   301					ft->legacy_direct = false;
   302			}
   303			break;
   304	
   305		default:
   306			WARN_ON_ONCE(1);
   307			break;
   308		}
   309	}
   310	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
