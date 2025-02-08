Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353C11E4A9;
	Sat,  8 Feb 2025 12:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739017916; cv=none; b=J08uufwwOqjxL76rcmHMGnYNtlA2+tqdvPvmPiSFWNlWgEiFGlFBd/A7WVvRyOfsodTKooPnAioNfo91B3s0orwCtDvcgduxCYdc+gpJuUQ0fh+XstGEmwmBxpHUDxoZX2svARh4D2OpqUExoKIZD6u7HTPUufTnOQLh7IZzfxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739017916; c=relaxed/simple;
	bh=h/qzg3EI7NJZ+l8m7U67Kuca6fap48fMnktRAp+O9Wg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UQDFiltKBVbyOzMpSWGo/to+zTg9kaGLTcXZa5TMTL3y9i6bx6Gm3vVd0AcVaNko480OSxBH4wRweMipSKRcsHu6SbAJBtFw6H//aUxNxoBjVxpOhT/cM5rKqHQPR+/d9HUp3TuADLqIvo7lu5ZEK4t44EAcGbbyoCZRmP9wjsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FFPj+kF+; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FFPj+kF+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739017914; x=1770553914;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h/qzg3EI7NJZ+l8m7U67Kuca6fap48fMnktRAp+O9Wg=;
  b=FFPj+kF+oA/XY+jTOxKjizwYvgk0kJ4C7FI8PVqh2LGS0vQFNa/TTnea
   YKr7z2lVoMcw3S2dKRrO701FR7DuWvqTE5ZMajkHWrP2sCGGNIDNH083g
   y9cc07IL9M1M6DaENPc4x0TWSIbXxYGjNnn5KTD5k6XHajWevEN210CIc
   xuZBq9mB27uiDX6hSC3ySYSuAJKM7ivDQcnfa5DGeGrN6tXtJ52B16wUb
   fVyu8mSu95W1B4btq4ko+p9dbPdo4+oAR3kOgHfpbyfmH7CpQ1OiebKpL
   jl9SGIGninFbuqZo6AH1BLfdEdQObx6X3VTDUKqCVISqY3JWlZRY6Oe/4
   Q==;
X-CSE-ConnectionGUID: 7BU2ju3pTdqbEIwB3K2uCQ==
X-CSE-MsgGUID: 7bSQ8wPdQj+mgXz1zHGPRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="38851357"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="38851357"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 04:31:53 -0800
X-CSE-ConnectionGUID: eE6ArFqhQQGAfGdrAKP1dQ==
X-CSE-MsgGUID: k3dlALNKQSag6Vn9YA1+lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="111716389"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Feb 2025 04:31:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgjzx-000zxf-2X;
	Sat, 08 Feb 2025 12:31:49 +0000
Date: Sat, 8 Feb 2025 20:31:48 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Vyukov <dvyukov@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dvyukov:dvyukov-rseq-pkey 3/3] kernel/rseq.c:406:2: error: use of
 undeclared identifier 'pkey_reg_t'
Message-ID: <202502082027.9ojuhmXl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/dvyukov/linux dvyukov-rseq-pkey
head:   b991732d23294a961eed6a4a2758c16f0430de9c
commit: b991732d23294a961eed6a4a2758c16f0430de9c [3/3] rseq: Make rseq work with protection keys
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20250208/202502082027.9ojuhmXl-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 6807164500e9920638e2ab0cdb4bf8321d24f8eb)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502082027.9ojuhmXl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502082027.9ojuhmXl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/rseq.c:406:2: error: use of undeclared identifier 'pkey_reg_t'
     406 |         pkey_reg_t saved;
         |         ^
   kernel/rseq.c:426:3: error: call to undeclared function 'write_pkey_reg'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     426 |                 write_pkey_reg(saved);
         |                 ^
>> kernel/rseq.c:426:18: error: use of undeclared identifier 'saved'
     426 |                 write_pkey_reg(saved);
         |                                ^
   kernel/rseq.c:455:3: error: use of undeclared identifier 'saved'
     455 |                 saved = switch_to_permissive_pkey_reg();
         |                 ^
   kernel/rseq.c:455:11: error: call to undeclared function 'switch_to_permissive_pkey_reg'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     455 |                 saved = switch_to_permissive_pkey_reg();
         |                         ^
   kernel/rseq.c:458:18: error: use of undeclared identifier 'saved'
     458 |                 write_pkey_reg(saved);
         |                                ^
   6 errors generated.


vim +/pkey_reg_t +406 kernel/rseq.c

   390	
   391	/*
   392	 * This resume handler must always be executed between any of:
   393	 * - preemption,
   394	 * - signal delivery,
   395	 * and return to user-space.
   396	 *
   397	 * This is how we can ensure that the entire rseq critical section
   398	 * will issue the commit instruction only if executed atomically with
   399	 * respect to other threads scheduled on the same CPU, and with respect
   400	 * to signal handlers.
   401	 */
   402	void __rseq_handle_notify_resume(struct ksignal *ksig, struct pt_regs *regs)
   403	{
   404		struct task_struct *t = current;
   405		int ret, sig;
 > 406		pkey_reg_t saved;
   407		bool switched_pkey_reg = false;
   408	
   409		if (unlikely(t->flags & PF_EXITING))
   410			return;
   411	
   412	retry:
   413		/*
   414		 * regs is NULL if and only if the caller is in a syscall path.  Skip
   415		 * fixup and leave rseq_cs as is so that rseq_sycall() will detect and
   416		 * kill a misbehaving userspace on debug kernels.
   417		 */
   418		if (regs) {
   419			ret = rseq_ip_fixup(regs);
   420			if (unlikely(ret < 0))
   421				goto error;
   422		}
   423		if (unlikely(rseq_update_cpu_node_id(t)))
   424			goto error;
   425		if (switched_pkey_reg)
 > 426			write_pkey_reg(saved);
   427		return;
   428	
   429	error:
   430		/*
   431		 * If the application registers rseq, and ever switches to another
   432		 * pkey protection (such that the rseq becomes inaccessible), then
   433		 * any context switch will cause failure here attemping to read/write
   434		 * struct rseq and/or rseq_cs. Since context switches are
   435		 * asynchronous and are outside of the application control
   436		 * (not part of the restricted code scope), we temporarily switch
   437		 * to premissive pkey register to read/write rseq/rseq_cs,
   438		 * similarly to signal delivery.
   439		 *
   440		 * We don't bother to check if the failure really happened due to
   441		 * pkeys or not, since it does not matter (performance-wise and
   442		 * otherwise).
   443		 *
   444		 * If the restricted code installs rseq_cs in inaccessible to it
   445		 * due to pkeys page, we still let this function read the rseq_cs.
   446		 * It's unclear what benefits the resticted code gets by doing this
   447		 * (it probably already hijacked control flow at this point), and
   448		 * presumably any sane sandbox should prohibit restricted code
   449		 * from accessing struct rseq, and this is still better than
   450		 * terminating the app unconditionally (it always has a choice
   451		 * of not using rseq and pkeys together).
   452		 */
   453		if (!switched_pkey_reg) {
   454			switched_pkey_reg = true;
   455			saved = switch_to_permissive_pkey_reg();
   456			goto retry;
   457		} else {
   458			write_pkey_reg(saved);
   459		}
   460		sig = ksig ? ksig->sig : 0;
   461		force_sigsegv(sig);
   462	}
   463	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
