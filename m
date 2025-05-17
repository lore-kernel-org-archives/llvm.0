Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561BA1F4601;
	Sat, 17 May 2025 11:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747483180; cv=none; b=RVg3ip6ucSvTrWXv1kxOAv2MfULGb4mNMEZOxdmz2EL/OKjGisbvflu1tFC9C8GqWnm39lRaBAG0k71igiAhGlrXWVveyJ7zzzQrez8KYIj05phiXfZgFlOC82SJbmhOEkpTC2z86aFGxzDN07EJwtPQV4px02tac8FiOpp6Fyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747483180; c=relaxed/simple;
	bh=xXSu6JbmrTcQ/+2pTjJReOP2K/NKOeJrKNa7BRWA3WM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cBjfBkeoxL1l1BbpRD0Y26bjheBtf1JxxET5iwcdlgeBWbmv0FZaE+pyFV4dg7NT9dRAAmBJ8IglCjCqovU73skkFDK/0aWIknq3ymWxU8Zo7n9fYUVQ+2KeBUHE+P5J3ooAmvoJTUYCbJjtacc/nNJEMV15dHU4ZtR1PsXeDPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ku05dS+X; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ku05dS+X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747483178; x=1779019178;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xXSu6JbmrTcQ/+2pTjJReOP2K/NKOeJrKNa7BRWA3WM=;
  b=Ku05dS+XxBVZb4UCeQfgGtFfwDARb8kE9SY+rqDeGAx0PG8uae1Ant9C
   JDhbwx0Q+mtyfA/SSpoPjXpkM4HsjzrP5poIIW99jf2jyHH1TxEOmd/q4
   W89nmH1tctliUORcze533eXdS4orlruZcFKXw2tfCC03MPHaPWVvNWOOR
   e6Fwv0wm29Z6UnqHHVheWig+4l1PRcDqR30R71eq5RBCuv3klaWCVnK5m
   XP4G6pZPORL1my/PEfLialWx+3S6muViWI8OX/+VCml6qs1r6V/LpY3YB
   JooUDeekqvcKjdy3R5sF2dQCCO1mrZPnJsseFOIcU0txVuruUx4IGevR2
   A==;
X-CSE-ConnectionGUID: WaTSR6bKSEmdHpkE6Ldf6Q==
X-CSE-MsgGUID: jScjdLWJRtiO279u/Bw9pQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="60471859"
X-IronPort-AV: E=Sophos;i="6.15,296,1739865600"; 
   d="scan'208";a="60471859"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 04:59:35 -0700
X-CSE-ConnectionGUID: q2mnjH0xRwKpHQWl/2RpqA==
X-CSE-MsgGUID: 5vB52mVPRg2Zz4RVLpS7uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,296,1739865600"; 
   d="scan'208";a="139951236"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 May 2025 04:59:33 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGGCR-000K6h-0L;
	Sat, 17 May 2025 11:59:31 +0000
Date: Sat, 17 May 2025 19:59:06 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 226/227]
 fs/bcachefs/recovery_passes.c:332:6: warning: variable 'in_recovery' is used
 uninitialized whenever 'if' condition is true
