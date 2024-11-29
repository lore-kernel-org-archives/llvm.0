Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC0642AA5;
	Fri, 29 Nov 2024 03:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732850887; cv=none; b=bAslmfC1590er+1+8ooNlr7nUGSghPh3CXZBIdej/qt8Pf4Kms6jgFNBxdPr6Xr0vLM6Cz4GQRZR6YVJN33oRHnlZozAZpzSSL6gvYdznd+Qh/KOS5vH5jcU6j0XG+mzWuH5KAYsD0B2IY2zU/MbaeQTzuHNGK+bJIT13DQxkXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732850887; c=relaxed/simple;
	bh=SqP2dd17BuL0UWqua6pPUEHPsvNTLNkphUMKxypDkNg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MFDC6fxV6KajfJlip0RMY+gqqdvH19914O7IKCJPE5UYDCGdIteqNRFL9aIecrOyD2f86oleXotRVGVqluee6RTit2AGRRsXHGaGJdz2dvM5wEG6m0+KPCoO8bwuxHcS7zrLiq3hcfcESrvLzbF9/49Qb8QC/uRki76ONLOjVvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IoMUONus; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IoMUONus"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732850886; x=1764386886;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SqP2dd17BuL0UWqua6pPUEHPsvNTLNkphUMKxypDkNg=;
  b=IoMUONusDMykekm4j3wqWF8lADWI71U0WeTHYGNaxwaUcyNubC4gOND+
   jDVKfJ/j90RQvi0aE+dmUrRTLG3a4x30Y7IRK504aRAsIRwO9XmzWzajY
   fVmLIswAMMBGErEfKK45nXCs+tKSP02PRL64OOqIdbTEkcuDyO0JWo5DB
   Cjvl4tvQNPR7gAlZ57pYGvF3B4rMDq9/NYRudknjlZ5+mSKR8snR0RzWT
   0X5XSioZuO8P39zZLqfqDxPZhKO6090yxQ8LQDSFZ8/pJthAzHiCxHNxS
   ukobCRZHePUD3o9O1fuBVfnVRYElz3+MR0Kwjwsr1K80vCMBA3v7nQIQv
   w==;
X-CSE-ConnectionGUID: RrJZwWdHRHaAj5Wh8lIlTg==
X-CSE-MsgGUID: OPP9SqPqQMmNOVcQ4IoS4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="36750909"
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="36750909"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 19:28:03 -0800
X-CSE-ConnectionGUID: cvtrns9MQ5G7GuqTRszgcA==
X-CSE-MsgGUID: eWPszb6lRAe2YVBQJKJxtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="123247066"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 Nov 2024 19:28:02 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGrfj-000AIH-1W;
	Fri, 29 Nov 2024 03:27:59 +0000
Date: Fri, 29 Nov 2024 11:27:42 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 142/147] fs/bcachefs/error.c:323:6:
 warning: variable 'exiting' is used uninitialized whenever 'if' condition is
 true
