Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FA019DF94;
	Sat, 28 Sep 2024 06:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727505726; cv=none; b=BJfnn7mFsO/KlJD91PDMFtaE5Hi/26KA6FMJH2ylRiqZKPpOIIGN6kAr0UThjSkeVP97ievdea2Gvq2O6kWFSxI4C65UQcxMZt6QMtCiNSHD2kFDViRwkvlSBTS7DByaRTBD+g26mPwytxUKpz7hVDCFJACXBiNI60OXmkmApeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727505726; c=relaxed/simple;
	bh=Bylns5n1fT35ZTeSGxrZH4yYoCqvVI13kz3gcZYN3p0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RRR6T2mAvQqvANuonjLpe7Hys4EWqagHTQBUHQscpb24aiO9L+CM7vNjID0/eZxOFikePIE6IpnY9pmMAgM5MK7hgfENUDuaPQfNJm43OxJpI9DQP2hE2frxjsbXxQiDP1aCmZmwteUJAzbpS3TUOhCI4h8PUWkofDtWtn6ewY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lUVz5GX3; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lUVz5GX3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727505725; x=1759041725;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bylns5n1fT35ZTeSGxrZH4yYoCqvVI13kz3gcZYN3p0=;
  b=lUVz5GX3grj78xKUHRhP/KZwHeiaxNRFHCRkrp0KapAo0nu4epZxpe7L
   L47oGMsn7OMsWzMnhUUxOLpxbGLHqlWeyFS+qH57XqapFqLU0Pb8qxR2a
   meakGqmpIwHjGMS1wt75DaE6BuEcmav8ueRB67DmS5q+Ol3EPFw8rx5DP
   aHeBU7wYkngkHCr3+Fkz3uCXO4Yl+BQcP7fy8oYVS0ILloMtZzgRJOk1D
   KvWaciYWW/BkcWfjAmZNznqouR+Sqn1OATc4Slw+2bzHsqLWOHpCWJxPI
   pAAHlRGJyqKOEQHaobwbmr0kq0RQ1tq4kPHHu2+vgoEpQYzzdfIeuvMH0
   Q==;
X-CSE-ConnectionGUID: KgpJiMk8TzKBikzhggfnew==
X-CSE-MsgGUID: BWMjzyCtR0SFelzTjhzCow==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="37329242"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="37329242"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 23:42:03 -0700
X-CSE-ConnectionGUID: 40xkr53TQdKVpHtd7xOhOg==
X-CSE-MsgGUID: uysA6x4eRIy6MsVbzAeYPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="72818521"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 27 Sep 2024 23:42:02 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suR9T-000Myh-1W;
	Sat, 28 Sep 2024 06:41:59 +0000
Date: Sat, 28 Sep 2024 14:41:20 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/ibt 6/10] arch/x86/kernel/traps.c:328:7: error:
 call to undeclared function '__do_kernel_cp_fault'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202409281458.omMmG4EU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/ibt
head:   4e155f6fbba48ed677042026d7732c6256ffa166
commit: 5bb9d6530a561f5bec514a4be368cb7c2e36a507 [6/10] x86/traps: Prepare for ENDBR poison UD1 usage
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240928/202409281458.omMmG4EU-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409281458.omMmG4EU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409281458.omMmG4EU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/traps.c:328:7: error: call to undeclared function '__do_kernel_cp_fault'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     328 |                 if (__do_kernel_cp_fault(regs)) {
         |                     ^
   1 error generated.


vim +/__do_kernel_cp_fault +328 arch/x86/kernel/traps.c

   282	
   283	static noinstr bool handle_bug(struct pt_regs *regs)
   284	{
   285		bool handled = false;
   286		int ud_type, ud_len;
   287		s32 ud_imm;
   288	
   289		/*
   290		 * Normally @regs are unpoisoned by irqentry_enter(), but handle_bug()
   291		 * is a rare case that uses @regs without passing them to
   292		 * irqentry_enter().
   293		 */
   294		kmsan_unpoison_entry_regs(regs);
   295		ud_type = decode_bug(regs->ip, &ud_imm, &ud_len);
   296		if (ud_type == BUG_NONE)
   297			return handled;
   298	
   299		/*
   300		 * All lies, just get the WARN/BUG out.
   301		 */
   302		instrumentation_begin();
   303		/*
   304		 * Since we're emulating a CALL with exceptions, restore the interrupt
   305		 * state to what it was at the exception site.
   306		 */
   307		if (regs->flags & X86_EFLAGS_IF)
   308			raw_local_irq_enable();
   309	
   310		switch (ud_type) {
   311		case BUG_UD2:
   312			if (report_bug(regs->ip, regs) == BUG_TRAP_TYPE_WARN ||
   313			    handle_cfi_failure(regs) == BUG_TRAP_TYPE_WARN) {
   314				regs->ip += ud_len;
   315				handled = true;
   316			}
   317			break;
   318	
   319		case BUG_UD1_UBSAN:
   320			if (IS_ENABLED(CONFIG_UBSAN_TRAP)) {
   321				pr_crit("%s at %pS\n",
   322					report_ubsan_failure(regs, ud_imm),
   323					(void *)regs->ip);
   324			}
   325			break;
   326	
   327		case BUG_UD1_ENDBR:
 > 328			if (__do_kernel_cp_fault(regs)) {
   329				regs->ip += ud_len;
   330				handled = true;
   331			}
   332			break;
   333	
   334		default:
   335			break;
   336		}
   337	
   338		if (regs->flags & X86_EFLAGS_IF)
   339			raw_local_irq_disable();
   340		instrumentation_end();
   341	
   342		return handled;
   343	}
   344	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