Message-ID: <202505171930.jZF5fGGX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   18721b36f18669525c303bf447446e4e9b15e0cc
commit: 5a3a12453df5915843cabc5b95d71fceba433fc7 [226/227] bcachefs: Run recovery passes asynchronously
config: riscv-randconfig-002-20250517 (https://download.01.org/0day-ci/archive/20250517/202505171930.jZF5fGGX-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250517/202505171930.jZF5fGGX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505171930.jZF5fGGX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/recovery_passes.c:332:6: warning: variable 'in_recovery' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     332 |         if (!__recovery_pass_needs_set(c, pass, flags)) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/recovery_passes.c:371:7: note: uninitialized use occurs here
     371 |         if (!in_recovery) {
         |              ^~~~~~~~~~~
   fs/bcachefs/recovery_passes.c:332:2: note: remove the 'if' if its condition is always false
     332 |         if (!__recovery_pass_needs_set(c, pass, flags)) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     333 |                 r->passes_ratelimiting &= ~BIT_ULL(pass);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     334 |                 goto run_async;
         |                 ~~~~~~~~~~~~~~~
     335 |         }
         |         ~
   fs/bcachefs/recovery_passes.c:337:2: note: variable 'in_recovery' is declared here
     337 |         bool in_recovery = test_bit(BCH_FS_in_recovery, &c->flags);
         |         ^
   1 warning generated.


vim +332 fs/bcachefs/recovery_passes.c

   309	
   310	/*
   311	 * For when we need to rewind recovery passes and run a pass we skipped:
   312	 */
   313	int __bch2_run_explicit_recovery_pass(struct bch_fs *c,
   314					      struct printbuf *out,
   315					      enum bch_recovery_pass pass,
   316					      enum bch_run_recovery_pass_flags flags)
   317	{
   318		struct bch_fs_recovery *r = &c->recovery;
   319		int ret = 0;
   320	
   321		lockdep_assert_held(&c->sb_lock);
   322	
   323		bch2_printbuf_make_room(out, 1024);
   324		out->atomic++;
   325	
   326		unsigned long lockflags;
   327		spin_lock_irqsave(&r->lock, lockflags);
   328	
   329		if (!recovery_pass_needs_set(c, pass, flags))
   330			goto out;
   331	
 > 332		if (!__recovery_pass_needs_set(c, pass, flags)) {
   333			r->passes_ratelimiting &= ~BIT_ULL(pass);
   334			goto run_async;
   335		}
   336	
   337		bool in_recovery = test_bit(BCH_FS_in_recovery, &c->flags);
   338		bool rewind = in_recovery && r->curr_pass > pass;
   339	
   340		if ((flags & RUN_RECOVERY_PASS_nopersistent) && in_recovery) {
   341			r->passes_to_run |= BIT_ULL(pass);
   342		} else {
   343			struct bch_sb_field_ext *ext = bch2_sb_field_get(c->disk_sb.sb, ext);
   344			__set_bit_le64(bch2_recovery_pass_to_stable(pass), ext->recovery_passes_required);
   345		}
   346	
   347		if (pass < BCH_RECOVERY_PASS_set_may_go_rw &&
   348		    (!in_recovery || r->curr_pass >= BCH_RECOVERY_PASS_set_may_go_rw)) {
   349			prt_printf(out, "need recovery pass %s (%u), but already rw\n",
   350				   bch2_recovery_passes[pass], pass);
   351			ret = -BCH_ERR_cannot_rewind_recovery;
   352			goto out;
   353		}
   354	
   355		prt_printf(out, "running recovery pass %s (%u), currently at %s (%u)%s\n",
   356			   bch2_recovery_passes[pass], pass,
   357			   bch2_recovery_passes[r->curr_pass], r->curr_pass,
   358			   rewind ? " - rewinding" : "");
   359	
   360		if (test_bit(BCH_FS_in_recovery, &c->flags))
   361			r->passes_to_run |= BIT_ULL(pass);
   362		else if (flags & RUN_RECOVERY_PASS_ratelimit)
   363			r->passes_ratelimiting |= BIT_ULL(pass);
   364	
   365		if (rewind) {
   366			r->next_pass = pass;
   367			r->passes_complete &= (1ULL << pass) >> 1;
   368			ret = -BCH_ERR_restart_recovery;
   369		}
   370	run_async:
   371		if (!in_recovery) {
   372			struct recovery_pass_fn *p = recovery_pass_fns + pass;
   373			if (p->when & PASS_ONLINE)
   374				bch2_run_async_recovery_passes(c);
   375		}
   376	out:
   377		spin_unlock_irqrestore(&r->lock, lockflags);
   378		--out->atomic;
   379		return ret;
   380	}
   381	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