Message-ID: <202411291149.pdeKSqU3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   e7e6724a942234516ca2b1776a32d6741e0bc6ce
commit: 7d937c4d949db9bba45c2d0dd30a59e36ec1e6e4 [142/147] bcachefs: Don't error out when logging fsck error
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20241129/202411291149.pdeKSqU3-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411291149.pdeKSqU3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411291149.pdeKSqU3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/error.c:2:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> fs/bcachefs/error.c:323:6: warning: variable 'exiting' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     323 |         if ((flags & FSCK_AUTOFIX) &&
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~
     324 |             (c->opts.errors == BCH_ON_ERROR_continue ||
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     325 |              c->opts.errors == BCH_ON_ERROR_fix_safe)) {
         |              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/error.c:420:6: note: uninitialized use occurs here
     420 |         if (exiting)
         |             ^~~~~~~
   fs/bcachefs/error.c:323:2: note: remove the 'if' if its condition is always false
     323 |         if ((flags & FSCK_AUTOFIX) &&
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     324 |             (c->opts.errors == BCH_ON_ERROR_continue ||
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     325 |              c->opts.errors == BCH_ON_ERROR_fix_safe)) {
         |              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     326 |                 prt_str(out, ", ");
         |                 ~~~~~~~~~~~~~~~~~~~
     327 |                 if (flags & FSCK_CAN_FIX) {
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~
     328 |                         prt_actioning(out, action);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~
     329 |                         ret = -BCH_ERR_fsck_fix;
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~
     330 |                 } else {
         |                 ~~~~~~~~
     331 |                         prt_str(out, ", continuing");
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     332 |                         ret = -BCH_ERR_fsck_ignore;
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~
     333 |                 }
         |                 ~
     334 | 
     335 |                 goto print;
         |                 ~~~~~~~~~~~
     336 |         } else if (!test_bit(BCH_FS_fsck_running, &c->flags)) {
         |         ~~~~~~
>> fs/bcachefs/error.c:324:7: warning: variable 'exiting' is used uninitialized whenever '||' condition is true [-Wsometimes-uninitialized]
     324 |             (c->opts.errors == BCH_ON_ERROR_continue ||
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/error.c:420:6: note: uninitialized use occurs here
     420 |         if (exiting)
         |             ^~~~~~~
   fs/bcachefs/error.c:324:7: note: remove the '||' if its condition is always false
     324 |             (c->opts.errors == BCH_ON_ERROR_continue ||
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/error.c:405:2: note: variable 'exiting' is declared here
     405 |         bool exiting =
         |         ^
   6 warnings generated.


vim +323 fs/bcachefs/error.c

   322	
 > 323		if ((flags & FSCK_AUTOFIX) &&
 > 324		    (c->opts.errors == BCH_ON_ERROR_continue ||
   325		     c->opts.errors == BCH_ON_ERROR_fix_safe)) {
   326			prt_str(out, ", ");
   327			if (flags & FSCK_CAN_FIX) {
   328				prt_actioning(out, action);
   329				ret = -BCH_ERR_fsck_fix;
   330			} else {
   331				prt_str(out, ", continuing");
   332				ret = -BCH_ERR_fsck_ignore;
   333			}
   334	
   335			goto print;
   336		} else if (!test_bit(BCH_FS_fsck_running, &c->flags)) {
   337			if (c->opts.errors != BCH_ON_ERROR_continue ||
   338			    !(flags & (FSCK_CAN_FIX|FSCK_CAN_IGNORE))) {
   339				prt_str(out, ", shutting down");
   340				inconsistent = true;
   341				ret = -BCH_ERR_fsck_errors_not_fixed;
   342			} else if (flags & FSCK_CAN_FIX) {
   343				prt_str(out, ", ");
   344				prt_actioning(out, action);
   345				ret = -BCH_ERR_fsck_fix;
   346			} else {
   347				prt_str(out, ", continuing");
   348				ret = -BCH_ERR_fsck_ignore;
   349			}
   350		} else if (c->opts.fix_errors == FSCK_FIX_exit) {
   351			prt_str(out, ", exiting");
   352			ret = -BCH_ERR_fsck_errors_not_fixed;
   353		} else if (flags & FSCK_CAN_FIX) {
   354			int fix = s && s->fix
   355				? s->fix
   356				: c->opts.fix_errors;
   357	
   358			if (fix == FSCK_FIX_ask) {
   359				prt_str(out, ", ");
   360				prt_str(out, action);
   361	
   362				if (bch2_fs_stdio_redirect(c))
   363					bch2_print(c, "%s", out->buf);
   364				else
   365					bch2_print_string_as_lines(KERN_ERR, out->buf);
   366				print = false;
   367	
   368				int ask = bch2_fsck_ask_yn(c, trans);
   369	
   370				if (trans) {
   371					ret = bch2_trans_relock(trans);
   372					if (ret) {
   373						mutex_unlock(&c->fsck_error_msgs_lock);
   374						goto err;
   375					}
   376				}
   377	
   378				if (ask >= YN_ALLNO && s)
   379					s->fix = ask == YN_ALLNO
   380						? FSCK_FIX_no
   381						: FSCK_FIX_yes;
   382	
   383				ret = ask & 1
   384					? -BCH_ERR_fsck_fix
   385					: -BCH_ERR_fsck_ignore;
   386			} else if (fix == FSCK_FIX_yes ||
   387				   (c->opts.nochanges &&
   388				    !(flags & FSCK_CAN_IGNORE))) {
   389				prt_str(out, ", ");
   390				prt_actioning(out, action);
   391				ret = -BCH_ERR_fsck_fix;
   392			} else {
   393				prt_str(out, ", not ");
   394				prt_actioning(out, action);
   395			}
   396		} else if (!(flags & FSCK_CAN_IGNORE)) {
   397			prt_str(out, " (repair unimplemented)");
   398		}
   399	
   400		if (ret == -BCH_ERR_fsck_ignore &&
   401		    (c->opts.fix_errors == FSCK_FIX_exit ||
   402		     !(flags & FSCK_CAN_IGNORE)))
   403			ret = -BCH_ERR_fsck_errors_not_fixed;
   404	
   405		bool exiting =
   406			test_bit(BCH_FS_fsck_running, &c->flags) &&
   407			(ret != -BCH_ERR_fsck_fix &&
   408			 ret != -BCH_ERR_fsck_ignore);
   409	
   410		if (exiting)
   411			print = true;
   412	print:
   413		if (print) {
   414			if (bch2_fs_stdio_redirect(c))
   415				bch2_print(c, "%s\n", out->buf);
   416			else
   417				bch2_print_string_as_lines(KERN_ERR, out->buf);
   418		}
   419	
   420		if (exiting)
   421			bch_err(c, "Unable to continue, halting");
   422		else if (suppressing)
   423			bch_err(c, "Ratelimiting new instances of previous error");
   424	
   425		if (s)
   426			s->ret = ret;
   427	
   428		mutex_unlock(&c->fsck_error_msgs_lock);
   429	
   430		if (inconsistent)
   431			bch2_inconsistent_error(c);
   432	
   433		/*
   434		 * We don't yet track whether the filesystem currently has errors, for
   435		 * log_fsck_err()s: that would require us to track for every error type
   436		 * which recovery pass corrects it, to get the fsck exit status correct:
   437		 */
   438		if (flags & FSCK_CAN_FIX) {
   439			if (ret == -BCH_ERR_fsck_fix) {
   440				set_bit(BCH_FS_errors_fixed, &c->flags);
   441			} else {
   442				set_bit(BCH_FS_errors_not_fixed, &c->flags);
   443				set_bit(BCH_FS_error, &c->flags);
   444			}
   445		}
   446	err:
   447		if (action != action_orig)
   448			kfree(action);
   449		printbuf_exit(&buf);
   450		return ret;
   451	}
   452	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
